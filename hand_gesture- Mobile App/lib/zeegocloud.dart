import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class CallPage extends StatelessWidget {
  const CallPage({super.key, required this.callID});
  final String callID;
  @override
  Widget build(BuildContext context) {
    return ZegoUIKitPrebuiltCall(
      appID:
          2068228734, // Fill in the appID that you get from ZEGOCLOUD Admin Console.
      appSign:
          "d6da9de0e300aa0db094620e884c1b3b83c08c5315af0a59779308941aa67698", // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
      userID: 'user_id',
      userName: 'user_name',
      callID: callID,
      // You can also use groupVideo/groupVoice/oneOnOneVoice to make more types of calls.
      config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()
        //..onOnlySelfInRoom = (context) => Navigator.of(context).pop(),
    );
  }
}
