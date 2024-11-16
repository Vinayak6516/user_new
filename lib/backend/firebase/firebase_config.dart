import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAWhRliT85LX9PFmqDW5qO48LCw6uii6EA",
            authDomain: "user-new-ptspl8.firebaseapp.com",
            projectId: "user-new-ptspl8",
            storageBucket: "user-new-ptspl8.appspot.com",
            messagingSenderId: "367937067657",
            appId: "1:367937067657:web:5504137f8d83a9cd278458",
            measurementId: "G-34EQ8T9ES2"));
  } else {
    await Firebase.initializeApp();
  }
}
