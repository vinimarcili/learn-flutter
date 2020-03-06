import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      body: TransferList(),
      appBar: AppBar(
        title: const Text('Transferências'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: null,
      ),
    ),
    debugShowCheckedModeBanner: false,
  )
);

class TransferList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Item(
          Transfer(
            100.00,
            '12344-2'
          )
        ),
        Item(
          Transfer(
            200.00,
            '32543-3'
          )
        ),
        Item(
          Transfer(
            50.00,
            '145644-X'
          )
        ),
      ]
    );
  }
}

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

class Transfer {
  final double value;
  final String account;

  Transfer(this.value, this.account);
}