import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:hand_gesture/pages/speechToSign.dart';
import 'package:page_transition/page_transition.dart';


class speechHome extends StatelessWidget {
  const speechHome({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sign Translator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AnimatedSplashScreen(
        splash: 'assets/logo/Splash4.png',
        duration: 1000,
        nextScreen: const SpeechScreen(),
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: Colors.indigo,
        pageTransitionType: PageTransitionType.fade,
      ),
    );
  }
}

