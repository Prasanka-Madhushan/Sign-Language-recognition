import 'dart:developer';
import 'package:socket_io_client/socket_io_client.dart';

class SignallingService {
  // instance of Socket
  Socket? socket;

  SignallingService._();
  static final instance = SignallingService._();

  // Modify the init method to include reconnection logic:

  init({required String websocketUrl, required String selfCallerID}) {
    socket = io(websocketUrl, {
      "transports": ['websocket'],
      "query": {"callerId": selfCallerID},
      "autoConnect": false,
      "reconnection": true, // Enable automatic reconnection
      "reconnectionAttempts": 5, // Max number of reconnection attempts
      "reconnectionDelay": 2000, // Delay between reconnections
    });

    socket!.onConnect((_) => log("Socket connected!"));
    socket!.onConnectError((data) => log("Connection Error: $data"));
    socket!.onConnectTimeout((_) => log("Connection Timeout!"));
    socket!.onError((data) => log("Error: $data"));
    socket!.onDisconnect((_) => log("Disconnected!"));

    socket!.connect();
  }
}
