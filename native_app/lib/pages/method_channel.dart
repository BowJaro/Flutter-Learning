// Dart code (Flutter portion)
import 'package:flutter/services.dart';

Future<int> getBatteryLevel() async {
  const platform = MethodChannel('get_battery_channel');
  try {
    final int batteryLevel = await platform.invokeMethod('getBatteryLevel');
    return batteryLevel;
  } on PlatformException catch (e) {
    print('Error: ${e.message}');
    return -100;
  }
}
