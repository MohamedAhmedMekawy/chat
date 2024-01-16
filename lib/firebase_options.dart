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
        return macos;
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
    apiKey: 'AIzaSyAlBkDbcucPEM6j_OUX2LcdhyQLZDO4Phw',
    appId: '1:681202326219:web:99edd8c4c460ac0948194e',
    messagingSenderId: '681202326219',
    projectId: 'chat-55beb',
    authDomain: 'chat-55beb.firebaseapp.com',
    storageBucket: 'chat-55beb.appspot.com',
    measurementId: 'G-4EF9Q1TDL7',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCGuEGMyNoZhmnJ2ee16Sc1stfeK8Mu-gM',
    appId: '1:681202326219:android:8ce6e48b9348bfdb48194e',
    messagingSenderId: '681202326219',
    projectId: 'chat-55beb',
    storageBucket: 'chat-55beb.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBrUwAaWfSx2wCillKFx1-O9PjBagB16jQ',
    appId: '1:681202326219:ios:3f6b3fad46cdec6e48194e',
    messagingSenderId: '681202326219',
    projectId: 'chat-55beb',
    storageBucket: 'chat-55beb.appspot.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBrUwAaWfSx2wCillKFx1-O9PjBagB16jQ',
    appId: '1:681202326219:ios:d2aec4739e03b0b048194e',
    messagingSenderId: '681202326219',
    projectId: 'chat-55beb',
    storageBucket: 'chat-55beb.appspot.com',
    iosBundleId: 'com.example.chatApp.RunnerTests',
  );
}