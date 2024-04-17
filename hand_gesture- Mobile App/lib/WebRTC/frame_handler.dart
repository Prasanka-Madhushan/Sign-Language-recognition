import 'dart:async';
//import 'dart:typed_data';
import 'package:flutter/services.dart';

class FrameHandler {
  static const MethodChannel _channel =
      MethodChannel('com.example/videoframes');

  static void initialize() {
    _channel.setMethodCallHandler(_onMethodCall);
  }

  static Future<void> _onMethodCall(MethodCall call) async {
    if (call.method == "onFrame") {
      final Uint8List frameData = call.arguments;
      // Here, you would send the frameData to your TensorFlow Lite model for processing
      // For demonstration purposes, let's just print the frame data length
      print("Received frame of length: ${frameData.length}");
    }
  }
}
