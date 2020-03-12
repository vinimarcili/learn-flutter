import 'package:bytebank/components/menu.dart';
import 'package:bytebank/views/contacts/list.dart';
import 'package:bytebank/views/transactions/list.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard')
      ),body: LayoutBuilder(
        builder: (context, constrains) => SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constrains.maxHeight
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                  'images/bytebank_logo.png'
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: <Widget>[
                      MenuItem(
                        icon: Icons.monetization_on,
                        label: 'Transfer',
                        onClick: () {
                          _onTap(context, ContactsList());
                        }
                      ),
                      MenuItem(
                        icon: Icons.description,
                        label: 'Transaction Feed',
                        onClick: () {
                          _onTap(context, TransactionsList());
                        }
                      )
                    ],
                  )
                ) 
              ],
            ), 
          ),
        )),
    );
  }

  _onTap(BuildContext context, Widget widget) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => widget
      )
    );
  }
}