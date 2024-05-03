import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:hand_gesture/pages/CommunityStories.dart';
import 'package:hand_gesture/pages/DailyChallenge.dart';
import 'package:hand_gesture/pages/Dictionary.dart';
import 'package:hand_gesture/pages/Profile.dart';
import 'package:hand_gesture/pages/youtube_player.dart';
import 'dashboard.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  // Page controller to control page transitions
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {});
  }

  void _onIconTapped(int index) {
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        backgroundColor: Colors.transparent,
        color: Colors.white,
        animationDuration: Duration(milliseconds: 300),
        height: 50,
        items: <Widget>[
          Icon(Icons.home_filled, size: 30, color: Colors.black),
          Icon(Icons.space_dashboard_sharp, size: 30, color: Colors.black),
          Icon(Icons.person_3, size: 30, color: Colors.black),
        ],
        onTap: _onIconTapped,
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: <Widget>[
          HomeContent(),
          Dashboard(cameras: cameras),
          ProfilePage(),
        ],
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  final List<Map<String, String>> carouselItems = [
    {'image': 'images/sign2.jpg', 'text': 'Learn Sign Language'},
    {'image': 'images/sign3.jpg', 'text': 'Communicate Effectively'},
    {'image': 'images/sign1.jpg', 'text': 'Explore Resources'},
  ];

  final List<Widget> pageList = [
    HomePage(),
    Dashboard(cameras: cameras),
    ProfilePage(),
  ];

  Future<String> _fetchUsername() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      try {
        var userData = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();
        return userData.data()?['username'] ?? 'No Username';
      } catch (e) {
        return 'Failed to fetch username';
      }
    }
    return 'No User';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigoAccent,
      appBar: AppBar(
        title: Text(
          "Home",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.indigoAccent,
        elevation: 6,
        actions: [
          IconButton(
            icon: Icon(Icons.person_2_rounded),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.transparent,
                    spreadRadius: 4,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: CarouselSlider.builder(
                itemCount: carouselItems.length,
                itemBuilder: (context, index, realIndex) {
                  final item = carouselItems[index];
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 3.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Image.asset(
                            item['image']!,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: 200.0,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.black45,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15.0),
                              bottomRight: Radius.circular(15.0),
                            ),
                          ),
                          width: double.infinity,
                          padding: EdgeInsets.all(10),
                          child: Text(
                            item['text']!,
                            style: TextStyle(color: Colors.white, fontSize: 18),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  );
                },
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
              'Welcome to SignSavvy,',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    blurRadius: 10.0,
                    color: Colors.white.withOpacity(0.40),
                    offset: Offset(5.0, 5.0),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            FutureBuilder<String>(
              future: _fetchUsername(),
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else {
                  return Text(
                    snapshot.data!,
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          blurRadius: 10.0,
                          color: Colors.white.withOpacity(0.40),
                          offset: Offset(5.0, 5.0),
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
            SizedBox(height: 30),
            // Feature Grid Placeholder
            Container(
              padding: EdgeInsets.all(10),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  // Feature names and icons
                  final features = [
                    {'name': 'Interactive Lessons', 'icon': Icons.school},
                    {'name': 'Daily Challenge', 'icon': Icons.lightbulb},
                    {'name': 'Dictionary', 'icon': Icons.book},
                    {'name': 'Community Stories', 'icon': Icons.people},
                  ];
                  return Card(
                    elevation: 5,
                    child: InkWell(
                      onTap: () {
                        switch (index) {
                          case 0:
                            // Navigate to Interactive Lessons
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => YoutubeVideoListScreen(
                                    videos: youtubeVideos)));
                            break;
                          case 1:
                            // Navigate to Daily Challenge
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DailyChallengePage()),
                            );
                            break;
                          case 2:
                            // Navigate to Dictionary
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        SignLanguageDictionaryPage()));
                            break;
                          case 3:
                            // Navigate to Community Stories
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        CommunityStoriesPage()));
                            break;
                        }
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(features[index]['icon'] as IconData, size: 50),
                          SizedBox(height: 10),
                          Text(features[index]['name'] as String),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 30),
            /* ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => Dashboard(cameras: cameras)));
              },
              child: Text('Start', style: TextStyle(fontSize: 18, color: Colors.white)),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
            ),*/
          ],
        ),
      ),
    );
  }
}
