import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/database_provider.dart';
import 'transaction_card.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(builder: (_, db, __) {
      var transactionList = db.transactions;
      transactionList.sort((a, b) => b.date.compareTo(a.date));
      return ListView.builder(
          itemCount: transactionList.length,
          itemBuilder: (_, i) => TransactionCard(transactionList[i]));
    });
  }
}
