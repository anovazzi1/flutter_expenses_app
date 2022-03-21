import 'package:intl/intl.dart';

import 'models/transaction.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transaction = [
    Transaction(amount: 100.0, date: DateTime.now(), id: 't1', title: 'Shoes')
  ];
  TextEditingController text = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("flutter App"),
      ),
      body: Column(
        children: [
          Container(
            child: Card(
              child: Text(
                "Chart",
              ),
            ),
            width: double.infinity,
          ),
          Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    decoration: InputDecoration(labelText: "title"),
                  ),
                  TextField(decoration: InputDecoration(labelText: "title 2"),controller: text,),
                  TextButton(
                      onPressed: () {
                      },
                      child: Text(
                        'Add transaction',
                        style: TextStyle(color: Colors.blue.shade800),
                      ))
                ],
              ),
            ),
          ),
          Column(
            children: transaction
                .map((e) => Card(
                      child: Row(
                        children: [
                          Container(
                            child: Text(
                              '\$${e.amount}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                  fontSize: 20),
                            ),
                            margin: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 20),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.red)),
                            padding: EdgeInsets.all(10),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                e.title as String,
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                DateFormat.yMMMd().format(e.date!),
                                style: TextStyle(color: Colors.purple.shade300),
                              )
                            ],
                          )
                        ],
                      ),
                    ))
                .toList(),
          )
        ],
      ),
    );
  }
}
