import 'dart:convert';
import 'package:bytebank/models/contact.dart';
import 'package:bytebank/models/transfer.dart';
import 'package:http/http.dart';
import 'package:bytebank/services/service.dart';

class Api {
  final String _url = 'http://192.168.130.141:4040';

  List<Transfer> _mapTransfers(data) {
    final List<dynamic> decodedJson = jsonDecode(data);
    return decodedJson.map((dynamic transactionJson) {
      final Map<String, dynamic> contactJson = transactionJson['contact'];
      return Transfer(
        value: transactionJson['value'],
        contact: Contact(
          name: contactJson['name'],
          account: contactJson['accountNumber']
        )
      );
    }).toList();
  }

  Map<String, dynamic> _mapTransaction(data) {
    return {
      'value': data.value,
      'contact': {
        'name': data.contact.name,
        'accountNumber': data.contact.account
      }
    };
  }

  Transfer _mapResponse(data) {
    Map<String, dynamic> json = jsonDecode(data);
    final Map<String, dynamic> contactJson = json['contact'];
    return Transfer(
      value: json['value'],
      contact: Contact(
        name: contactJson['name'],
        account: contactJson['accountNumber'],
      ),
    );
  }

  Future<List<Transfer>> findAll() async {
    final Response response = await client.get(_url + '/transactions');
   final List<Transfer> transactions = _mapTransfers(response.body);
    return transactions;
  }

  Future<Transfer> save(Transfer transaction, String password) async {
    final Map<String, dynamic> transactionMap = _mapTransaction(transaction);
    final Response response = await client.post(
      _url + '/transactions',
      headers: {
        'Content-type': 'application/json',
        'password': password
      },
      body: jsonEncode(transactionMap)
    );

    if(response.statusCode == 200) {
      return _mapResponse(response.body);
    } else if(response.statusCode == 400) {
      throw HttpException('Empty fields');
    } else if(response.statusCode == 401) {
      throw HttpException('Authentication failed');
    } else {
      throw HttpException('Unknown Error');
    }
  }
}

class HttpException implements Exception {
  final String message;

  HttpException(this.message);
}