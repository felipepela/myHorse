import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyD5TirX-OlY-GtPG8CV7kaSiC8IE-4MWZk",
            authDomain: "my-horse-eipdql.firebaseapp.com",
            projectId: "my-horse-eipdql",
            storageBucket: "my-horse-eipdql.firebasestorage.app",
            messagingSenderId: "94546963977",
            appId: "1:94546963977:web:ef23449c2084e4dfbc12d8"));
  } else {
    await Firebase.initializeApp();
  }
}
