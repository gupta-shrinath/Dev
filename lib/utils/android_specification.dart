import 'dart:io';

import 'package:battery_plus/battery_plus.dart';
import 'package:cpu_reader/cpu_reader.dart';
import 'package:dev/utils/platform_specification.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';
import 'package:network_info_plus/network_info_plus.dart';

class AndroidSpecification extends PlatformSpecification {
  DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();
  AndroidDeviceInfo? _androidInfo;

  @override
  Future<Map<String, dynamic>> getProcessorSpecifications() async {
    if (_androidInfo == null) {
      _androidInfo = await _deviceInfo.androidInfo;
    }
    var cpuReader = await CpuReader.cpuInfo;
    var frequenciesList = cpuReader.minMaxFrequencies!.entries
        .map((e) => '${e.value.min} - ${e.value.max} MHZ')
        .toList();
    var frequencies = '';
    for (var frequency in frequenciesList) {
      frequencies += frequency;
      frequencies += '\n';
    }
    String? processorName = '';
    const platform = MethodChannel('learn.droid.dev/processor');
    try {
      processorName = await platform.invokeMethod('getProcessorName');
      processorName = processorName!.split(':')[1];
    } catch (e) {
      print('Failed to get processor Name');
    }
    if (processorName == '') {
      processorName = _androidInfo!.hardware;
    }
    return {
      'Hardware': processorName,
      'Cores': Platform.numberOfProcessors.toString(),
      'Frequencies': frequencies,
      'ABI': cpuReader.abi,
      'Temperature': cpuReader.cpuTemperature.toString(),
    };
  }

  @override
  Future<Map<String, dynamic>> getDeviceSpecifications() async {
    if (_androidInfo == null) {
      _androidInfo = await _deviceInfo.androidInfo;
    }
    return {
      'Model': _androidInfo?.model,
      'Product': _androidInfo?.product,
      'Device': _androidInfo?.device,
      'Board': _androidInfo?.board,
      'Manufacturer': _androidInfo?.manufacturer,
    };
  }

  @override
  Future<Map<String, dynamic>> getOperatingSystemSpecifications() async {
    if (_androidInfo == null) {
      _androidInfo = await _deviceInfo.androidInfo;
    }
    return {
      'Android Version': _androidInfo?.version.release,
      'API': _androidInfo?.version.sdkInt,
      'Security Patch': _androidInfo?.version.securityPatch,
      'Fingerprint': _androidInfo?.fingerprint,
      'Instruction Sets': _androidInfo?.supportedAbis.toString(),
      'Bootloader': _androidInfo?.bootloader,
    };
  }

  @override
  Future<Map<String, dynamic>> getBatterySpecifications() async {
    var _battery = Battery();
    var _batteryLevel = await _battery.batteryLevel;
    return {
      'battery_level': _batteryLevel,
    };
  }

  @override
  Future<Map<String, dynamic>> getWifiNetworkSpecifications() async {
    final NetworkInfo _networkInfo = NetworkInfo();
    return {
      'Name': await _networkInfo.getWifiName(),
      'BSSID': await _networkInfo.getWifiBSSID(),
      'Broadcast': await _networkInfo.getWifiBroadcast(),
      'IPv4': await _networkInfo.getWifiIP(),
      'IPv6': await _networkInfo.getWifiIPv6(),
      'Subnet Mask': await _networkInfo.getWifiSubmask(),
      'Gateway': await _networkInfo.getWifiGatewayIP(),
    };
  }
}
