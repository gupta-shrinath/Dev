import 'package:dev/utils/platform_specification.dart';

class LinuxSpecification implements PlatformSpecification {
  @override
  getBatterySpecifications([_]) {
    // TODO: implement getBatterySpecifications
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> getDeviceSpecifications() {
    // TODO: implement getDeviceSpecifications
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> getDiskSpecifications() {
    // TODO: implement getDiskSpecifications
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic> getMemorySpecifications() {
    // TODO: implement getMemorySpecifications
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> getOperatingSystemSpecifications() {
    // TODO: implement getOperatingSystemSpecifications
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> getProcessorSpecifications() {
    // TODO: implement getProcessorSpecifications
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> getWifiNetworkSpecifications() {
    // TODO: implement getWifiNetworkSpecifications
    throw UnimplementedError();
  }
}
