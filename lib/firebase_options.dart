// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyC5hy5HSgQJnog-6djNSlWlE5Z2uPwVMBE',
    appId: '1:564095929778:web:992ba19c1127965d3428ab',
    messagingSenderId: '564095929778',
    projectId: 'note-4a2d1',
    authDomain: 'note-4a2d1.firebaseapp.com',
    storageBucket: 'note-4a2d1.appspot.com',
    measurementId: 'G-H2819M0G6Q',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBjwIQZS0B-FqLAzUptH6KCqnmgWj-lP7g',
    appId: '1:564095929778:android:a6bfac76017f3a633428ab',
    messagingSenderId: '564095929778',
    projectId: 'note-4a2d1',
    storageBucket: 'note-4a2d1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCk0zykcu_ktEK2fled5ZmhhE1gn4Xvy7s',
    appId: '1:564095929778:ios:462455dfd4f57e293428ab',
    messagingSenderId: '564095929778',
    projectId: 'note-4a2d1',
    storageBucket: 'note-4a2d1.appspot.com',
    iosBundleId: 'com.example.learn',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCk0zykcu_ktEK2fled5ZmhhE1gn4Xvy7s',
    appId: '1:564095929778:ios:462455dfd4f57e293428ab',
    messagingSenderId: '564095929778',
    projectId: 'note-4a2d1',
    storageBucket: 'note-4a2d1.appspot.com',
    iosBundleId: 'com.example.learn',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC5hy5HSgQJnog-6djNSlWlE5Z2uPwVMBE',
    appId: '1:564095929778:web:6c08864acd46a8613428ab',
    messagingSenderId: '564095929778',
    projectId: 'note-4a2d1',
    authDomain: 'note-4a2d1.firebaseapp.com',
    storageBucket: 'note-4a2d1.appspot.com',
    measurementId: 'G-ZQEBNFNSTW',
  );
}
