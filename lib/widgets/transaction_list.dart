import 'package:flutter/material.dart';

import '../models/transaction.dart';

class TransactionList extends StatefulWidget {
  @override
  _TransactionListState createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  final List<Transaction> transactions = [
    Transaction(amount: 100.0, date: DateTime.now(), id: 't1', title: 'Shoes')
  ];
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
