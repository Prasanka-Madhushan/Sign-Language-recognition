import 'dart:math';
import 'package:flutter/material.dart';

class DailyChallengePage extends StatefulWidget {
  @override
  _DailyChallengePageState createState() => _DailyChallengePageState();
}

class _DailyChallengePageState extends State<DailyChallengePage> {
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
    DailyChallenge(
      sign: "ASL Sign for 'More'",
      description: "Learn how to sign 'More'. Useful in many contexts, especially when eating.",
    ),
    DailyChallenge(
      sign: "ASL Sign for 'Help'",
      description: "Practice the sign for 'Help'. It can be vital in emergency situations or when you need assistance.",
    ),
    DailyChallenge(
      sign: "ASL Sign for 'Love'",
      description: "Learn how to sign 'Love'. Great for expressing your feelings to family, friends, and loved ones.",
    ),
    DailyChallenge(
      sign: "ASL Sign for 'Friend'",
      description: "Practice the sign for 'Friend'. It's a nice way to refer to or introduce someone you're close to.",
    ),
    // New challenges added below
    DailyChallenge(
      sign: "ASL Sign for 'Family'",
      description: "Learn how to sign 'Family'. Essential for talking about those close to you.",
    ),
    DailyChallenge(
      sign: "ASL Sign for 'Happy'",
      description: "Practice the sign for 'Happy'. Useful for expressing joy and happiness.",
    ),
    DailyChallenge(
      sign: "ASL Sign for 'Eat'",
      description: "Learn how to sign 'Eat'. Basic need, commonly used around meal times.",
    ),
    DailyChallenge(
      sign: "ASL Sign for 'Drink'",
      description: "Practice the sign for 'Drink'. Useful for expressing the need for a beverage.",
    ),
    DailyChallenge(
      sign: "ASL Sign for 'Home'",
      description: "Learn how to sign 'Home'. Central to discussions about where you live or gatherings.",
    ),
    DailyChallenge(
      sign: "ASL Sign for 'School'",
      description: "Practice the sign for 'School'. Relevant for students and discussions about education.",
    ),
    DailyChallenge(
      sign: "ASL Sign for 'Work'",
      description: "Learn how to sign 'Work'. Important for conversations about employment or tasks.",
    ),
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
                // Implement the action for practicing the sign, such as opening a video or tutorial.
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

