import 'package:flutter/material.dart';
import 'package:hand_gesture/zeegocloud.dart';
//import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final callIdController = TextEditingController(text: "Caller ID");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: TextFormField(
                  controller: callIdController,
                  decoration: const InputDecoration(
                    labelText: "Join a call by ID",
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return CallPage(callID: callIdController.text);
                    }),
                  );
                },
                child: const Text('Join'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
