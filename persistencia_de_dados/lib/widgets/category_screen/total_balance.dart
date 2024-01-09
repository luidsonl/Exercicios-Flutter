import 'package:flutter/material.dart';
import 'package:persistencia_de_dados/providers/database_provider.dart';
import 'package:provider/provider.dart';

class TotalBalance extends StatelessWidget {
  const TotalBalance({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(
      builder: (_, db, __) {
        var list = db.categories;
        double realTotalAmount = 0;

        for (int i = 0; i < list.length; i++) {
          realTotalAmount += list[i].getTotalAmount();
        }

        Color? color =
            realTotalAmount > 0 ? Colors.green[100] : Colors.red[100];

        return Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: color, // Cor de fundo do Container
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const Text('Saldo'),
                Text(
                  '${realTotalAmount.toStringAsFixed(2)} R\$',
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
