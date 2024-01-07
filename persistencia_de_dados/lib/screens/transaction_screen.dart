import 'package:flutter/material.dart';
import '../widgets/transaction_sceen/transaction_fetcher.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({super.key});

  static const name = '/transaction_screen';

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(title: Text(category)),
      body: TransactionFetcher(category),
    );
  }
}
