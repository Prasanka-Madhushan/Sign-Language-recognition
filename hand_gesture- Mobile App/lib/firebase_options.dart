// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCmELlpSseQCSLYXJjmfFXOa9eDriS-WIo',
    appId: '1:517596444019:web:e06760401d65838b314106',
    messagingSenderId: '517596444019',
    projectId: 'signtranslator-bb053',
    authDomain: 'signtranslator-bb053.firebaseapp.com',
    storageBucket: 'signtranslator-bb053.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDVK4eOgavUG0Z0O63-OOS_W0uU3eNlhrM',
    appId: '1:517596444019:android:843ad6a98d24e659314106',
    messagingSenderId: '517596444019',
    projectId: 'signtranslator-bb053',
    storageBucket: 'signtranslator-bb053.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBBgttiyUFJZx32aVAtIjhbjHDoIfyRpJ4',
    appId: '1:517596444019:ios:67a4570a425e447b314106',
    messagingSenderId: '517596444019',
    projectId: 'signtranslator-bb053',
    storageBucket: 'signtranslator-bb053.appspot.com',
    iosBundleId: 'com.example.handGesture',
  );
}
