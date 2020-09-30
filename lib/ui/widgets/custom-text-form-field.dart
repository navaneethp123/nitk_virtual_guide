import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final FormFieldValidator<String> validator;
  final FormFieldSetter<String> onSaved;

  static const _border = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  );

  CustomTextFormField({this.label, this.validator, this.onSaved});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: TextFormField(
        validator: validator,
        onSaved: onSaved,
        maxLines: null,
        decoration: InputDecoration(
          labelText: label,
          border: _border,
          enabledBorder: _border,
        ),
      ),
    );
  }
}
