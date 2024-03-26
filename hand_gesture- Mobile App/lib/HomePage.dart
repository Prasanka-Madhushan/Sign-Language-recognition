import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dashboard.dart'; 

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _pageIndex = 0; // Track the selected index
  final List<String> carouselItems = ['images/bg1.jpg', 'images/bg2.jpg', 'images/a.jpg']; 

  @override
  Widget build(BuildContext context) {
    List<Widget> pageList = [
      HomePage(),
      Dashboard(cameras: cameras), 
      //ProfilePage(), 
    ];

    return Scaffold(
      backgroundColor: Colors.grey[400], // Set background color
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        color: Colors.indigoAccent,
        animationDuration: Duration(milliseconds: 300),
        height: 60,
        items: <Widget>[
          Icon(Icons.home, size: 30, color: _pageIndex == 0 ? Colors.white : Colors.black),
          Icon(Icons.dashboard, size: 30, color: _pageIndex == 1 ? Colors.white : Colors.black),
          Icon(Icons.person, size: 30, color: _pageIndex == 2 ? Colors.white : Colors.black),
        ],
        onTap: (index) {
          setState(() {
            _pageIndex = index;
          });
          // Avoid navigation to the same page
          if (_pageIndex != index) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => pageList[index]),
            );
          }
        },
      ),
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
        backgroundColor: Colors.indigoAccent,
        elevation: 0, // Remove app bar shadow
      ),
      
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: CarouselSlider(
                items: carouselItems.map((imagePath) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 3.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.asset(
                        imagePath,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 200.0,
                      ),
                    ),
                  );
                }).toList(),
                options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                ),
              ),
            ),
            SizedBox(height: 30),
            Text(
              'Welcome to Sign Language Recognition App',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => Dashboard(cameras: cameras)));
              },
              child: Text('Start', style: TextStyle(fontSize: 18, color: Colors.white)),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.indigoAccent),
            ),
          ],
        ),
      ),
    );
  }
}
