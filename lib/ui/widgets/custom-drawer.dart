import 'package:flutter/material.dart';

import '../screens/events-screen.dart';
import '../screens/news-screen.dart';
import '../screens/mess-screen.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Drawer(
      child: Column(
        children: [
          Image.asset('assets/images/drawer-image.jpg'),
          SizedBox(height: height * 0.03),
          _DrawerTile(
            title: 'Events',
            routeName: EventsScreen.routeName,
            icon: Icons.event_note,
          ),
          _DrawerTile(
            title: 'Mess',
            routeName: MessScreen.routeName,
            icon: Icons.free_breakfast,
          ),
          _DrawerTile(
            title: 'News',
            routeName: NewsScreen.routeName,
            icon: Icons.speaker_notes,
          ),
        ],
      ),
    );
  }
}

class _DrawerTile extends StatelessWidget {
  final String title;
  final String routeName;
  final IconData icon;

  _DrawerTile({this.title, this.routeName, this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: MediaQuery.of(context).size.height * 0.0375,
          ),
        ),
        onTap: () => Navigator.of(context).pushReplacementNamed(routeName),
        leading: Icon(
          icon,
          color: Colors.black,
        ),
      ),
    );
  }
}
