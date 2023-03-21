// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:expenseplanner/models/transaction_data.dart';
import 'package:expenseplanner/models/transaction.dart';

class TransactionInput extends StatelessWidget {

  static const String id = 'transaction_input';

  late String title;
  late String amount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Add a transaction',
            style: TextStyle(
              fontSize: 30,
            ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Container(
                width: 300,
                child: TextField(
                  onChanged: (newTitle) {
                    title = newTitle;
                  },
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  decoration: InputDecoration(
                    // border: InputBorder.none,
                    border: OutlineInputBorder(),
                    labelText: 'Title',
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              width: 300,
              child: TextField(
                onChanged: (newAmount) {
                  amount = newAmount;
                },
                style: TextStyle(
                  fontSize: 50,
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Amount',
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Provider.of<TransactionData>(context, listen: false).addTransaction(title, amount, true, DateTime.now());
                Navigator.pop(context);
              }, 
              child: Text('Add',
              style: TextStyle(
                fontSize: 20,
            ),
            ),
            ),
          ],
        )

      ),

    );
  }
}