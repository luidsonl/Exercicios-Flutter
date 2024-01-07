import 'package:flutter/material.dart';
import 'package:persistencia_de_dados/providers/database_provider.dart';
import 'package:persistencia_de_dados/screens/category_screen.dart';
import 'package:persistencia_de_dados/screens/transaction_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => DatabaseProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: CategoryScreen.name,
      routes: {
        CategoryScreen.name: (_) => const CategoryScreen(),
        TransactionScreen.name: (_) => const TransactionScreen()
      },
    );
  }
}
