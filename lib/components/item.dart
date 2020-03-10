import 'package:bytebank/models/transfer.dart';
import 'package:flutter/material.dart';

class Item extends StatelessWidget {

  final Transfer _transfer;

  Item(this._transfer);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transfer.value.toString()),
        subtitle: Text(_transfer.account),
      )
    );
  }
}