import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../data/events.dart';
import './detail-container.dart';

class EventDetails extends StatelessWidget {
  final Event event;

  EventDetails(this.event);

  Container holder(Size deviceSize) {
    return Container(
      margin: EdgeInsets.all(6),
      height: deviceSize.height * 0.01,
      width: deviceSize.width * 0.35,
      decoration: BoxDecoration(
          color: Colors.black54,
          borderRadius: BorderRadius.circular(deviceSize.height * 0.005)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Container(
      height: deviceSize.height * 0.85,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        color: Colors.white,
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: <Widget>[
          holder(deviceSize),
          Container(
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            padding: EdgeInsets.all(6),
            child: Text(
              event.title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
              textAlign: TextAlign.center,
            ),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.black87,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          Flexible(
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    DetailContainer(Text(event.description)),
                    DetailContainer(
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('By?',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(event.organizer),
                        ],
                      ),
                    ),
                    DetailContainer(
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('When?',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(DateFormat('MMM d, E @ h:mm a')
                              .format(event.dateTime)),
                        ],
                      ),
                    ),
                    DetailContainer(
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Where?',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Flexible(
                            child: Padding(
                              padding: EdgeInsets.only(left: 15),
                              child: Text(event.location),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
