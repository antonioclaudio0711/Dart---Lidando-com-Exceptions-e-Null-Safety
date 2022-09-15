class Account {
  Account({
    required this.name,
    required this.balance,
    required this.isAuthenticated,
    this.createdAt,
  });

  String name;
  double balance;
  bool isAuthenticated;
  DateTime? createdAt;

  editBalance({required value}) {
    balance = balance + value;
  }
}
