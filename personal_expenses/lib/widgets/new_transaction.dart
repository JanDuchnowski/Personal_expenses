import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewItem;

  NewTransaction(this.addNewItem);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  TextEditingController _titleControler = TextEditingController();
  TextEditingController _amountControler = TextEditingController();
  DateTime _selectedDate;

  void _submitData() {
    if (_amountControler.text.isEmpty) {
      return;
    }
    final _enteredTitle = _titleControler.text;
    final _enteredAmount = double.parse(_amountControler.text);

    if (!(_enteredTitle.isEmpty) &&
        (_enteredAmount >= 0) &&
        _selectedDate != null) {
      widget.addNewItem(
        _enteredTitle,
        _enteredAmount,
        _selectedDate,
      );
      Navigator.of(context).pop();
    }
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    }); // showDatePicker returns a Future which stores the chosen date
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: "Title"),
              onSubmitted: (_) => _submitData(),
              controller: _titleControler,
            ),
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              keyboardType: TextInputType.number,
              onSubmitted: (_) =>
                  _submitData(), // We gen an argument but we don't use it
              controller: _amountControler,
            ),
            Container(
              height: 70,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      _selectedDate == null
                          ? "No Date Chosen"
                          : DateFormat.yMd().format(_selectedDate),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.purple[300])),
                      onPressed: _presentDatePicker,
                      child: Text(
                        "Choose Date",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
            ),
            ElevatedButton(
              onPressed: _submitData,
              child: Text(
                "Add Transaction",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.purple[300])),
            ),
          ],
        ),
      ),
    );
  }
}
