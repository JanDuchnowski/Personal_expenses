import 'package:flutter/material.dart';

import '../widgets/transaction_list.dart';
import '../widgets/new_transaction.dart';
import '../models/transaction.dart';

class UsersTransactions extends StatefulWidget {
  @override
  _UsersTransactionsState createState() => _UsersTransactionsState();
}

class _UsersTransactionsState extends State<UsersTransactions> {
  final List<Transaction> _usersTransactions = [
    Transaction(
        id: "t1", title: "New Shoes", amount: 70.50, date: DateTime.now()),
    Transaction(
        id: "t2", title: "Groceries", amount: 30.26, date: DateTime.now()),
  ];
  void _addNewTransaction(String title, double amount) {
    final newTransaction = Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: DateTime.now());

    setState(() {
      _usersTransactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTransaction),
        TransactionList(_usersTransactions),
      ],
    );
  }
}
