import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:persistencia_de_dados/models/transaction_category.dart';
import 'package:persistencia_de_dados/models/cash_transaction.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider with ChangeNotifier {
  List<TransactionCategory> _categories = [];
  List<TransactionCategory> get categories => _categories;

  List<CashTransaction> _transactions = [];
  List<CashTransaction> get transactions => _transactions;

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
          sign INTEGER,
          entries INTEGER,
          totalAmount Text
        )''');

      await txn.execute('''CREATE TABLE $tTable(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        description Text,
        amount TEXT,
        date INTEGER,
        category TEXT
      )''');

      await txn.insert(cTable,
          {'title': 'Entrada', 'sign': 1, 'entries': 0, 'totalAmount': 0});
      await txn.insert(cTable,
          {'title': 'Saída', 'sign': -1, 'entries': 0, 'totalAmount': 0});
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

  Future<List<CashTransaction>> fetchTransactions(
      {DateTime? startDate, DateTime? endDate, String? category}) async {
    String whereQuery = '';
    List<String> whereQueryArgs = [];

    if (startDate != null) {
      whereQuery += ' AND date >= ?';
      whereQueryArgs.add(startDate.toString());
    }
    if (endDate != null) {
      whereQuery += ' AND date <= ?';
      whereQueryArgs.add(endDate.toString());
    }
    if (category != null) {
      whereQuery += ' AND category = ?';
      whereQueryArgs.add(category);
    }

    final db = await database;
    return await db.transaction((txn) async {
      return await txn
          .query(tTable, where: '1 == 1 $whereQuery', whereArgs: whereQueryArgs)
          .then((data) {
        final converted = List<Map<String, dynamic>>.from(data);
        List<CashTransaction> nList = List.generate(converted.length,
            (index) => CashTransaction.fromString(converted[index]));

        _transactions = nList;
        return _transactions;
      });
    });
  }

  Future<CashTransaction> fetchSingleTransacton(int id) async {
    final db = await database;

    return await db.transaction((txn) async {
      return await txn
          .query(tTable, where: 'id = ?', whereArgs: [id]).then((data) {
        final converted = List<Map<String, dynamic>>.from(data);
        List<CashTransaction> nList = List.generate(converted.length,
            (index) => CashTransaction.fromString(converted[index]));

        return nList[0];
      });
    });
  }

  Future<void> updateCategory(
      String category, int nEntries, double nTotalAmount) async {
    final db = await database;
    await db.transaction((txn) async {
      await txn
          .update(
        cTable,
        {
          'entries': nEntries,
          'totalAmount': nTotalAmount,
        },
        where: "title == ?",
        whereArgs: [category],
      )
          .then((_) {
        var file =
            _categories.firstWhere((element) => element.title == category);
        file.entries = nEntries;
        file.totalAmount = nTotalAmount;

        notifyListeners();
      });
    });
  }

  Future<void> addTransaction(CashTransaction transaction) async {
    final db = await database;
    await db.transaction((txn) async {
      await txn
          .insert(
        tTable,
        transaction.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      )
          .then((generatedId) {
        final file = CashTransaction(
            id: generatedId,
            description: transaction.description,
            title: transaction.title,
            amount: transaction.amount,
            date: transaction.date,
            category: transaction.category);

        _transactions.add(file);

        var data = calculateEntriesAndAmount(transaction.category);

        updateCategory(
            transaction.category, data['entries'], data['totalAmount']);
        notifyListeners();
      });
    });
  }

  Future<void> deleteTransaction(int transactionId) async {
    final CashTransaction transaction =
        await fetchSingleTransacton(transactionId);
    final db = await database;

    await db.transaction((txn) async {
      await txn.delete(tTable,
          where: 'id == ?', whereArgs: [transactionId]).then((_) {
        _transactions.removeWhere((element) => element.id == transactionId);
        notifyListeners();
      });
    });

    final newCategoryData = calculateEntriesAndAmount(transaction.category);
    updateCategory(transaction.category, newCategoryData['entries'],
        newCategoryData['totalAmount']);
  }

  Map<String, dynamic> calculateEntriesAndAmount(String category) {
    double total = 0.0;

    var list =
        _transactions.where((element) => element.category == category).toList();

    for (final i in list) {
      total += i.amount;
    }
    return {'entries': list.length, 'totalAmount': total};
  }
}
