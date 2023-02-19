import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ChartBar extends StatelessWidget {
  // const ChartBar({super.key});
  final String label;
  final double spendingAmount;
  final double spendingPctOfTotal;
  ChartBar(this.label, this.spendingAmount, this.spendingPctOfTotal);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, Constraints) {
      return Column(
        children: [
          Container(
              height: Constraints.maxHeight * 0.15,
              child: FittedBox(
                  child: Text('₹${spendingAmount.toStringAsFixed(0)}'))),
          SizedBox(
            width: 7,
            height: Constraints.maxHeight * 0.05,
          ),
          Container(
              height: Constraints.maxHeight * 0.6,
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
          SizedBox(
            width: 7,
            height: Constraints.maxHeight * 0.05,
          ),
          Container(
              height: Constraints.maxHeight * 0.15,
              child: FittedBox(child: Text(label))),
        ],
      );
    });
  }
}
