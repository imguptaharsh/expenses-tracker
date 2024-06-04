import 'package:flutter/material.dart';
import './user_transaction.dart';
import './main.dart';
import 'package:intl/intl.dart';

class textInput extends StatefulWidget {
  final Function addnewTransaction;
  textInput(this.addnewTransaction);

  @override
  State<textInput> createState() => _textInputState();
}

class _textInputState extends State<textInput> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  var _selectedDate;

  void submitData() {
    if (_amountController.text.isEmpty) return;
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null)
      return;

    widget.addnewTransaction(
      _titleController.text,
      double.parse(_amountController.text),
      _selectedDate,
    );
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2040),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColorLight,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          // border: Border.all(
          //   color: Theme.of(context).primaryColorDark,
          //   width: 2,
          // ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: 'Title...',
              ),
              controller: _titleController,
              onSubmitted: (_) => submitData,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Amount...',
              ),
              controller: _amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData,
            ),
            Row(
              children: [
                Container(
                  child: Text(
                    _selectedDate == null
                        ? "No date choosen yet!"
                        : "Picked Date: ${DateFormat.yMd().format(_selectedDate)}",
                  ),
                ),
                TextButton(
                  onPressed: _presentDatePicker,
                  child: Text(
                    "choose a date",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: submitData,
              // ignore: prefer_const_constructors
              child: Text(
                'Add Transaction',
                // ignore: prefer_const_constructors
                style: TextStyle(
                  color: Colors.green,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
