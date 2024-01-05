import 'package:flutter/material.dart';
import '../constantes/icons.dart';

class TransactionCategory {
  final String title;
  int isExpense;
  int entries = 0;
  double totalAmount = 0.0;
  final IconData icon;

  TransactionCategory(
      {required this.title,
      required this.isExpense,
      required this.entries,
      required this.totalAmount,
      required this.icon});

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
          totalAmount: double.parse(value['totalAmount']),
          icon: icons[value['title']]!);
}
