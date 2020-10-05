import 'package:cloud_firestore/cloud_firestore.dart';
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
  List<Event> _events = [];

  Events() {
    FirebaseFirestore.instance
        .collection('events')
        .where('dateTime',
            isGreaterThanOrEqualTo:
                DateTime.now().subtract(Duration(hours: 6)).toIso8601String())
        .snapshots()
        .listen((eventsSnapshot) {
      List<Event> events = [];
      eventsSnapshot.docs.forEach((doc) {
        var data = doc.data();
        events.add(Event(
          id: doc.id,
          title: data['title'],
          organizer: data['organizer'],
          description: data['description'],
          location: data['location'],
          dateTime: DateTime.parse(data['dateTime']),
        ));
      });
      _events = events;
      notifyListeners();
    });
  }

  int get length => _events.length;
  List<Event> get events => [..._events];

  Future<void> addEvent(Event event) async {
    FirebaseFirestore.instance.collection('events').add({
      'title': event.title,
      'organizer': event.organizer,
      'description': event.description,
      'location': event.location,
      'dateTime': event.dateTime.toIso8601String(),
    });
  }
}
