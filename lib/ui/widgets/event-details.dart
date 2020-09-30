import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../data/events.dart';

class EventDetails extends StatelessWidget {
  final Event event;

  EventDetails(this.event);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Title: ${event.title}'),
        Text('Orgnaizer: ${event.organizer}'),
        Text('Description: ${event.description}'),
        Text(
            'Date & Time: ${DateFormat('dd MMM, E @ h:mm a').format(event.dateTime)}'),
        Text('Location: ${event.location}'),
      ],
    );
  }
}
