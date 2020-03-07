import 'package:flutter/material.dart';

void main() => runApp(
  BytebankApp()
);

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: TransferList(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TransferList extends StatelessWidget {

  final List<Transfer> _transfers = List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _transfers.length,
        itemBuilder: (context, index) {
          final item = _transfers[index];
          return Item(item);
        },
      ),
      appBar: AppBar(
        title: const Text('Transferências'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          final Future<Transfer> future = Navigator.push(context, MaterialPageRoute(
            builder: (context) => FormTransfer() 
          ));
          future.then((transfer) {
            _transfers.add(transfer);
          });
        },
      ),
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

  @override
  String toString() {
    return 'Transferência{valor: $value}, {conta: $account}';
  }
}

class FormTransfer extends StatelessWidget {

  final TextEditingController _controllerAccount = TextEditingController();
  final TextEditingController _controllerValue = TextEditingController();

  FormTransfer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          TextInput(
            controller: _controllerAccount,
            label: 'Número da conta',
            placeholder: '123123-X'
          ),
          TextInput(
            controller: _controllerValue,
            label: 'Valor',
            placeholder: '50.00',
            icon: Icons.monetization_on
          ),
          RaisedButton(
            child: Text('Confirmar'),
            onPressed: () => _buildTransfer(context),
          )
        ]
      ),
      appBar: AppBar(
        title: const Text('Criando transferência'),
      ),
    );
  }

  void _buildTransfer(context) {
    final String account = _controllerAccount.text;
    final double value = double.tryParse(_controllerValue.text);
    if(account != null && value != null){
      final newTransfer = Transfer(value, account);
      Navigator.pop(context, newTransfer);
    }
  }
}


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