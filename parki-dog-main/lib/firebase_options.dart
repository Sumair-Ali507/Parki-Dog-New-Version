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
    apiKey: 'AIzaSyDNuRhhDtwTNsudjszB0caRqu9tTWxjgFs',
    appId: '1:376510026507:web:b4f5427af23314ebaa880e',
    messagingSenderId: '376510026507',
    projectId: 'parkidog',
    authDomain: 'parkidog.firebaseapp.com',
    storageBucket: 'parkidog.appspot.com',
    measurementId: 'G-6ZJSGQNJ2N',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCph2SBF_yzZH5ktPtTmwQWVJVhr3Zf10M',
    appId: '1:1087343977253:android:6ae0d3416f04ccb566f0cc',
    messagingSenderId: '1087343977253',
    projectId: 'parki-dog',
    storageBucket: 'parki-dog.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCY2JU7PrnU7QTHViBp9m5dTjTZoU_j3KQ',
    appId: '1:1087343977253:ios:d33f838037b4513266f0cc',
    messagingSenderId: '1087343977253',
    projectId: 'parki-dog',
    storageBucket: 'parki-dog.appspot.com',
    androidClientId: '1087343977253-8hkjpk36ggmshda5odpbgioo8g648ttm.apps.googleusercontent.com',
    iosClientId: '1087343977253-7ouqor3b3c2utk1krv86ibdnnn5s5vir.apps.googleusercontent.com',
    iosBundleId: 'com.techzone.parkidog',
  );

}