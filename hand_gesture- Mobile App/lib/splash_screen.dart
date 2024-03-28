import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hand_gesture/services/auth/auth_gate.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () { // Changed to 3 seconds for example
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => AuthGate()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue.shade800,
              Colors.blue.shade300,
              Colors.cyan.shade200,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('images/sign.png', width: 100), // Replace with your asset
              SizedBox(height: 20),
              Text(
                'Welcome to Sign Translator',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              SizedBox(height: 20),
              SpinKitRipple(color: Colors.white, size: 100.0),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
