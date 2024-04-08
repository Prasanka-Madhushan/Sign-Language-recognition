import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class DailyChallengePage extends StatefulWidget {
  @override
  _DailyChallengePageState createState() => _DailyChallengePageState();
}

class _DailyChallengePageState extends State<DailyChallengePage> {
  final List<DailyChallenge> challenges = [
    DailyChallenge(
      sign: "ASL Sign for 'Thank You'",
      description:
          "Practice the sign for 'Thank You'. This is a basic sign that is very useful in everyday conversations.",
      imageUrl: "images/DailyChallenge/thanku.png",
    ),
    DailyChallenge(
      sign: "ASL Sign for 'Please'",
      description:
          "Learn how to sign 'Please'. It's polite and shows good manners.",
      imageUrl: "images/DailyChallenge/please.png",
    ),
    DailyChallenge(
      sign: "ASL Sign for 'Sorry'",
      description:
          "Practice the sign for 'Sorry'. It's important for expressing apologies.",
      imageUrl: "images/DailyChallenge/sorry.png",
    ),
    DailyChallenge(
      sign: "ASL Sign for 'More'",
      description:
          "Learn how to sign 'More'. Useful in many contexts, especially when eating.",
      imageUrl: "images/DailyChallenge/more.png",
    ),
    DailyChallenge(
      sign: "ASL Sign for 'Help'",
      description:
          "Practice the sign for 'Help'. It can be vital in emergency situations or when you need assistance.",
      imageUrl: "images/DailyChallenge/help.png",
    ),
    DailyChallenge(
      sign: "ASL Sign for 'Love'",
      description:
          "Learn how to sign 'Love'. Great for expressing your feelings to family, friends, and loved ones.",
      imageUrl: "images/DailyChallenge/love.png",
    ),
    DailyChallenge(
      sign: "ASL Sign for 'Friend'",
      description:
          "Practice the sign for 'Friend'. It's a nice way to refer to or introduce someone you're close to.",
      imageUrl: "images/DailyChallenge/friend.png",
    ),
    DailyChallenge(
      sign: "ASL Sign for 'Family'",
      description:
          "Learn how to sign 'Family'. Essential for talking about those close to you.",
      imageUrl: "images/DailyChallenge/family.png",
    ),
    DailyChallenge(
      sign: "ASL Sign for 'Happy'",
      description:
          "Practice the sign for 'Happy'. Useful for expressing joy and happiness.",
      imageUrl: "images/DailyChallenge/happy.png",
    ),
    DailyChallenge(
      sign: "ASL Sign for 'Eat'",
      description:
          "Learn how to sign 'Eat'. Basic need, commonly used around meal times.",
      imageUrl: "images/DailyChallenge/eat.png",
    ),
    DailyChallenge(
      sign: "ASL Sign for 'Drink'",
      description:
          "Practice the sign for 'Drink'. Useful for expressing the need for a beverage.",
      imageUrl: "images/DailyChallenge/drink.png",
    ),
    DailyChallenge(
      sign: "ASL Sign for 'Home'",
      description:
          "Learn how to sign 'Home'. Central to discussions about where you live or gatherings.",
      imageUrl: "images/DailyChallenge/home.png",
    ),
    DailyChallenge(
      sign: "ASL Sign for 'School'",
      description:
          "Practice the sign for 'School'. Relevant for students and discussions about education.",
      imageUrl: "images/DailyChallenge/school.png",
    ),
    DailyChallenge(
      sign: "ASL Sign for 'Work'",
      description:
          "Learn how to sign 'Work'. Important for conversations about employment or tasks.",
      imageUrl: "images/DailyChallenge/work.png",
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
        padding: EdgeInsets.all(16),
        child: AnimationLimiter(
          child: ListView(
            children: AnimationConfiguration.toStaggeredList(
              duration: const Duration(milliseconds: 375),
              childAnimationBuilder: (widget) => SlideAnimation(
                horizontalOffset: 50.0,
                child: FadeInAnimation(
                  child: widget,
                ),
              ),
              children: [
                _buildTodayChallengeCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTodayChallengeCard() {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Today\'s Challenge:',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 20),
            Image.asset(todayChallenge.imageUrl, fit: BoxFit.cover),
            SizedBox(height: 20),
            Text(
              todayChallenge.sign,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontStyle: FontStyle.italic),
            ),
            SizedBox(height: 10),
            Text(
              todayChallenge.description,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class DailyChallenge {
  final String sign;
  final String description;
  final String imageUrl;

  DailyChallenge(
      {required this.sign, required this.description, required this.imageUrl});
}
