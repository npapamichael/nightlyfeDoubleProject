import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD8vZZ0w8WXTqFivyeaXuI1ngW3OduO4lU',
    appId: '1:936729056013:android:e2f5d9826483a72e9bd644',
    messagingSenderId: '936729056013',
    projectId: 'nightlyfe-1b0bc',
    storageBucket: 'nightlyfe-1b0bc.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCST3w_wtoTzf81Ahw_3QWA44jCvbNPBYM',
    appId: '1:936729056013:ios:9ce7e236a451790c9bd644',
    messagingSenderId: '936729056013',
    projectId: 'nightlyfe-1b0bc',
    storageBucket: 'nightlyfe-1b0bc.firebasestorage.app',
    androidClientId: '936729056013-5k7olc90163qepr6l647lt1p7iulgo7g.apps.googleusercontent.com',
    iosClientId: '936729056013-5n59gcj5jq55tpnufl9vq8dptr32m6r1.apps.googleusercontent.com',
    iosBundleId: 'com.example.nightlyfe',
  );
}
