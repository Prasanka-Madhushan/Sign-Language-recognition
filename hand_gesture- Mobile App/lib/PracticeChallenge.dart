import 'package:flutter/material.dart';
import 'package:hand_gesture/DailyChallenge.dart';

class SignDetailPage extends StatelessWidget {
  final DailyChallenge challenge;

  SignDetailPage({required this.challenge});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(challenge.sign),
        backgroundColor: Colors.indigoAccent,
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              challenge.sign,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Image.asset(
              challenge.imageUrl,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
