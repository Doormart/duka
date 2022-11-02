class WalletModel {
  final String title, dateTime;
  final double price, balance;
  final bool debit;

  WalletModel({
    required this.title,
    required this.dateTime,
    required this.price,
    required this.balance,
    required this.debit,
  });
}
