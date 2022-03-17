import './transaction.dart';
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
          Column(
            children: transaction
                .map((e) => Card(
                      child: Row(children: [
                        Container(child: Text(e.amount.toString())),
                        Column(children: [
                          Text(e.title as String),
                          Text(e.date.toString())
                        ],)
                      ],),
                    ))
                .toList(),
          )
        ],
      ),
    );
  }
}
