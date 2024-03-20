import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Ensure you have added the image and font assets to your project.
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
      backgroundColor: Colors.transparent,
      color: Colors.indigoAccent,
      animationDuration: Duration(milliseconds: 300),
      height: 60,
      items: <Widget>[
      Icon(Icons.home, size: 30),
      Icon(Icons.dashboard, size: 30),
      Icon(Icons.person, size: 30),],
    onTap: (index) {
      setState(() {
              index = index;
            }
          );
        }
      ),
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent, // Custom Color for AppBar
        title: Text('Home', 
        style: TextStyle(
          fontFamily: 'Roboto',
          fontWeight: FontWeight.bold
          )),
          centerTitle: true,
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
                  backgroundColor: Colors.indigoAccent, // Custom Button Color
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15), // Button Padding
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => Dashboard(cameras: cameras)));
                },
                child: Text('Start', 
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
