import 'dart:convert';
import 'package:bytebank/models/transfer.dart';
import 'package:bytebank/models/contact.dart';
import 'package:bytebank/services/log-client.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_client_with_interceptor.dart';

const String _url = 'http://192.168.130.141:4040';

Future<List<Transfer>> findAll() async {
  final Client client = HttpClientWithInterceptor.build(interceptors: [LoggingInterceptor()]);
  final Response response = await client.get(_url + '/transactions').timeout(
    Duration(seconds: 5) 
  );
  final List<dynamic> decodedJson = jsonDecode(response.body);
  final List<Transfer> transactions = List();
  for(Map<String, dynamic> transactionJson in decodedJson){
    final Map<String, dynamic> contactJson = transactionJson['contact'];
    final Transfer transaction = Transfer(
      value: transactionJson['value'],
      contact: Contact(
        name: contactJson['name'],
        account: contactJson['account']
      )
    );
    transactions.add(transaction);
  }
  return transactions;
}