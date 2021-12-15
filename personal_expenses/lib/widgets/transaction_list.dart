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
        child: transactions.isEmpty
            ? Column(
                children: [
                  Text(
                    "No transactions added yet!",
                    style: TextStyle(
                        fontFamily: 'Quicksand', fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 200,
                    child: Center(
                      child: Image.asset(
                        "assets/images/waiting.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              )
            : ListView.builder(
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
                              border: Border.all(
                            color: Theme.of(context).primaryColor,
                            width: 2,
                          )),
                          child: Text(
                            " \$${transactions[index].amount.toStringAsFixed(2)}", // Maximal 2 digits after the decimal point
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              transactions[index].title,
                              style: TextStyle(
                                  fontFamily: 'OpenSans',
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                                DateFormat.yMd().format(
                                  transactions[index].date,
                                ),
                                style: TextStyle(
                                  color: Colors.grey[500],
                                )),
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
