import 'package:flutter/material.dart';
import '../../models/transaction_category.dart';

class CategoryCard extends StatelessWidget {
  final TransactionCategory category;
  const CategoryCard(this.category, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(category.title),
      subtitle: Text('Contagem: ${category.entries}'),
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(category.icon),
      ),
      trailing: Text('R\$ ${(category.totalAmount).toStringAsFixed(2)}'),
    );
  }
}
