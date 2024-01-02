class TransactionCategory {
  final String title;
  int isExpense;
  int entries = 0;
  String totalAmount = '0';

  TransactionCategory(
      {required this.title,
      required this.isExpense,
      required this.entries,
      required this.totalAmount});

  Map<String, dynamic> toMap() => {
        'title': title,
        'isExpense': isExpense,
        'entries': entries,
        'totalAmount': totalAmount.toString(),
      };

  factory TransactionCategory.fromString(Map<String, dynamic> value) =>
      TransactionCategory(
          title: value['title'],
          isExpense: value['isExpense'],
          entries: value['entries'],
          totalAmount: value['totalAmount']);
}
