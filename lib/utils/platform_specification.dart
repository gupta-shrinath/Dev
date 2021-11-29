import 'dart:io';

import 'package:dev/utils/android/android_specification.dart';
import 'package:dev/utils/linux/linux_specification.dart';

/// Defines methods that needs to run on every platform
abstract class PlatformSpecification {
  /// Returns a map which contains processor details
  Future<Map<String, dynamic>> getProcessorSpecifications();

  /// Returns a map which contains model, manufacturer and other details
  Future<Map<String, dynamic>> getDeviceSpecifications();

  /// Returns a map which contains OS details
  Future<Map<String, dynamic>> getOperatingSystemSpecifications();

  /// Returns a map which contains battery details
  dynamic getBatterySpecifications([_]);

  /// Returns a map which contains wifi details
  Future<Map<String, dynamic>> getWifiNetworkSpecifications();

  /// Returns a map which contains memory details
  Map<String, dynamic> getMemorySpecifications();

  /// Returns a map which contains disk details
  Future<Map<String, dynamic>> getDiskSpecifications();

  /// Returns platform dependent platform specification instance
  ///
  /// If platform is not implemented then it throws Exception
  static PlatformSpecification getInstance() {
    if (Platform.isAndroid) {
      return AndroidSpecification();
    } else if (Platform.isLinux) {
      return LinuxSpecification();
    } else {
      throw Exception('Platform Not Implemented');
    }
  }
}
