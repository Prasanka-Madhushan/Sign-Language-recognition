import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hand_gesture/PracticeChallenge.dart';


class DailyChallengePage extends StatefulWidget {
  @override
  _DailyChallengePageState createState() => _DailyChallengePageState();
}

class _DailyChallengePageState extends State<DailyChallengePage> {
  final List<DailyChallenge> challenges = [
    DailyChallenge(
      sign: "ASL Sign for 'Thank You'",
      description: "Practice the sign for 'Thank You'. This is a basic sign that is very useful in everyday conversations.", 
      imageUrl: "images/dict/thankyou.png",
    ),
    DailyChallenge(
      sign: "ASL Sign for 'Please'",
      description: "Learn how to sign 'Please'. It's polite and shows good manners.", 
      imageUrl: "images/dict/please.png",
    ),
    DailyChallenge(
      sign: "ASL Sign for 'Sorry'",
      description: "Practice the sign for 'Sorry'. It's important for expressing apologies.", 
      imageUrl: "images/dict/sorry.png",
    ),
    DailyChallenge(
      sign: "ASL Sign for 'More'",
      description: "Learn how to sign 'More'. Useful in many contexts, especially when eating.", 
      imageUrl: "images/dict/sorry.png",
    ),
    DailyChallenge(
      sign: "ASL Sign for 'Help'",
      description: "Practice the sign for 'Help'. It can be vital in emergency situations or when you need assistance.", 
      imageUrl: "images/dict/help.png",
    ),
    DailyChallenge(
      sign: "ASL Sign for 'Love'",
      description: "Learn how to sign 'Love'. Great for expressing your feelings to family, friends, and loved ones.", 
      imageUrl: "images/dict/love.png",
    ),
    DailyChallenge(
      sign: "ASL Sign for 'Friend'",
      description: "Practice the sign for 'Friend'. It's a nice way to refer to or introduce someone you're close to.", 
      imageUrl: "images/dict/friends.png",
    ),
    // New challenges added below
    DailyChallenge(
      sign: "ASL Sign for 'Family'",
      description: "Learn how to sign 'Family'. Essential for talking about those close to you.", 
      imageUrl: "images/dict/family.png",
    ),
    DailyChallenge(
      sign: "ASL Sign for 'Happy'",
      description: "Practice the sign for 'Happy'. Useful for expressing joy and happiness.", 
      imageUrl: "images/dict/happy.png",
    ),
    DailyChallenge(
      sign: "ASL Sign for 'Eat'",
      description: "Learn how to sign 'Eat'. Basic need, commonly used around meal times.", 
      imageUrl: "images/dict/eat.png",
    ),
    DailyChallenge(
      sign: "ASL Sign for 'Drink'",
      description: "Practice the sign for 'Drink'. Useful for expressing the need for a beverage.", 
      imageUrl: "images/dict/drink.png",
    ),
    DailyChallenge(
      sign: "ASL Sign for 'Home'",
      description: "Learn how to sign 'Home'. Central to discussions about where you live or gatherings.", 
      imageUrl: "images/dict/work.png",
    ),
    DailyChallenge(
      sign: "ASL Sign for 'School'",
      description: "Practice the sign for 'School'. Relevant for students and discussions about education.", 
      imageUrl: "images/dict/school.png",
    ),
    DailyChallenge(
      sign: "ASL Sign for 'Work'",
      description: "Learn how to sign 'Work'. Important for conversations about employment or tasks.", 
      imageUrl: "images/dict/work.png",
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
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.deepPurple,
              Colors.indigoAccent,
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Today\'s Challenge:',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              SizedBox(height: 20),
              Text(
                todayChallenge.sign,
                style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic, color: Colors.white),
              ),
              SizedBox(height: 10),
              Text(
                todayChallenge.description,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => SignDetailPage(challenge: todayChallenge),
                  ),
                ),
                icon: Icon(Icons.play_arrow),
                label: Text('Practice This Sign'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.indigoAccent, backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DailyChallenge {
  final String sign;
  final String description;
  final String imageUrl;

  DailyChallenge({required this.sign, required this.description, required this.imageUrl});
}