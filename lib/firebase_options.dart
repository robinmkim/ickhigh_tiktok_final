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
    apiKey: 'AIzaSyDz-I7WXU05Vc9hp6jxmTJ3BzCV3x6ubq8',
    appId: '1:574833744411:web:953c5ee35bcde528abf6be',
    messagingSenderId: '574833744411',
    projectId: 'ickhigh-tiktok-final',
    authDomain: 'ickhigh-tiktok-final.firebaseapp.com',
    storageBucket: 'ickhigh-tiktok-final.appspot.com',
    measurementId: 'G-PT7N87VMWK',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBHnfJBuNdvHQa87LZBXW7GqAl913HggSY',
    appId: '1:574833744411:android:e4615d51eea54da1abf6be',
    messagingSenderId: '574833744411',
    projectId: 'ickhigh-tiktok-final',
    storageBucket: 'ickhigh-tiktok-final.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCtRuJ7GuOMkQHuARdtWKlsVH6NLvsaK6k',
    appId: '1:574833744411:ios:5cf5f6494e027546abf6be',
    messagingSenderId: '574833744411',
    projectId: 'ickhigh-tiktok-final',
    storageBucket: 'ickhigh-tiktok-final.appspot.com',
    iosBundleId: 'com.example.ickhighTiktokFinal',
  );
}
