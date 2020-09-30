import 'package:flutter/material.dart';

class Event {
  String id;
  String title;
  String organizer;
  String description;
  String location;
  DateTime dateTime;

  Event({
    this.id,
    this.title,
    this.organizer,
    this.description,
    this.location,
    this.dateTime,
  });
}

class Events with ChangeNotifier {
  final _events = [];

  Events() {
    _events.add(Event(
      id: '1',
      title: 'tuxcoder',
      organizer: 'Web Club NITK',
      description: 'A coding contest',
      location: 'CCC',
      dateTime: DateTime.now(),
    ));

    _events.add(Event(
      id: '2',
      title: 'Black & White',
      organizer: 'Photography Club NITK',
      description: 'The best photograph contest',
      location: 'Anywhere',
      dateTime: DateTime.now(),
    ));

    notifyListeners();
  }

  int get length => _events.length;
  List<Event> get events => [..._events];

  void addEvent(Event event) {
    event.id = DateTime.now().toIso8601String();
    _events.add(event);

    notifyListeners();
  }
}
