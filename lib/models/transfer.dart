import 'package:bytebank/models/contact.dart';

class Transfer {
  final double value;
  final int account;
  final Contact contact;

  Transfer({
    this.value,
    this.contact,
    this.account
  });

  Transfer.fromJson(Map<String, dynamic> json) :
    value = json['value'],
    contact = Contact.fromJson(json['contact']),
    account = (json['account'] != null) ? json['account'] : json['accountNumber'];

  Map<String, dynamic> toJson() =>
    {
      'value': value,
      'account': account,
      'contact': contact.toJson(),
    };

  @override
  String toString() {
    return 'Transferência{value: $value}, {contact: $contact}, {account: $account}';
  }
}
