import 'package:bytebank/components/item.dart';
import 'package:bytebank/models/transfer.dart';
import 'package:bytebank/views/transfer/form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const _title = 'Transferências';

class TransferListState extends State<TransferList> {
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: widget._transfers.length,
        itemBuilder: (context, index) {
          final item = widget._transfers[index];
          return Item(item);
        },
      ),
      appBar: AppBar(
        title: const Text(_title),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => FormTransfer() 
          ))
          .then((transfer) => update(transfer));
        },
      ),
    );
  }

  void update(Transfer transfer) {
    if (transfer != null) {
      setState(() {
        widget._transfers.add(transfer);
      }); 
    }
  }
}

class TransferList extends StatefulWidget {

  final List<Transfer> _transfers = List();

  @override
  State<StatefulWidget> createState() {
    return TransferListState();
  } 
}
