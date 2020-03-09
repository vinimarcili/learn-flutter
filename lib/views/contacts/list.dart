import 'package:bytebank/components/card.dart';
import 'package:bytebank/database/dao/contact-dao.dart';
import 'package:bytebank/models/contact.dart';
import 'package:bytebank/views/contacts/form.dart';
import 'package:flutter/material.dart';

class ContactsList extends StatefulWidget {
  @override
  createState() {
    return _ContactsListState();
  }
}

class _ContactsListState extends State<ContactsList> {
  final ContactDao _contactDao = ContactDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts')
      ),
      body: FutureBuilder<List<Contact>>(
        initialData: List(),
        future: _contactDao.findAll(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Text('Loading'),
                  ],
                ),
              );
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              if (snapshot.data != null) {
                final List<Contact> contacts = snapshot.data;
                return ListView.builder(
                  itemBuilder: (context, index) {
                    final Contact contact = contacts[index];
                    return CardItem(contact);
                  },
                  itemCount: contacts.length,
                );
              }
              break;
          }
          return Text('Error');
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => FormContacts(),
            )
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}