import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
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
  Color _color;
  Color _tempColor;

  final _colors = const [
    Colors.purpleAccent,
    Colors.deepPurpleAccent,
    Colors.indigoAccent,
    Colors.blueAccent,
    Colors.lightBlueAccent,
    Colors.greenAccent,
    Colors.amberAccent,
    Colors.orangeAccent,
    Colors.deepOrangeAccent,
    Colors.pinkAccent,
    Colors.redAccent,
  ];

  void _validateAndSave(BuildContext context) {
    if (!_form.currentState.validate()) return;
    _form.currentState.save();

    Provider.of<Events>(context, listen: false).addEvent(Event(
      title: _title,
      dateTime: _dateTime,
      description: _description,
      location: _location,
      organizer: _organizer,
      color: _color,
    ));

    Navigator.of(context).pop();
  }

  String _defaultValidator(String field, String value) {
    if (value.isEmpty) return '$field cannot be empty';
    return null;
  }

  void _openDialog(String title, Widget content) {
    _tempColor = _color;
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(6.0),
          title: Text(title),
          content: content,
          actions: [
            FlatButton(
              child: Text('Cancel'),
              onPressed: Navigator.of(context).pop,
            ),
            FlatButton(
              color: Theme.of(context).primaryColor,
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                setState(() => _color = _tempColor);
              },
            ),
          ],
        );
      },
    );
  }

  void _openColorPicker() async {
    _openDialog(
      "Color picker",
      MaterialColorPicker(
        selectedColor: _color,
        allowShades: false,
        shrinkWrap: true,
        onlyShadeSelection: true,
        onMainColorChange: (color) => _tempColor = color,
        colors: _colors,
        elevation: 0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _color = _color ?? _colors[Random().nextInt(_colors.length)];
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
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
                Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Pick Color',
                        style: theme.textTheme.subtitle1
                            .copyWith(color: theme.hintColor),
                      ),
                      GestureDetector(
                        onTap: _openColorPicker,
                        child: Container(
                          height: size.width * 0.14,
                          width: size.width * 0.14,
                          decoration: BoxDecoration(
                            color: _color.withOpacity(0.5),
                            borderRadius:
                                BorderRadius.circular(size.width * 0.07),
                            border: Border.all(),
                          ),
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
    );
  }
}
