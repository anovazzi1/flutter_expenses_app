import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransaction;

  NewTransaction(this.addTransaction);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final TextEditingController title = TextEditingController();
  DateTime? selectedDate;
  final TextEditingController amount = TextEditingController();

  void addTransactionfunction() {
    if(title.text.isEmpty || double.parse(amount.text)<0|| selectedDate==null || amount.text.isEmpty)
      {
        return;
      }

    widget.addTransaction(title.text, double.parse(amount.text),selectedDate);
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        selectedDate = value;
      });
    });
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
              decoration: InputDecoration(labelText: "title"),
              controller: title,
            ),
            TextField(
              decoration: InputDecoration(labelText: "amount"),
              controller: amount,
              keyboardType: TextInputType.number,
            ),
            Row(
              children: [
                Text(selectedDate == null
                    ? 'please select a date'
                    : DateFormat.yMd().format(selectedDate!)),
                TextButton(
                  child: Text("select date",
                      style: Theme.of(context).textTheme.button),
                  onPressed: _presentDatePicker,
                )
              ],
            ),
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
