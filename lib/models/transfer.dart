class Transfer {
  final double value;
  final String account;

  Transfer(this.value, this.account);

  @override
  String toString() {
    return 'Transferência{valor: $value}, {conta: $account}';
  }
}
