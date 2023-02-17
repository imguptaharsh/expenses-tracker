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
    return Container(
      height: 670,
      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                  "No transaction added yet!",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    child: Image.asset(
                  'assets/images/waiting.png',
                  fit: BoxFit.cover,
                )),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                // return Card(
                //   elevation: 5,
                //   child: Row(
                //     // mainAxisAlignment: MainAxisAlignment.spaceAround,
                //     children: <Widget>[
                //       Container(
                //         margin: const EdgeInsets.symmetric(
                //           vertical: 20,
                //           horizontal: 10,
                //         ),
                //         decoration: BoxDecoration(
                //           border: Border.all(
                //             color: Colors.black,
                //             width: 2,
                //           ),
                //           color: Theme.of(context).primaryColorLight,
                //         ),
                //         padding: EdgeInsets.all(10),
                //         child: Text(
                //             ' \₹${transactions[index].amount.toStringAsFixed(2)}',
                //             // ignore: prefer_const_constructors
                //             style: TextStyle(
                //               fontWeight: FontWeight.bold,
                //               fontSize: 15,
                //               color: Colors.black,
                //             )),
                //       ),
                //       Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Container(
                //               child: Text(
                //             transactions[index].name,
                //             // ignore: prefer_const_constructors
                //             style: Theme.of(context).textTheme.titleMedium,
                //           )),
                //           Text(
                //             DateFormat().format(transactions[index].date),
                //           ),
                //         ],
                //       ),
                //     ],
                //   ),
                // );

                return Card(
                  color: Theme.of(context).primaryColorLight,
                  elevation: 2,
                  margin: EdgeInsets.symmetric(
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
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => deleteTx(transactions[index].id),
                    ),
                  ),
                );
              },
              itemCount: transactions.length,
              // children: transactions.map((tx) {}).toList(),
            ),
    );
  }
}
