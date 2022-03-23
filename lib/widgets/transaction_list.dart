import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _transactions;
  TransactionList(this._transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: _transactions.isEmpty
          ? Column(
              children: [
                Text("No transactions added yet"),
                SizedBox.square(dimension: 10,),
                Container(
                  height: 250,
                  width: double.infinity,
                  child: Image.asset(
                    "assets/images/empty.png",
                    fit: BoxFit.fill,
                  ),
                )
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  child: Row(
                    children: [
                      Container(
                        child: Text(
                          '\$${_transactions[index].amount}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                              fontSize: 20),
                        ),
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.red)),
                        padding: EdgeInsets.all(10),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _transactions[index].title as String,
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            DateFormat.yMMMd()
                                .format(_transactions[index].date!),
                            style: TextStyle(color: Colors.purple.shade300),
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
              itemCount: _transactions.length,
            ),
    );
  }
}
