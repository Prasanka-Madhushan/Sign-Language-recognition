import 'package:flutter/material.dart';
import 'dashboard.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Ensure you have added the image and font assets to your project.
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple, // Custom Color for AppBar
        title: Text('Sign Language Recognition', style: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.bold)),
      ),
      body: Center(
        child: SingleChildScrollView( // Use SingleChildScrollView to ensure the page is scrollable if needed.
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 20),
              Image.asset('images/sign.png', height: 200), // Custom Image
              SizedBox(height: 20),
              Text(
                'Welcome to Sign Language Recognition App',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, fontFamily: 'Roboto'),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple, // Custom Button Color
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15), // Button Padding
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => Dashboard(cameras: cameras)));
                },
                child: Text('Get Started', 
                style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
