import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:persistencia_de_dados/models/transaction_category.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider with ChangeNotifier {
  List<TransactionCategory> _categories = [];
  List<TransactionCategory> get categories => _categories;

  Database? _database;

  Future<Database> get database async {
    final dbDirectory = await getDatabasesPath();

    const dbName = 'transactions_tc.db';

    final path = join(dbDirectory, dbName);

    _database = await openDatabase(path, version: 1, onCreate: _createDb);

    return _database!;
  }

  static const cTable = 'categoryTable';
  static const tTable = 'transactionTable';
  Future<void> _createDb(Database db, int version) async {
    await db.transaction((txn) async {
      await txn.execute('''CREATE TABLE $cTable(
          title TEXT,
          isExpense BOOL,
          entries INTEGER,
          totalAmount Text
        )''');

      await txn.execute('''CREATE TABLE $tTable(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        amount TEXT,
        date TEXT,
        category TEXT
      )''');

      await txn.insert(cTable, {
        'title': 'Entrada',
        'isExpense': false,
        'entries': 0,
        'totalAmount': 0
      });
      await txn.insert(cTable, {
        'title': 'Saída',
        'isExpense': true,
        'entries': 0,
        'totalAmount': 0
      });
    });
  }

  Future<List<TransactionCategory>> fetchCategories() async {
    final db = await database;
    return await db.transaction((txn) async {
      return await txn.query(cTable).then((data) {
        final converted = List<Map<String, dynamic>>.from(data);
        List<TransactionCategory> nList = List.generate(converted.length,
            (index) => TransactionCategory.fromString(converted[index]));

        _categories = nList;
        return _categories;
      });
    });
  }
}
