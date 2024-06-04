import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';
import './user_transaction.dart';
import 'user_transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;
  const TransactionList(this.transactions, this.deleteTx);
  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (context, constraints) {
            return Stack(
              children: [
                Container(
                    // height: constraints.maxHeight * .6,
                    width: constraints.maxWidth,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    )),
                Center(
                  child: const Text(
                    "No transaction added yet!",
                    style: TextStyle(color: Colors.white, fontSize: 23),
                  ),
                ),
              ],
            );
          })
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return Card(
                color: Theme.of(context).primaryColorLight,
                elevation: 2,
                margin: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 5,
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 40,
                    child: Padding(
                      padding: EdgeInsets.all(6),
                      child: FittedBox(
                        child: Text(
                          ' \₹${transactions[index].amount}',
                          // ignore: prefer_const_constructors
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    transactions[index].name,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  subtitle: Text(
                    DateFormat.yMMMd().format(transactions[index].date),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  trailing: MediaQuery.of(context).size.width > 460
                      ? TextButton.icon(
                          icon: Icon(
                            Icons.delete,
                            color: Theme.of(context).primaryColor,
                          ),
                          onPressed: () => deleteTx(transactions[index].id),
                          label: Text("Delete",
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                              )),
                        )
                      : IconButton(
                          icon: const Icon(
                            Icons.delete,
                          ),
                          onPressed: () => deleteTx(transactions[index].id),
                        ),
                ),
              );
            },
            itemCount: transactions.length,
            // children: transactions.map((tx) {}).toList(),
          );
  }
}
