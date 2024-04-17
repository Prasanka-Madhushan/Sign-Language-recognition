import 'dart:math';

import 'package:flutter/material.dart';
import '../WebRTC/JoinScreen.dart';
import '../WebRTC/SignallingService.dart';

void main() {
  // start videoCall app
  runApp(VideoCallApp());
}

class VideoCallApp extends StatelessWidget {
  VideoCallApp({super.key});

  final String websocketUrl = const String.fromEnvironment(
      'WEB_SOCKET_SERVER_URL',
      defaultValue: 'http://192.168.8.117:5000');

  final String selfCallerID =
      Random().nextInt(999999).toString().padLeft(6, '0');

  @override
  Widget build(BuildContext context) {
    // init signalling service
    SignallingService.instance.init(
      websocketUrl: websocketUrl,
      selfCallerID: selfCallerID,
    );

    // return material app
    return MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: const ColorScheme.dark(),
      ),
      themeMode: ThemeMode.dark,
      home: JoinScreen(selfCallerId: selfCallerID),
    );
  }
}
