import 'package:bytebank/components/centered-message.dart';
import 'package:bytebank/components/loader.dart';
import 'package:bytebank/models/transfer.dart';
import 'package:bytebank/services/api.dart';
import 'package:flutter/material.dart';

class TransactionsList extends StatelessWidget {
  final Api _api = Api();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transactions'),
      ),
      body: FutureBuilder<List<Transfer>>(
        future: _api.findAll(),
        builder: (context, snapshot) {
          switch(snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Loader();
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              if (snapshot.hasError) {
                return CenteredMessage(
                  'No transactions found',
                  icon: Icons.warning
                );
              }
              final List<Transfer> transactions = snapshot.data;
              if (transactions.isEmpty) {
                return CenteredMessage(
                  'No transactions found',
                  icon: Icons.warning
                );
              }
              return ListView.builder(
                itemBuilder: (context, index) {
                  final Transfer transaction = transactions[index];
                  return Card(
                    child: ListTile(
                      leading: Icon(Icons.monetization_on),
                      title: Text(
                        transaction.value.toString(),
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        transaction.contact.account.toString(),
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  );
                },
                itemCount: transactions.length,
              );
              break;
          }
          return CenteredMessage('Error');
        }
      ),
    );
  }
}
