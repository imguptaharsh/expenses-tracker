import 'package:flutter/material.dart';
import './textInput.dart';
import './transaction_list.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  const UserTransactions({super.key});

  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
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
  void _addNewtransaction(String txTitle, double txAmount) {
    final nwTx = Transaction(
      DateTime.now().toString(),
      txTitle,
      txAmount,
      DateTime.now(),
    );
    setState(() {
      transactions.add(nwTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        textInput(_addNewtransaction),
        // TransactionList(transactions,),
      ],
    );
  }
}
