abstract class PlatformSpecification {
  Future<Map<String, dynamic>> getProcessorSpecifications();
  Future<Map<String, dynamic>> getDeviceSpecifications();
  Future<Map<String, dynamic>> getOperatingSystemSpecifications();
  Future<Map<String, dynamic>> getBatterySpecifications();
  Future<Map<String, dynamic>> getWifiNetworkSpecifications();
}
