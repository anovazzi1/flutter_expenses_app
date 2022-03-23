import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransaction;

  NewTransaction(this.addTransaction);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final TextEditingController title = TextEditingController();

  final TextEditingController amount = TextEditingController();

  void addTransactionfunction()
  {
    widget.addTransaction(title.text,double.parse(amount.text));

  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: "title"),controller: title,
            ),
            TextField(decoration: InputDecoration(labelText: "amount"),controller: amount,keyboardType: TextInputType.number,),
            TextButton(
                onPressed: addTransactionfunction,
                child: Text(
                  'Add transaction',
                  style: TextStyle(color: Colors.blue.shade800),
                ))
          ],
        ),
      ),
    );
  }
}
