import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class SplashScreen extends StatefulWidget {
  final Widget child;

  SplashScreen({this.child});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return widget.child;
        }

        return Scaffold(body: Center(child: CircularProgressIndicator()));
      },
    );
  }
}
