import 'package:flutter/material.dart';

import '../widgets/custom-drawer.dart';

class MessScreen extends StatefulWidget {
  static const String routeName = 'mess-screen';

  @override
  _MessScreenState createState() => _MessScreenState();
}

class _MessScreenState extends State<MessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text('Mess'),
      ),
      body: Center(
        child: Text('Mess Menu Screen'),
      ),
    );
  }
}
