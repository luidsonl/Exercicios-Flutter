import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cash_transaction.dart';
import '../providers/database_provider.dart';

class TransactionForm extends StatefulWidget {
  const TransactionForm({super.key});

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _title = TextEditingController();
  final _description = TextEditingController();
  final _amount = TextEditingController();
  String _category = 'Entrada';
  DateTime? _date;

  _pickDate() async {
    DateTime? pickDate = await showDatePicker(
        helpText: 'Selecione a data',
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));

    if (pickDate != null) {
      setState(() {
        _date = pickDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DatabaseProvider>(context, listen: false);

    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(children: [
          Row(
            children: [
              const Expanded(child: Text('Tipo de operação')),
              Column(children: [
                const Text('Entrada'),
                Radio(
                  value: 'Entrada',
                  groupValue: _category,
                  onChanged: (value) {
                    setState(() {
                      _category = value!;
                    });
                  },
                ),
              ]),
              const SizedBox(
                width: 20.0,
              ),
              Column(children: [
                const Text('Saída'),
                Radio(
                  value: 'Saída',
                  groupValue: _category,
                  onChanged: (value) {
                    setState(() {
                      _category = value!;
                    });
                  },
                ),
              ])
            ],
          ),
          TextField(
            controller: _title,
            decoration: const InputDecoration(label: Text('Título')),
          ),
          TextField(
            maxLines: 2,
            controller: _description,
            decoration: const InputDecoration(label: Text('Descrição')),
          ),
          TextField(
            controller: _amount,
            decoration: const InputDecoration(label: Text('Valor')),
          ),
          Row(
            children: [
              Expanded(
                  child: Text(
                      _date != null ? _date.toString() : 'Data da transação')),
              IconButton(
                  onPressed: _pickDate, icon: const Icon(Icons.calendar_month))
            ],
          ),
          ElevatedButton.icon(
            icon: const Icon(Icons.add),
            onPressed: () {
              if (_title.text != '' && _amount.text != '') {
                final file = CashTransaction(
                    id: 0,
                    description: _description.text,
                    title: _title.text,
                    amount: double.parse(_amount.text),
                    date: _date != null ? _date! : DateTime.now(),
                    category: _category);

                provider.addTransaction(file);

                Navigator.of(context).pop();
              }
            },
            label: const Text('Adicionar'),
          )
        ]),
      ),
    );
  }
}
