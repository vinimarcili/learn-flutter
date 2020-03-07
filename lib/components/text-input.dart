import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {

  final TextEditingController controller;
  final String label;
  final String placeholder;
  final IconData icon;

  TextInput({
    this.controller, this.label, this.placeholder, this.icon
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controller,
        style: TextStyle(
          fontSize: 24.0
        ),
        decoration: InputDecoration(
          labelText: label,
          hintText: placeholder,
          icon: (icon != null) ? Icon(icon) : null,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}
