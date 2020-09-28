import 'package:flutter/material.dart';

class AddEventsScreen extends StatefulWidget {
  static const String routeName = 'add-events-screen';

  @override
  _AddEventsScreenState createState() => _AddEventsScreenState();
}

class _AddEventsScreenState extends State<AddEventsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Event',
          style: TextStyle(fontSize: kToolbarHeight * 0.4),
        ),
      ),
      body: Center(
        child: Text('Add Event Screen'),
      ),
    );
  }
}
