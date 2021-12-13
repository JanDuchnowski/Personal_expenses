import 'package:flutter/material.dart';
import 'package:personal_expenses/widgets/user.transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  String titleInput;
  String amountInput;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter App"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            child: Container(
                color: Colors.blue,
                width: double.infinity,
                child: Text("CHART")),
            elevation: 5,
          ),
          UsersTransactions(),
        ],
      ),
    );
  }
}
