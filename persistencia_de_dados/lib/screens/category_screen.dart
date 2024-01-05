import 'package:flutter/material.dart';
import 'package:persistencia_de_dados/widgets/category_screen/category_fetcher.dart';
import 'package:persistencia_de_dados/widgets/transaction_form.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  static const name = '/category_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fluxo de caixa'),
      ),
      body: const CategoryFetcher(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (_) => const TransactionForm());
        },
      ),
    );
  }
}
