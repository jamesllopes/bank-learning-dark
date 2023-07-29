class Account {
  String name;
  double balance;
  bool isAuthenticated;

  Account(
      {required this.name,
      required this.balance,
      required this.isAuthenticated})
      : assert(name.isNotEmpty, 'O nome não pode ser vazio.'),
        assert(balance >= 0, 'O Saldo não pode ser negativo');

  editBalance({required value}) {
    balance = balance + value;
  }
}
