import 'package:bytebank/components/text-input.dart';
import 'package:bytebank/models/transfer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const _title = 'Criando Transferência';
const _labelAccount = 'Número da conta';
const _labelValue = 'Valor';
const _placeholderAccount = '123123-X';
const _placeholderValue = '50.00';
const _confirm = 'Confirmar';

class FormTransferState extends State<FormTransfer> {
  final TextEditingController _controllerAccount = TextEditingController();
  final TextEditingController _controllerValue = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TextInput(
              controller: _controllerAccount,
              label: _labelAccount,
              placeholder: _placeholderAccount
            ),
            TextInput(
              controller: _controllerValue,
              label: _labelValue,
              placeholder: _placeholderValue,
              icon: Icons.monetization_on,
              type: TextInputType.number
            ),
            RaisedButton(
              child: Text(_confirm),
              onPressed: () => _buildTransfer(context),
            )
          ]
        ),
      ),
      appBar: AppBar(
        title: const Text(_title),
      ),
    );
  }

  void _buildTransfer(context) {
    final String account = _controllerAccount.text;
    final double value = double.tryParse(_controllerValue.text);
    if(account != null && value != null){
      final newTransfer = Transfer(value: value, account: account);
      Navigator.pop(context, newTransfer);
    }
  }
}

class FormTransfer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormTransferState();
  }
}
