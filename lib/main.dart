import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_app/auth_gate.dart';
// import 'package:flutter_app/auth_gate.dart';
// import 'package:flutter_app/login_page.dart';
import 'firebase_options.dart';

void main() async{
  // Ensure that plugin services are initialized so that `Firebase.initializeApp()` can be called.
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
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: AuthGate(),
      debugShowCheckedModeBanner: false,
    );
  }
}

