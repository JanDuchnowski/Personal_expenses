import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        child: ListView.builder(
          itemBuilder: (ctx, index) {
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
                      " \$${transactions[index].amount.toStringAsFixed(2)}", // Maximal 2 digits after the decimal point
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
                        transactions[index].title,
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(DateFormat.yMd().format(transactions[index].date),
                          style: TextStyle(color: Colors.grey[500])),
                    ],
                  )
                ],
              ),
            );
          },
          itemCount: transactions.length,
        ));
  }
}
