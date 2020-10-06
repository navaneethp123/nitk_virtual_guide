import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/mess-menu.dart';
import '../widgets/custom-drawer.dart';

class MessScreen extends StatefulWidget {
  static const String routeName = 'mess-screen';

  @override
  _MessScreenState createState() => _MessScreenState();
}

class _MessScreenState extends State<MessScreen> {
  @override
  Widget build(BuildContext context) {
    final messobj = Provider.of<MessMenu>(context);
    final messmenu = messobj.menu;
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text('Mess'),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              for (var day in messobj.days)
                Column(
                  children: [
                    Container(
                      color: Colors.amberAccent.shade100,
                      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                      child: Column(
                        children: [
                          Divider(
                            color: Colors.black54,
                            thickness: 2,
                            height: 2,
                          ),
                          Text(
                            day[0].toUpperCase() + day.substring(1),
                            style: Theme.of(context)
                                .textTheme
                                .headline5
                                .copyWith(fontFamily: 'SecularOne'),
                          ),
                          Divider(
                            color: Colors.black54,
                            thickness: 2,
                            height: 2,
                          ),
                        ],
                      ),
                    ),
                    for (var eattime in messobj.eattimes)
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                eattime[0].toUpperCase() + eattime.substring(1),
                                style: TextStyle(
                                  fontFamily: 'SecularOne',
                                ),
                              ),
                            ),
                            for (var food in messmenu[day][eattime])
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  food,
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                              ),
                            eattime != messobj.eattimes.last
                                ? Divider(color: Colors.blueGrey.shade100)
                                : SizedBox(height: 10),
                          ],
                        ),
                      ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
