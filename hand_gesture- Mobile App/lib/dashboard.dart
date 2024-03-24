import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:hand_gesture/camera.dart';
import 'package:hand_gesture/speechHome.dart';
import 'package:hand_gesture/youtube_player.dart';
import 'package:hand_gesture/zeegocloud_home.dart';
import 'aboutus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';


List<CameraDescription> cameras = [];

class Dashboard extends StatelessWidget {
  final List<CameraDescription> cameras;
  Dashboard({Key? key, required this.cameras}) : super(key: key);

  final List<Map<String, dynamic>> items = [
    {"icon": Icons.camera_alt, "title": "Camera", "color": Colors.blue, "image": "images/bg2.jpg"},
    {"icon": Icons.video_call, "title": "Video Call", "color": Colors.green, "image": "images/bg1.jpg"},
    {"icon": Icons.chat, "title": "Chat", "color": Colors.orange, "image": "images/bg1.jpg"},
    {"icon": Icons.translate, "title": "Translator", "color": Colors.red, "image": "images/bg2.jpg"},
    {"icon": Icons.school, "title": "Learn Signs", "color": Colors.purple, "image": "images/bg2.jpg"},
    {"icon": Icons.info, "title": "About Us", "color": Colors.teal, "image": "images/bg1.jpg"},
  ];

//Dashboard Ui Design
  @override
  Widget build(BuildContext context) {
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
        title: Text(
          "Dashboard",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
            // Additional text styling options can go here
          ),
        ),
        centerTitle: true, // Centers the title
        backgroundColor: Colors.deepPurple,
      ),

      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.deepPurple, Colors.indigo],
          ),
        ),
        child: AnimationLimiter(
          child: GridView.builder(
            padding: EdgeInsets.all(20),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.0,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            itemCount: items.length,
            itemBuilder: (context, index) {
              return AnimationConfiguration.staggeredGrid(
                position: index,
                duration: const Duration(milliseconds: 375),
                columnCount: 2,
                child: ScaleAnimation(
                  child: FadeInAnimation(
                    child: buildCard(context, index),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget buildCard(BuildContext context, int index) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      child: InkWell(
        onTap: () => onTapHandler(context, items[index]['title']),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: items[index]['color'].withOpacity(0.2),
            image: DecorationImage(
              image: AssetImage(items[index]['image']),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.25), BlendMode.darken),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(items[index]['icon'], size: 70, color: items[index]['color']),
              SizedBox(height: 10),
              Text(
                items[index]['title'],
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  //Handling the Icons click events
  Future<void> onTapHandler(BuildContext context, String title) async {
    switch (title) {
      case "Camera":
        bool granted = await handleCameraPermission(context);
        if(granted){
         Navigator.of(context).pushReplacement(new MaterialPageRoute(
        builder: (BuildContext context) => HomePage()));
        }
        break;
      case "Video Call":
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => HomeScreen(), // Adjust according to your setup
        ));
        break;
      case "Translator":
      // Navigate to SpeechScreen when "Translator" is tapped
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => speechHome()));
      break;
      case "About Us":
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => AboutUsPage()));
        break;
      case "Learn Signs":
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => YoutubeVideoListScreen(videos: youtubeVideos))); // Ensure youtubeVideos is defined
        break;
        
      default:
      // Handle other options with a generic dialog
        showGenericDialog(context, "Item Details", "Details about the item tapped.");
        break;
      }
  }

Future<bool> handleCameraPermission(BuildContext context) async {
  var cameraStatus = await Permission.camera.status;
  if (!cameraStatus.isGranted) {
    var result = await Permission.camera.request();
    if (!result.isGranted) {
      showPermissionDeniedDialog(context);
      return false;
    }
  }
  return true;
}

  

Future<void> handleCameraTap(BuildContext context) async {
    var cameraStatus = await Permission.camera.status;
    if (!cameraStatus.isGranted) {
      await Permission.camera.request();
    }
  }

  void showPermissionDeniedDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Camera Permission"),
          content: Text("Camera permission is required to access the camera."),
          actions: [
            TextButton(
              child: Text("OK"),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }
}

void setState(Null Function() param0) {
}                        

void showGenericDialog(BuildContext context, String title, String content) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            child: Text("Close"),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      );
    },
  );
}
