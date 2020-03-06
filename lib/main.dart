import 'package:flutter/material.dart';

void main() => runApp(
  BytebankApp()
);

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FormTransfer(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TransferList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
      ),
      appBar: AppBar(
        title: const Text('Transferências'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: null,
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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _controllerAccount,
              style: TextStyle(
                fontSize: 24.0
              ),
              decoration: InputDecoration(
                labelText: 'Número da Conta',
                hintText: '12345-7'
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _controllerValue,
              style: TextStyle(
                fontSize: 24.0
              ),
              decoration: InputDecoration(
                labelText: 'Valor',
                hintText: '50.00',
                icon: Icon(Icons.monetization_on)
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          RaisedButton(
            child: Text('Confirmar'),
            onPressed: () {
              final String account = _controllerAccount.text;
              final double value = double.tryParse(_controllerValue.text);
              if(account != null && value != null){
                final newTransfer = Transfer(value, account);
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text('$newTransfer'),
                  ),
                );
              }
            },
          )
        ]
      ),
      appBar: AppBar(
        title: const Text('Criando transferência'),
      ),
    );
  }
}