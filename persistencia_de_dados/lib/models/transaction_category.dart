import 'package:flutter/material.dart';
import '../constantes/icons.dart';

class TransactionCategory {
  final String title;
  int sign;
  int entries = 0;
  double totalAmount = 0.0;
  final IconData icon;

  getTotalAmount() {
    return totalAmount * sign;
  }

  TransactionCategory(
      {required this.title,
      required this.sign,
      required this.entries,
      required this.totalAmount,
      required this.icon});

  Map<String, dynamic> toMap() => {
        'title': title,
        'sign': sign,
        'entries': entries,
        'totalAmount': totalAmount.toString(),
      };

  factory TransactionCategory.fromString(Map<String, dynamic> value) =>
      TransactionCategory(
          title: value['title'],
          sign: value['sign'],
          entries: value['entries'],
          totalAmount: double.parse(value['totalAmount']),
          icon: icons[value['title']]!);
}
