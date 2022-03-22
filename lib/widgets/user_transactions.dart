import 'package:expenses_app/models/transaction.dart';
import 'package:expenses_app/widgets/new_transaction.dart';
import 'package:expenses_app/widgets/transaction_list.dart';
import 'package:flutter/material.dart';

class UsersTransactions extends StatefulWidget {
  const UsersTransactions({Key? key}) : super(key: key);

  @override
  _UsersTransactionsState createState() => _UsersTransactionsState();
}

class _UsersTransactionsState extends State<UsersTransactions> {
  final List<Transaction> transactions = [
    Transaction(amount: 100.0, date: DateTime.now(), id: 't1', title: 'Shoes')
  ];

  void _addNewTransaction(String title, double amount) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: DateTime.now());
    setState(() {
      transactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTransaction),
      ],
    );
  }
}
