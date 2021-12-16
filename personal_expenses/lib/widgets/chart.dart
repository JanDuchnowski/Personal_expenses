import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/widgets/chart_bar.dart';

import '../models/transaction.dart';
import 'chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> lastWeekTransactions;
  Chart(this.lastWeekTransactions);
  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      var totalSum = 0.0;
      for (var i = 0; i < lastWeekTransactions.length; i++) {
        if (lastWeekTransactions[i].date.day == weekDay.day &&
            lastWeekTransactions[i].date.month == weekDay.month &&
            lastWeekTransactions[i].date.year == weekDay.year) {
          totalSum += lastWeekTransactions[i].amount;
        }
      }
      print(DateFormat.E().format(weekDay));
      return {
        'day': DateFormat.E().format(weekDay),
        'amount': totalSum,
      };
    }).reversed.toList(); // today is on the right of the chart
  }

  double get totalSpending {
    return groupedTransactionValues.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransactionValues);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionValues.map((data) {
            return Flexible(
              fit: FlexFit
                  .tight, //child cannot grow larger than its assigned size
              child: ChartBar(
                data['day'],
                data['amount'],
                totalSpending == 0
                    ? 0.0
                    : ((data['amount'] as double) / totalSpending),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
