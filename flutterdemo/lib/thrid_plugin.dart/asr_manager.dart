import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AsrManager {
  static const MethodChannel _channel = MethodChannel("method");

  static Future<String> start({Map? params}) async {
    return await _channel.invokeMethod("start", params ?? {});
  }

  static Future<String> stop() async {
    return await _channel.invokeMethod("stop");
  }

  static Future<String> cancel() async {
    return await _channel.invokeMethod("cancel");
  }
}
