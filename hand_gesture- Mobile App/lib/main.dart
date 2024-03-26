import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hand_gesture/firebase_options.dart';
//import 'package:hand_gesture/services/auth/auth_gate.dart';
import 'package:hand_gesture/services/auth/auth_service.dart';
import 'package:provider/provider.dart';
import 'splash_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ChangeNotifierProvider(
      create: (context)=> AuthService(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(), // Changed this from AuthGate to SplashScreen
    );
  }
}
