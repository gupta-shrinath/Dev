import 'dart:io';

import 'package:cpu_reader/cpu_reader.dart';
import 'package:dev/utils/android_battery_stream.dart';
import 'package:dev/utils/platform_specification.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:disk_space/disk_space.dart';
import 'package:flutter/services.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:system_info/system_info.dart';

/// Defines all the system information related methods for android platform
class AndroidSpecification implements PlatformSpecification {
  final DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();
  AndroidDeviceInfo? _androidInfo;
  static final AndroidSpecification _androidSpecification =
      AndroidSpecification._internal();

  factory AndroidSpecification() => _androidSpecification;

  AndroidSpecification._internal();

  /// Returns a map which contains processor details
  ///
  /// Reads the /proc/cpuinfo file in android system
  /// which emits line hardware : Hardware : YOUR_PROCESSOR_NAME
  /// Implemented using Platform Channel learn.droid.dev/processor
  /// It also uses cpu_reader package
  @override
  Future<Map<String, dynamic>> getProcessorSpecifications() async {
    _androidInfo ??= await _deviceInfo.androidInfo;
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
      throw Exception('Failed to get processor Name');
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
  /// from device_info package
  @override
  Future<Map<String, dynamic>> getDeviceSpecifications() async {
    _androidInfo ??= await _deviceInfo.androidInfo;
    return {
      'Model': _androidInfo?.model,
      'Product': _androidInfo?.product,
      'Device': _androidInfo?.device,
      'Board': _androidInfo?.board,
      'Manufacturer': _androidInfo?.manufacturer,
    };
  }

  /// Returns a map which contains OS details from device_info package
  @override
  Future<Map<String, dynamic>> getOperatingSystemSpecifications() async {
    _androidInfo ??= await _deviceInfo.androidInfo;
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
  ///
  /// [AndroidBatteryStream] which uses battery_info package
  @override
  Stream<Map<String, dynamic>>? getBatterySpecifications([stream]) {
    return AndroidBatteryStream().getBatteryInfoStream(stream);
  }

  /// Returns a map which contains wifi details using network_info package
  @override
  Future<Map<String, dynamic>> getWifiNetworkSpecifications() async {
    final NetworkInfo _networkInfo = NetworkInfo();
    var name = await _networkInfo
        .getWifiBSSID()
        .onError((error, stackTrace) => error.toString());
    var bssid = await _networkInfo
        .getWifiBSSID()
        .onError((error, stackTrace) => error.toString());
    var broadcast = await _networkInfo
        .getWifiBroadcast()
        .onError((error, stackTrace) => error.toString());
    var ipv4 = await _networkInfo
        .getWifiIP()
        .onError((error, stackTrace) => error.toString());
    var ipv6 = await _networkInfo
        .getWifiIPv6()
        .onError((error, stackTrace) => error.toString());
    var subnet = await _networkInfo
        .getWifiSubmask()
        .onError((error, stackTrace) => error.toString());
    var gateway = await _networkInfo
        .getWifiGatewayIP()
        .onError((error, stackTrace) => error.toString());
    return {
      'Name': name,
      'BSSID': bssid,
      'Broadcast': broadcast,
      'IPv4': ipv4,
      'IPv6': ipv6,
      'Subnet Mask': subnet,
      'Gateway': gateway,
    };
  }

  /// Returns a map which contains memory details using system_info package
  @override
  Map<String, dynamic> getMemorySpecifications() {
    const int megaByte = 1024 * 1024;
    return {
      'Physical Memory':
          '${(SysInfo.getTotalPhysicalMemory() ~/ megaByte / 1000).toStringAsFixed(2)} GB',
      'Free Physical Memory':
          '${(SysInfo.getFreePhysicalMemory() ~/ megaByte / 1000).toStringAsFixed(2)} GB',
      'Virtual Memory':
          '${(SysInfo.getTotalVirtualMemory() ~/ megaByte / 1000).toStringAsFixed(2)} GB',
      'Free Virtual Memory':
          '${(SysInfo.getFreeVirtualMemory() ~/ megaByte / 1000).toStringAsFixed(2)} GB',
    };
  }

  /// Returns a map which contains disk details using disk_space package
  @override
  Future<Map<String, dynamic>> getDiskSpecifications() async {
    List<Directory> directories;
    directories = (await getExternalStorageDirectories())!;
    directories.removeAt(0);
    Map<String, dynamic> storageDetails = {};
    storageDetails.addAll({
      'Total Internal Storage':
          ((await DiskSpace.getTotalDiskSpace)! / 1000).toStringAsFixed(2) +
              ' GB',
      'Free Internal Storage':
          ((await DiskSpace.getFreeDiskSpace)! / 1000).toStringAsFixed(2) +
              ' GB',
    });
    for (var directory in directories) {
      var space =
          ((await DiskSpace.getFreeDiskSpaceForPath(directory.path))! / 1000)
                  .toStringAsFixed(2) +
              ' GB';
      storageDetails.addAll({
        directory.path.split('/')[2]: space,
      });
    }
    return storageDetails;
  }
}
