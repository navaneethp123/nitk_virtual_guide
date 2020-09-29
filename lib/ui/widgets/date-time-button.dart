import 'package:flutter/material.dart';

class DateTimeButton extends StatelessWidget {
  final String label;
  final String value;
  final Function onPressed;
  final bool hasError;

  DateTimeButton({this.label, this.value, this.onPressed, this.hasError});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(label),
          FlatButton(
            color: hasError ? Colors.red.withOpacity(0.48) : Colors.white,
            onPressed: () {
              FocusScope.of(context).unfocus();
              onPressed();
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(color: Colors.black),
            ),
            child: Text(
              value,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        ],
      ),
    );
  }
}
