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
    apiKey: 'AIzaSyAg8JvlTObnpSqOvo4kXMGL3iH1i4ngYr4',
    appId: '1:624517829610:web:7ef6c448910bad1d625893',
    messagingSenderId: '624517829610',
    projectId: 'et3am-9d260',
    authDomain: 'et3am-9d260.firebaseapp.com',
    storageBucket: 'et3am-9d260.appspot.com',
    measurementId: 'G-CP79KTQ7G0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC-eeCnIZVJC1yQAsH5He0W--gUdzQSeNM',
    appId: '1:624517829610:android:9765e0f4ad4abb62625893',
    messagingSenderId: '624517829610',
    projectId: 'et3am-9d260',
    storageBucket: 'et3am-9d260.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDKghaflewfXmogsCMqMxqY_C_VhmOCBNE',
    appId: '1:624517829610:ios:095cc5c4c441b6c0625893',
    messagingSenderId: '624517829610',
    projectId: 'et3am-9d260',
    storageBucket: 'et3am-9d260.appspot.com',
    iosBundleId: 'com.example.et3am',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDKghaflewfXmogsCMqMxqY_C_VhmOCBNE',
    appId: '1:624517829610:ios:ad3cc8b88865fc40625893',
    messagingSenderId: '624517829610',
    projectId: 'et3am-9d260',
    storageBucket: 'et3am-9d260.appspot.com',
    iosBundleId: 'com.example.et3am.RunnerTests',
  );
}