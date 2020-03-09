import 'package:bytebank/components/text-input.dart';
import 'package:bytebank/models/contact.dart';
import 'package:flutter/material.dart';

class FormContacts extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _FormContatsState();
  }
}

class _FormContatsState extends State<FormContacts> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _accountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Contact'),
      ),
      body: Column(
        children: <Widget> [
          TextInput(
            controller: _nameController,
            label: 'Full Name'
          ),
          TextInput(
            controller: _accountController,
            label: 'Account Number',
            type: TextInputType.number
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.maxFinite,
              child: RaisedButton(
                onPressed: () {
                  final String name = _nameController.text;
                  final int account = int.tryParse(_accountController.text);
                  final Contact newContact = Contact(name, account);
                  Navigator.pop(context, newContact);
                },
                child: Text('Create')
              )
            )
          )
        ]
      )
    );
  }
}