import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  // const ChartBar({super.key});
  final String label;
  final double spendingAmount;
  final double spendingPctOfTotal;
  ChartBar(this.label, this.spendingAmount, this.spendingPctOfTotal);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 20,
            child: FittedBox(
                child: Text('₹${spendingAmount.toStringAsFixed(0)}'))),
        SizedBox(
          width: 7,
          height: 6,
        ),
        Container(
            height: 80,
            width: 12,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.0),
                    color: Color.fromARGB(220, 220, 220, 220),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                FractionallySizedBox(
                    heightFactor: spendingPctOfTotal,
                    child: Container(
                        decoration: BoxDecoration(
                      // border: Border.all(color: Colors.grey, width: 1.0),
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ))),
              ],
            )),
        Text(label),
      ],
    );
  }
}
