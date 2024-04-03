import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:hand_gesture/services/auth/auth_service.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with SingleTickerProviderStateMixin {
  final User? user = FirebaseAuth.instance.currentUser;
  final TextEditingController _bioController = TextEditingController();
  String _userBio = "Tap to edit bio...";
  AnimationController? _controller;
  Animation<double>? _opacity;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 1));
    _opacity = Tween<double>(begin: 0.0, end: 1.0).animate(_controller!)
      ..addListener(() {
        setState(() {});
      });
    _controller?.forward();
  }

  @override
  void dispose() {
    _bioController.dispose();
    _controller?.dispose();
    super.dispose();
  }
  void _editBio() async {
    // Show dialog to edit bio
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // User must tap button to dismiss the dialog
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Bio'),
          content: TextField(
            controller: _bioController,
            decoration: InputDecoration(hintText: "Enter your bio here"),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog
              },
            ),
            TextButton(
              child: Text('Save'),
              onPressed: () {
                setState(() {
                  _userBio = _bioController.text; // Update bio with new text
                });
                Navigator.of(context).pop(); // Dismiss the dialog
              },
            ),
          ],
        );
      },
    );
  }

  void signOut() async {
    try {
      final authService = Provider.of<AuthService>(context, listen: false);
      await authService.signOut();
      Navigator.of(context).pushReplacementNamed('/login'); // Assuming '/login' is your route to the login screen
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please Sign in!"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final String profileImagePlaceholder = 'https://www.gravatar.com/avatar/00000000000000000000000000000000?d=mp&f=y';
    final String userEmail = user?.email ?? 'N/A';

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.blue.shade900, Colors.lightBlue.shade200],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 40),
              CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(user?.photoURL ?? profileImagePlaceholder),
                backgroundColor: Colors.transparent,
              ),
              SizedBox(height: 20),
              Text(
                userEmail,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              AnimatedOpacity(
                opacity: _opacity?.value ?? 0,
                duration: Duration(seconds: 1),
                child: GestureDetector(
                  onTap: _editBio,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      _userBio,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              _buildTile(Icons.settings, 'Settings'),
              _buildTile(Icons.help_outline, 'Help & Feedback'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTile(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(title, style: TextStyle(color: Colors.white)),
      onTap: () {
        // Navigate to respective pages (to be implemented)
      },
    );
  }
}