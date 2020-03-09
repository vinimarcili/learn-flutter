class Contact {
  final int id;
  final String name;
  final String account;

  Contact(
    this.id,
    this.name,
    this.account
  );

  @override
  String toString() {
    return 'Contact {id: $id}, {valor: $name}, {conta: $account}';
  }
}