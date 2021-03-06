import 'dart:async';

import 'package:bytebank/components/dialog-response.dart';
import 'package:bytebank/components/dialog-transaction-auth.dart';
import 'package:bytebank/components/text-input.dart';
import 'package:bytebank/models/contact.dart';
import 'package:bytebank/models/transfer.dart';
import 'package:bytebank/services/api.dart';
import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final Contact contact;

  TransactionForm(this.contact);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final TextEditingController _valueController = TextEditingController();
  final Api _api = Api();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New transaction'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                widget.contact.name,
                style: TextStyle(
                  fontSize: 24.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  widget.contact.account.toString(),
                  style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextInput(
                controller: _valueController,
                label: 'Value',
                icon: Icons.monetization_on,
                type: TextInputType.numberWithOptions(decimal: true)
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: SizedBox(
                  width: double.maxFinite,
                  child: RaisedButton(
                    child: Text('Transfer'), onPressed: () {
                      final double value = double.tryParse(_valueController.text);
                      final transactionCreated = Transfer(
                        value: value,
                        contact: widget.contact
                      );
                      showDialog(
                        context: context,
                        builder: (contextDialog) {
                          return TransactionAuth(
                            onConfirm: (String password) {
                              _save(transactionCreated, password, context);
                            },
                          );
                        }
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _save(
    Transfer transaction,
    String password,
    BuildContext context
  ) async {
    final newTransaction = await _api.save(transaction, password)
      .catchError((err) {
        showDialog(
          context: context,
          builder: (contextDialogInside) => FailureDialog('Imeout submitting')
        );
      }, test: (err) => err is TimeoutException)
      .catchError((err) {
        showDialog(
          context: context,
          builder: (contextDialogInside) => FailureDialog(err.message)
        );
      }, test: (err) => err is HttpException)
      .catchError((err) {
        showDialog(
          context: context,
          builder: (contextDialogInside) => FailureDialog('Unknown Error')
        );
      }, test: (err) => err is Exception);

    if (newTransaction != null) {
      await showDialog(
        context: context,
        builder: (contextDialogInside) => SuccessDialog('Transaction created')
      );
      Navigator.pop(context);
    }
  }
}
