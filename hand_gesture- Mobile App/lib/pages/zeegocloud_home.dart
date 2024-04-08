import 'package:flutter/material.dart';
import 'package:hand_gesture/pages/zeegocloud.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final callIdController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Center content vertically
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Join a Call",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: callIdController,
                decoration: InputDecoration(
                  labelText: "Call ID",
                  labelStyle: TextStyle(color: Colors.white70), // Label color
                  enabledBorder: OutlineInputBorder(
                    // Normal border
                    borderSide:
                        BorderSide(color: Colors.tealAccent[700]!, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    // Focused border
                    borderSide:
                        BorderSide(color: Colors.tealAccent[400]!, width: 2),
                  ),
                  fillColor: Colors.white24,
                  filled: true, // Fill color
                ),
                style: TextStyle(color: Colors.white), // Input text color
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (callIdController.text.isNotEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              CallPage(callID: callIdController.text)),
                    );
                  } else {
                    // Show snackbar if Call ID is empty
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please enter a Call ID')),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.tealAccent[400], // Text color
                ),
                child: const Text('Join'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
