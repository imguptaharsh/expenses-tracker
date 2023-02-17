import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';

class Transaction {
  String id;
  String name;
  double amount;
  DateTime date;
  Transaction(
    this.id,
    this.name,
    this.amount,
    this.date,
  );
}
