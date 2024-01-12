import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/cash_transaction.dart';
import '../../providers/database_provider.dart';

class ConfirmBox extends StatelessWidget {
  const ConfirmBox({
    super.key,
    required this.transaction,
  });

  final CashTransaction transaction;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DatabaseProvider>(context, listen: false);
    return AlertDialog(
      title: Text('Deletar "${transaction.title}" ?'),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text('Não deletar')),
          ElevatedButton(
              onPressed: () {
                provider.deleteTransaction(transaction.id);
                Navigator.of(context).pop();
              },
              child: const Text('Deletar'))
        ],
      ),
    );
  }
}
