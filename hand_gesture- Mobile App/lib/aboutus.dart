import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
        backgroundColor: Colors.deepPurple, // Use your app's theme color
      ),
      body: SingleChildScrollView( // Allows for scrolling
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'images/about.png', // Add an image related to your app or company
                    width: 200.0,
                    height: 180.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Text(
                'About Us',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple, // Use your app's theme color
                ),
              ),
              SizedBox(height: 20),
              Text(
                'This is the About Us page of this application. Here, you can gain insights into the application\'s purpose, its developers, and how it can benefit you. Our mission is to provide users with a seamless and intuitive experience, helping them achieve their goals effectively.',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  height: 1.5, // Line spacing
                ),
              ),
              SizedBox(height: 20),
              // Optionally, add more sections or contact info
              Text(
                'Contact Us',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple, // Use your app's theme color
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Email: prasankamadushan0@gmail.com\nWebsite: www.prasa.com\nMobile: 0764800929',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  height: 1.5, // Line spacing
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
