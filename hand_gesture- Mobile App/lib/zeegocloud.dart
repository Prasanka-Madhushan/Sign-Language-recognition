import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class CallPage extends StatelessWidget {
  const CallPage({super.key, required this.callID});
  final String callID;
  @override
  Widget build(BuildContext context) {
    return ZegoUIKitPrebuiltCall(
      appID:
          1163145855, // Fill in the appID that you get from ZEGOCLOUD Admin Console.
      appSign:
          "1f604df85b3275bdd46dc5ff51c4ca55315226e2a5cbb132e63cf095bc4e875d", // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
      userID: 'user_id',
      userName: 'user_name',
      callID: callID,
      // You can also use groupVideo/groupVoice/oneOnOneVoice to make more types of calls.
      config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()
        //..onOnlySelfInRoom = (context) => Navigator.of(context).pop(),
    );
  }
}
