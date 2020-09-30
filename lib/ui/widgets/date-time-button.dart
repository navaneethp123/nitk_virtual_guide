import 'package:flutter/material.dart';

class DateTimeButton extends StatelessWidget {
  final String label;
  final String value;
  final Function onPressed;
  final bool hasError;

  DateTimeButton({this.label, this.value, this.onPressed, this.hasError});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            label,
            style: theme.textTheme.subtitle1.copyWith(color: theme.hintColor),
          ),
          FlatButton(
            color: Colors.white,
            onPressed: () {
              FocusScope.of(context).unfocus();
              onPressed();
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                color: hasError ? theme.errorColor : Colors.black,
              ),
            ),
            child: Text(
              value,
              style: TextStyle(
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
