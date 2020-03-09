import 'package:bytebank/models/contact.dart';
import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {

  final Contact contact;

  CardItem(this.contact);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          contact.name,
          style: TextStyle(
            fontSize: 24.0
          )
        ),
        subtitle: Text(
          contact.account.toString(),
          style: TextStyle(
            fontSize: 16.0
          )
        )
      ),
    );
  }
}