import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewItem;

  NewTransaction(this.addNewItem);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  TextEditingController titleControler = TextEditingController();

  TextEditingController amountControler = TextEditingController();

  void submitData() {
    final enteredTitle = titleControler.text;
    final enteredAmount = double.parse(amountControler.text);
    if (!(enteredTitle.isEmpty) && (enteredAmount >= 0)) {
      widget.addNewItem(enteredTitle, enteredAmount);
      Navigator.of(context).pop();
    }
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
              onSubmitted: (_) => submitData(),
              controller: titleControler,
            ),
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              keyboardType: TextInputType.number,
              onSubmitted: (_) =>
                  submitData(), // We gen an argument but we don't use it
              controller: amountControler,
            ),
            ElevatedButton(
                onPressed: submitData, child: Text("Add Transaction")),
          ],
        ),
      ),
    );
  }
}
