import 'package:flutter/material.dart';

import './ui/screens/events-screen.dart';
import './ui/screens/news-screen.dart';
import './ui/screens/mess-screen.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blueAccent,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Quicksand',
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0,
          textTheme: TextTheme(
            headline6: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: kToolbarHeight * 0.6,
              fontFamily: 'Quicksand',
            ),
          ),
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
      ),
      home: EventsScreen(),
      routes: {
        EventsScreen.routeName: (context) => EventsScreen(),
        MessScreen.routeName: (context) => MessScreen(),
        NewsScreen.routeName: (context) => NewsScreen()
      },
    );
  }
}
