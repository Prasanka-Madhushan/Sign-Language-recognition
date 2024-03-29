import 'dart:math';
import 'package:flutter/material.dart';

class DailyChallengePage extends StatefulWidget {
  @override
  _DailyChallengePageState createState() => _DailyChallengePageState();
}

class _DailyChallengePageState extends State<DailyChallengePage> {
  // A list of challenges
  final List<DailyChallenge> challenges = [
    DailyChallenge(
      sign: "ASL Sign for 'Thank You'",
      description: "Practice the sign for 'Thank You'. This is a basic sign that is very useful in everyday conversations.",
    ),
    DailyChallenge(
      sign: "ASL Sign for 'Please'",
      description: "Learn how to sign 'Please'. It's polite and shows good manners.",
    ),
    DailyChallenge(
      sign: "ASL Sign for 'Sorry'",
      description: "Practice the sign for 'Sorry'. It's important for expressing apologies.",
    ),
    // Add more challenges here...
  ];

  late DailyChallenge todayChallenge;

  @override
  void initState() {
    super.initState();
    todayChallenge = getRandomChallenge();
  }

  DailyChallenge getRandomChallenge() {
    final random = Random();
    int index = random.nextInt(challenges.length);
    return challenges[index];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daily Challenge'),
        backgroundColor: Colors.indigoAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Today\'s Challenge:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              todayChallenge.sign,
              style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                todayChallenge.description,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add action for practicing the sign, e.g., opening a video or a tutorial
              },
              child: Text('Practice This Sign'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigoAccent, // Background color
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DailyChallenge {
  final String sign;
  final String description;

  DailyChallenge({required this.sign, required this.description});
}

