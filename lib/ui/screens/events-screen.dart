import 'package:flutter/material.dart';

import './add_event_screen.dart';
import '../widgets/custom-drawer.dart';

class EventsScreen extends StatefulWidget {
  static const String routeName = 'events-screen';

  @override
  _EventsScreenState createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text('Events'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () =>
                Navigator.of(context).pushNamed(AddEventsScreen.routeName),
          ),
        ],
      ),
      body: Center(
        child: Text('Events Screen'),
      ),
    );
  }
}
