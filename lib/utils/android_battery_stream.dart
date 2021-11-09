import 'dart:async';

import 'package:battery_info/model/android_battery_info.dart';

class AndroidBatteryStream {
  Stream<Map<String, dynamic>> getBatteryInfoStream(
      Stream<AndroidBatteryInfo?> _androidBatteryInfoStream) {
    Stream<Map<String, dynamic>> _info = _androidBatteryInfoStream.map((event) {
      String? _batteryHealth = event!.health;
      switch (_batteryHealth) {
        case 'heath_good':
          _batteryHealth = "Good";
          break;
        case 'dead':
          _batteryHealth = "Dead";
          break;
        case 'over_heat':
          _batteryHealth = "Over Heat";
          break;
        case 'over_voltage':
          _batteryHealth = "Over Voltage";
          break;
        case 'cold':
          _batteryHealth = "Cold";
          break;
        default:
          _batteryHealth = "Failure";
          break;
      }
      return {
        'Temperature': event.temperature.toString() + '°C',
        'Technology': event.technology,
        'Health': _batteryHealth,
        'Voltage': (event.voltage! / 1000).toStringAsFixed(2) + ' V',
        'Capacity (reported by system)':
            (event.batteryCapacity! / 1000).toStringAsFixed(0) + ' mAh',
      };
    });
    return _info;
  }
}
