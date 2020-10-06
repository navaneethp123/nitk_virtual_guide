import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MessMenu with ChangeNotifier {
  Map<String, Map<String, List<String>>> _menu = {};

  final days = const [
    'monday',
    'tuesday',
    'wednesday',
    'thursday',
    'friday',
    'saturday',
    'sunday',
  ];

  final eattimes = const [
    'breakfast',
    'lunch',
    'snacks',
    'dinner',
  ];

  MessMenu() {
    for (var day in days) {
      _menu[day] = {};
      for (var eattime in eattimes) {
        _menu[day][eattime] = [];
      }
    }

    for (var day in days) {
      Map<String, List<String>> _daymenu = {};
      FirebaseFirestore.instance
          .collection('mess-menu')
          .doc(day)
          .get()
          .then((daymenu) {
        final data = daymenu.data();
        for (var eattime in eattimes) {
          _daymenu[eattime] = [];
          for (var food in data[eattime]) {
            _daymenu[eattime].add(food as String);
          }
        }
        _menu[day] = _daymenu;
        notifyListeners();
      });
    }
  }

  Map<String, Map<String, List<String>>> get menu {
    Map<String, Map<String, List<String>>> copy = {};

    for (var day in days) {
      copy[day] = {};
      for (var eattime in eattimes) {
        copy[day][eattime] = [..._menu[day][eattime]];
      }
    }

    return copy;
  }
}
