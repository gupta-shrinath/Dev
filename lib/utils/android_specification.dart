import 'dart:io';

import 'package:battery_plus/battery_plus.dart';
import 'package:cpu_reader/cpu_reader.dart';
import 'package:dev/utils/platform_specification.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';
import 'package:network_info_plus/network_info_plus.dart';

/// Defines all the system information related methods for android platform
class AndroidSpecification extends PlatformSpecification {
  /// device_info_plus package classes to get system information
  DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();
  AndroidDeviceInfo? _androidInfo;

  /// Returns a map which contains processor details
  ///
  /// Reads the /proc/cpuinfo file in android system
  /// which emits line hardware : YOUR_PROCESSOR_NAME
  /// Implemented using Platform Channel
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

  /// Returns a map which contains model, manufacturer and other details
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

  /// Returns a map which contains OS details
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

  /// Returns a map which contains battery details
  @override
  Future<Map<String, dynamic>> getBatterySpecifications() async {
    var _battery = Battery();
    return {
      'battery_level': await _battery.batteryLevel,
    };
  }

  /// Returns a map which contains wifi details
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
