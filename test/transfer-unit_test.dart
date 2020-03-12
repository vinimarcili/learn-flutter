import 'package:bytebank/models/transfer.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  test('Should return the value when create a transaction', () {
    final transaction = Transfer(value: 200, contact: null);
    expect(transaction.value, 200);
  });

  test('Should show error when create a transaction with value less than zero', () {
    expect(() => Transfer(value: -1, contact: null), throwsAssertionError);
  });
}