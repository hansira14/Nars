import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAbo2qUbYRMiXXdC7zFTC5o8J7gSzHbojY",
            authDomain: "nars-02bnoj.firebaseapp.com",
            projectId: "nars-02bnoj",
            storageBucket: "nars-02bnoj.appspot.com",
            messagingSenderId: "855680008675",
            appId: "1:855680008675:web:63d2ed2d01ae324ec6e0d6"));
  } else {
    await Firebase.initializeApp();
  }
}
