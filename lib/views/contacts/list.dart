import 'package:bytebank/views/contacts/form.dart';
import 'package:flutter/material.dart';

class ContactsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts')
      ),
      body: ListView(
        children: <Widget>[
          Card(
            child: ListTile(
              title: Text(
                'Zé',
                style: TextStyle(
                  fontSize: 24.0
                )
              ),
              subtitle: Text(
                '1232-X',
                style: TextStyle(
                  fontSize: 16.0
                )
              )
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => FormContacts(),
            )
          ).then((newContact) => {
            
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}