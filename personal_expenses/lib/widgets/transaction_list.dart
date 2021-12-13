import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);
  @override
  Widget build(BuildContext context) {
    return Column(
        children: transactions.map((transaction) {
      return Card(
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.symmetric(
                vertical: 19,
                horizontal: 15,
              ),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.purple, width: 2)),
              child: Text(
                " \$${transaction.amount}",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.purple),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.title,
                  style: TextStyle(fontSize: 15),
                ),
                Text(DateFormat.yMd().format(transaction.date),
                    style: TextStyle(color: Colors.grey[500])),
              ],
            )
          ],
        ),
      );
    }).toList());
  }
}
