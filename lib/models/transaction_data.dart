import 'package:flutter/foundation.dart';
import 'package:expenseplanner/models/transaction.dart';
import 'dart:collection';

class TransactionData extends ChangeNotifier {
  List<Transaction> transactions = [
    Transaction(amount: 100, date: DateTime.now(), title: 'test 1', isExpense: true),
    Transaction(amount: 100, date: DateTime.now(), title: 'test 2', isExpense: true),
    Transaction(amount: 100, date: DateTime.now(), title: 'test 3', isExpense: true),
  ];

  UnmodifiableListView<Transaction> get tasks {
    return UnmodifiableListView(transactions);
  }

  int get transactionCount {
    return transactions.length;
  }

  void addTransaction(String newTaskTitle, String newTaskAmount, bool isExpense, DateTime date) {
    final task = Transaction(
      title: newTaskTitle,
      amount: double.parse(newTaskAmount),
      date: date,
      isExpense: isExpense,
    );
    transactions.add(task);
    notifyListeners();
  }

  void deleteTransaction (Transaction task) {
    transactions.remove(task);
    notifyListeners();
  }

  int totalExpense() {
    double total = 0;
    for (var i = 0; i < transactions.length; i++) {
      if (transactions[i].isExpense) {
        total -= transactions[i].amount;
      }
      else {
        total += transactions[i].amount;
      }
    }
    return total.toInt();
  }
}