import 'dart:async';
import 'package:flutter/services.dart';

class Intent {
  static const MethodChannel _channel = const MethodChannel('intent');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
