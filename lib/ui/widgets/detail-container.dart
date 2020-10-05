import 'package:flutter/material.dart';

class DetailContainer extends Container {
  DetailContainer(Widget widget, {String heading = ''})
      : super(
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(5),
          ),
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          padding: EdgeInsets.all(10),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              if (heading?.isNotEmpty ?? false)
                Text(
                  heading,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              widget,
            ],
          ),
        );
}
