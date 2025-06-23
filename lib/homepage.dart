import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Homepage'),
      ),
      body: Center(
        child: ElevatedButton(onPressed: () async {
          await FirebaseAuth.instance.signOut();
        },
        child: Text("Sign Out"),
        ),
    ),
    );  
  }
}