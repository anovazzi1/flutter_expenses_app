import 'package:expenses_app/widgets/Chart.dart';
import 'package:expenses_app/widgets/new_transaction.dart';
import 'package:expenses_app/widgets/transaction_list.dart';
import 'package:expenses_app/widgets/user_transactions.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import 'models/transaction.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown,DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          titleTextStyle:
              TextStyle(fontFamily: 'Quicksand', fontWeight: FontWeight.bold,fontSize: 25),
        ),
      textTheme: ThemeData.light().textTheme.copyWith(
        headline6: TextStyle(fontFamily: "OpenSans",fontSize: 20),
        button: TextStyle(color: Colors.blue)
      )),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> transactions = [];

  List<Transaction> get _recentTransactions{
    
    return transactions.where(
        (e){
          return e.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
        }
    ).toList();
  }

  void _addNewTransaction(String title, double amount,DateTime choosenDate) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: choosenDate);
    setState(() {
      transactions.add(newTx);
    });
  }

  void deleteTransaction(String id)
  {
    setState(() {
      transactions.removeWhere((element) => element.id==id);
    });
  }


  void RunAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return NewTransaction(_addNewTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Money controller"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Chart(_recentTransactions),
              width: double.infinity,
            ),
            TransactionList(transactions,deleteTransaction),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => RunAddNewTransaction(context)),
    );
  }
}
