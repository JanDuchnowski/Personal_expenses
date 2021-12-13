import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleControler = TextEditingController();
  final amountControler = TextEditingController();
  final Function addNewItem;

  NewTransaction(this.addNewItem);
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
              controller: titleControler,
            ),
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              controller: amountControler,
            ),
            ElevatedButton(
                onPressed: () {
                  addNewItem(
                      titleControler.text, double.parse(amountControler.text));
                },
                child: Text("Add Transaction")),
          ],
        ),
      ),
    );
  }
}
