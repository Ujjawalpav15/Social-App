import 'package:flutter/material.dart';
import 'package:flutter_app/auth_service.dart';
import 'package:flutter_app/homepage.dart';
import 'package:flutter_app/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthGate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("AuthGate is building...");
    return StreamBuilder<User?>(
      stream: AuthService().authStateChanges,
      builder: (context, snapshot) {
        print("Stream snapshot: ${snapshot.connectionState}, user: ${snapshot.data}");
        if (snapshot.connectionState == ConnectionState.active) {
          final user = snapshot.data;
          if (user == null) {
            print("Navigating to LoginPage");
            return LoginPage();
          } else {
            print("Navigating to Homepage");
            return Homepage();
          }
        } else {
          print("Waiting for connection...");
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}
