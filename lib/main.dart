import 'package:bt/screens/dashboard.dart';
import 'package:bt/screens/signup.dart';
import 'package:bt/widgets/auth_gate.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   if (kIsWeb) {
//     await Firebase.initializeApp(
//         // options: DefaultFirebaseOptions.currentPlatform,
//         options: FirebaseOptions(
//             apiKey: "AIzaSyAuM9aK6sAJgeawq2s5MDijQt9nHiTkdJM",
//             authDomain: "bgtt-eeff9.firebaseapp.com",
//             projectId: "bgtt-eeff9",
//             storageBucket: "bgtt-eeff9.appspot.com",
//             messagingSenderId: "52411778490",
//             appId: "1:52411778490:web:2efb137c6c8567a4130983"));
//   } else {
//     await Firebase.initializeApp();
//   }
//   FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
//   runApp(const MyApp());

//   // Firebase.initializeApp();
// }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Budget Tracker',
      builder: (context, child) {
        return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: child!);
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const Dashboard(),
    );
  }
}
