import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../data/events.dart';

import './add_event_screen.dart';
import '../widgets/custom-drawer.dart';
import '../widgets/event-details.dart';
import '../widgets/info-tile.dart';

class EventsScreen extends StatefulWidget {
  static const String routeName = 'events-screen';

  @override
  _EventsScreenState createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  @override
  Widget build(BuildContext context) {
    final events = Provider.of<Events>(context).events;

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
      body: ListView.builder(
        itemCount: Provider.of<Events>(context).length,
        itemBuilder: (context, index) {
          return InfoTile(
            title: events[index].title,
            subtitle: events[index].location,
            leading: CircleAvatar(
              child: Text(events[index].organizer[0]),
            ),
            trailing: Text(DateFormat.MMMd().format(events[index].dateTime)),
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (_) => EventDetails(events[index]),
              );
            },
          );
        },
      ),
    );
  }
}
