class Transaction {
  final int id;
  final String title;
  final String description;
  final double amount;
  final DateTime date;
  final String category;

  Transaction({
    required this.id,
    required this.description,
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  });

  Map<String, dynamic> toMap() => {
        'title': title,
        'description': description,
        'amount': amount.toString(),
        'date': date.toString(),
        'category': category,
      };

  factory Transaction.fromString(Map<String, dynamic> value) => Transaction(
      id: value['id'],
      title: value['title'],
      description: value['description'],
      amount: value['amount'],
      date: value['date'],
      category: value['category']);
}
