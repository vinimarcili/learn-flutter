import 'package:bytebank/models/contact.dart';

class Transfer {
  final double value;
  final String account;
  final Contact contact;

  Transfer({
    this.value,
    this.contact,
    this.account
  });

  @override
  String toString() {
    return 'Transferência{value: $value}, {contact: $contact}, {account: $account}';
  }
}
