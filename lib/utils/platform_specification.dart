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
}
