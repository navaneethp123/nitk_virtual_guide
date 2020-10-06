import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/events.dart';

import '../widgets/custom-date-time-picker.dart';
import '../widgets/custom-text-form-field.dart';

class AddEventsScreen extends StatefulWidget {
  static const String routeName = 'add-events-screen';

  @override
  _AddEventsScreenState createState() => _AddEventsScreenState();
}

class _AddEventsScreenState extends State<AddEventsScreen> {
  final _form = GlobalKey<FormState>();

  String _title;
  String _organizer;
  String _description;
  DateTime _dateTime;
  String _location;

  void _validateAndSave(BuildContext context) {
    if (!_form.currentState.validate()) return;
    _form.currentState.save();

    Provider.of<Events>(context, listen: false).addEvent(Event(
      title: _title,
      dateTime: _dateTime,
      description: _description,
      location: _location,
      organizer: _organizer,
    ));

    Navigator.of(context).pop();
  }

  String _defaultValidator(String field, String value) {
    if (value.isEmpty) return '$field cannot be empty';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Event',
          style: TextStyle(fontSize: kToolbarHeight * 0.4),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.done),
            onPressed: () => _validateAndSave(context),
          ),
        ],
      ),
      body: Form(
        key: _form,
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(5),
            child: Column(
              children: [
                CustomTextFormField(
                  label: 'Title',
                  onSaved: (newValue) => _title = newValue,
                  validator: (value) => _defaultValidator('Title', value),
                ),
                CustomTextFormField(
                  label: 'Organizer',
                  onSaved: (newValue) => _organizer = newValue,
                  validator: (value) => _defaultValidator('Organizer', value),
                ),
                CustomTextFormField(
                  label: 'Description',
                  onSaved: (newValue) => _description = newValue,
                  validator: (value) {
                    if (value.length < 20)
                      return 'Description should be atleast 20 characters';
                    return null;
                  },
                ),
                CustomDateTimePicker(
                  context: context,
                  onSaved: (newValue) => _dateTime = newValue,
                  validator: (value) {
                    if (!value.isAfter(DateTime.now())) return '';
                    return null;
                  },
                ),
                CustomTextFormField(
                  label: 'Location',
                  onSaved: (newValue) => _location = newValue,
                  validator: (value) => _defaultValidator('Location', value),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
