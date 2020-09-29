import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import 'date-time-button.dart';

class CustomDateTimePicker extends FormField<DateTime> {
  static DateTime _withDate(DateTime value, DateTime date) {
    return DateTime(date.year, date.month, date.day, value.hour, value.minute);
  }

  static DateTime _withTime(DateTime value, TimeOfDay time) {
    return DateTime(value.year, value.month, value.day, time.hour, time.minute);
  }

  CustomDateTimePicker({
    FormFieldSetter<DateTime> onSaved,
    FormFieldValidator<DateTime> validator,
    BuildContext context,
  }) : super(
          onSaved: onSaved,
          validator: validator,
          enabled: true,
          initialValue: DateTime.now().add(Duration(seconds: 1)),
          builder: (state) {
            return Padding(
              padding: EdgeInsets.all(5),
              child: Column(
                children: [
                  DateTimeButton(
                    label: 'Date',
                    value: DateFormat('MMM d yyyy, E').format(state.value),
                    hasError: state.hasError,
                    onPressed: () {
                      var now = DateTime.now();
                      showDatePicker(
                        context: context,
                        initialDate: state.value,
                        firstDate: now,
                        lastDate: now.add(Duration(days: 150)),
                      ).then((value) {
                        state.didChange(_withDate(state.value, value));
                      });
                    },
                  ),
                  DateTimeButton(
                    label: 'Time',
                    value: TimeOfDay.fromDateTime(state.value).format(context),
                    hasError: state.hasError,
                    onPressed: () {
                      showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.fromDateTime(state.value),
                      ).then((value) {
                        state.didChange(_withTime(state.value, value));
                      });
                    },
                  ),
                ],
              ),
            );
          },
        );
}
