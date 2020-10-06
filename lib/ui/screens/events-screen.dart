import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../data/events.dart';

import 'add-event-screen.dart';
import '../widgets/custom-drawer.dart';
import '../widgets/event-details.dart';
import '../widgets/info-tile.dart';

class EventsScreen extends StatefulWidget {
  static const String routeName = 'events-screen';

  @override
  _EventsScreenState createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  Text getText(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 12),
    );
  }

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
          final event = events[index];
          return InfoTile(
            color: event.color.withOpacity(0.25),
            title: event.title,
            subtitle: event.location,
            leading: CircleAvatar(
              child: Text(
                event.organizer[0],
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(fontFamily: 'SecularOne', color: Colors.white),
              ),
              backgroundColor: event.color,
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                getText(DateFormat.MMMd().format(event.dateTime)),
                getText(DateFormat.jm().format(event.dateTime)),
              ],
            ),
            onTap: () => showDetails(event: event, context: context),
          );
        },
      ),
    );
  }
}
