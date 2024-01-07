import 'package:flutter/material.dart';
import 'package:persistencia_de_dados/screens/transaction_screen.dart';
import '../../models/transaction_category.dart';

class CategoryCard extends StatelessWidget {
  final TransactionCategory category;
  const CategoryCard(this.category, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.of(context)
            .pushNamed(TransactionScreen.name, arguments: category.title);
      },
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
