import 'package:flutter/material.dart';

class TransactionAuthState extends State<TransactionAuth> {

  final TextEditingController _passwordControlller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Athenticate'),
      content: TextField(
        controller: _passwordControlller,
        obscureText: true,
        maxLength: 4,
        decoration: InputDecoration(
          border: OutlineInputBorder()
        ),
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 64.0,
          letterSpacing: 24.0
        ),
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            if (widget.onCancel != null) {
              widget.onCancel();
            }
            Navigator.pop(context);
          },
          child: Text('Cancel')
        ),
        FlatButton(
          onPressed: () {
            widget.onConfirm(_passwordControlller.text);
            Navigator.pop(context);
          },
          child: Text('Confirm')
        )
      ],
    );
  }
}

class TransactionAuth extends StatefulWidget {
  final Function(String password) onConfirm;
  final Function() onCancel;

  TransactionAuth({
    @required this.onConfirm,
    this.onCancel
  });

  @override
  State<StatefulWidget> createState() {
    return TransactionAuthState();
  }
}