import 'package:expense_tracker/textInput.dart';
import 'package:expense_tracker/user_transaction.dart';
import 'package:flutter/material.dart';
import 'models/transaction.dart';
import 'package:intl/intl.dart';
import './transaction_list.dart';
import './textInput.dart';
import 'chart.dart';
import './user_transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.green,
          accentColor: Colors.amber,
          fontFamily: 'Quiksand',
          textTheme: ThemeData.light().textTheme.copyWith(
                // ignore: prefer_const_constructors
                titleMedium: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
          appBarTheme: AppBarTheme(
              textTheme: ThemeData.light().textTheme.copyWith(
                      // ignore: prefer_const_constructors
                      titleMedium: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  )))),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final List<Transaction> transactions = [
    // Transaction(
    //   't1',
    //   'Watch',
    //   3923,
    //   DateTime.now(),
    // ),
    // Transaction(
    //   't2',
    //   'Groceries',
    //   1827,
    //   DateTime.now(),
    // ),
  ];
  List<Transaction> get _recentTransactions {
    return transactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(const Duration(days: 7)));
    }).toList();
  }

  void _addNewtransaction(
      String txTitle, double txAmount, DateTime chosenDate) {
    final nwTx = Transaction(
      DateTime.now().toString(),
      txTitle,
      txAmount,
      chosenDate,
    );
    setState(() {
      transactions.add(nwTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: textInput(_addNewtransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  void _deleteTransaction(String kid) {
    setState(() {
      transactions.removeWhere((tx) => tx.id == kid);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Expenses Tracker',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          IconButton(
              onPressed: () => _startAddNewTransaction(context),
              icon: Icon(Icons.add)
              //  color: Colors.black,
              ),
        ],
      ),
      body: Container(
        color: Colors.black,
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Chart(_recentTransactions),
              TransactionList(transactions, _deleteTransaction),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          onPressed: () => _startAddNewTransaction(context),
          child: Icon(
            Icons.add,
            color: Theme.of(context).primaryColorLight,
          )),
    );
  }
}
