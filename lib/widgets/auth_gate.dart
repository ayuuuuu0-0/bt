import 'package:bt/screens/dashboard.dart';
import 'package:bt/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // While waiting for the authentication state, show a loading indicator
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (!snapshot.hasData) {
          return const Dashboard();
        } else {
          return LoginView();
        }
      },
    );
  }
}
