import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class NativeToast {
  static const MethodChannel _channel =
  MethodChannel('com.example.matrix_rotation_app/toast');

  static Future<void> showToast(String message) async {
    try {
      await _channel.invokeMethod('showToast', {'message': message});
    } catch (e) {
      if (kDebugMode) {
        print("Error mostrando el Toast: $e");
      }
    }
  }
}
