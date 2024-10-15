import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBoeNWoFnu3H77SNACYVExbjQ0UNKLx5hI",
            authDomain: "hct-carpooling-385dc.firebaseapp.com",
            projectId: "hct-carpooling-385dc",
            storageBucket: "hct-carpooling-385dc.appspot.com",
            messagingSenderId: "129369021565",
            appId: "1:129369021565:web:db15a5746eaf5edaff6514",
            measurementId: "G-H9EXP8YYBR"));
  } else {
    await Firebase.initializeApp();
  }
}
