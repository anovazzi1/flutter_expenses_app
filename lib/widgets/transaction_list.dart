import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final Function delete;
  final List<Transaction> _transactions;
  TransactionList(this._transactions,this.delete);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: _transactions.isEmpty
          ? Column(
              children: [
                Text("No transactions added yet"),
                SizedBox.square(
                  dimension: 10,
                ),
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
                  elevation: 6,
                    child: ListTile(
                      trailing: IconButton(onPressed:(){delete(_transactions[index].id);} ,icon: Icon(Icons.delete_outline,color: Theme.of(context).errorColor,),),
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: EdgeInsets.all(6),
                      child: FittedBox(
                        child: Text("\$${_transactions[index].amount}"),
                      ),
                    ),
                  ),
                      title: Text(_transactions[index].title,style: TextStyle(color: Colors.red),),
                      subtitle: Text(DateFormat.yMMMd().format(_transactions[index].date)),
                ));
              },
              itemCount: _transactions.length,
            ),
    );
  }
}
