import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/cash_transaction.dart';

class TransactionCard extends StatelessWidget {
  final CashTransaction transaction;

  const TransactionCard(this.transaction, {super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          //textTheme: const TextTheme(bodyMedium: TextStyle(height: 2)),
          ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(20),
        title: Text(
          transaction.title,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Descrição: ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(transaction.description),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Text(
                  'Data:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  DateFormat('dd/MM/yyyy').format(transaction.date),
                ),
              ],
            ),
          ],
        ),
        trailing: Text('${transaction.amount.toStringAsFixed(2)} R\$'),
      ),
    );
  }
}
