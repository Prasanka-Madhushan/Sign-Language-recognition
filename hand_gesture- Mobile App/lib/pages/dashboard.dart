import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:hand_gesture/WebRTC/VideoCallApp.dart';
import 'package:hand_gesture/pages/aboutus.dart';
import 'package:hand_gesture/pages/camera.dart';
import 'package:hand_gesture/pages/chat_room.dart';
import 'package:hand_gesture/pages/speechHome.dart';
import 'package:hand_gesture/pages/youtube_player.dart';
import 'package:hand_gesture/pages/zeegocloud_home.dart';
import 'package:camera/camera.dart';
import 'package:permission_handler/permission_handler.dart';

List<CameraDescription> cameras = [];

class Dashboard extends StatelessWidget {
  final List<CameraDescription> cameras;
  Dashboard({Key? key, required this.cameras}) : super(key: key);
//Icons in the dashboard
  final List<Map<String, dynamic>> items = [
    {
      "icon": Icons.camera_alt,
      "title": "Camera",
      "color": Colors.blue,
      "image": "images/bg2.jpg"
    },
    {
      "icon": Icons.video_call,
      "title": "Video Call",
      "color": Colors.green,
      "image": "images/bg1.jpg"
    },
    {
      "icon": Icons.chat,
      "title": "Chat",
      "color": Colors.orange,
      "image": "images/bg1.jpg"
    },
    {
      "icon": Icons.translate,
      "title": "Translator",
      "color": Colors.red,
      "image": "images/bg2.jpg"
    },
    {
      "icon": Icons.school,
      "title": "Learn Signs",
      "color": Colors.purple,
      "image": "images/bg2.jpg"
    },
    {
      "icon": Icons.info,
      "title": "About Us",
      "color": Colors.teal,
      "image": "images/bg1.jpg"
    },
    {
      "icon": Icons.video_camera_front_rounded,
      "title": "Video Translate",
      "color": Colors.indigo,
      "image": "images/bg1.jpg"
    },
  ];
//Dashboard UI design
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard",
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 2.0)),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.indigo, Colors.deepPurple.shade400]),
        ),
        child: AnimationLimiter(
          child: GridView.builder(
            padding: EdgeInsets.all(20),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.0,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
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
    Map<String, dynamic> item = items[index];
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 10,
      child: InkWell(
        onTap: () => onTapHandler(context, item['title']),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: item['color'].withOpacity(0.2),
            image: DecorationImage(
                image: AssetImage(item['image']),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.25), BlendMode.darken)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(item['icon'], size: 70, color: item['color']),
              SizedBox(height: 10),
              Text(item['title'],
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }

//Handling the functions of the dashboard
  Future<void> onTapHandler(BuildContext context, String title) async {
    switch (title) {
      case "Camera":
        bool granted = await handleCameraPermission(context);
        if (granted) {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (BuildContext context) => HomePage()));
        }
        break;
      case "Video Call":
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => HomeScreen()));
        break;
      case "Chat":
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => ChatRoom()));
        break;
      case "Translator":
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => speechHome()));
        break;
      case "About Us":
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => AboutUsPage()));
        break;
      case "Learn Signs":
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                YoutubeVideoListScreen(videos: youtubeVideos)));
        break;
      case "Video Translate":
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => VideoCallApp()));
        break;
      default:
        showGenericDialog(
            context, "Item Details", "Details about the item tapped.");
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
