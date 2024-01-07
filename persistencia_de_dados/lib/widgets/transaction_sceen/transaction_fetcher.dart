import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:persistencia_de_dados/widgets/transaction_sceen/transaction_list.dart';
import 'package:provider/provider.dart';
import '../../providers/database_provider.dart';

class TransactionFetcher extends StatefulWidget {
  final String category;
  const TransactionFetcher(this.category, {super.key});

  @override
  State<TransactionFetcher> createState() => _TransactionFetcherState();
}

class _TransactionFetcherState extends State<TransactionFetcher> {
  late Future _transactionList;
  Future getTransacionList() async {
    final provider = Provider.of<DatabaseProvider>(context, listen: false);
    return await provider.fetchTransactions(category: widget.category);
  }

  @override
  void initState() {
    super.initState();
    _transactionList = getTransacionList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _transactionList,
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else {
            return const TransactionList();
          }
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
