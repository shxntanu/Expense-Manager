// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import 'package:expenseplanner/models/transaction_data.dart';
import 'package:expenseplanner/models/transaction.dart';

class TransactionInput extends StatefulWidget {

  static const String id = 'transaction_input';

  @override
  State<TransactionInput> createState() => _TransactionInputState();
}

class _TransactionInputState extends State<TransactionInput> {

  DateTime _selectedDate = DateTime.now();
  late String title;
  late String amount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    right: 10.0,
                    top: 10.0,
                    ),
                  child: IconButton(
                    color: Colors.black,
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    }
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 200,
            ),
            Column(
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
                height: 30,
              ),
              Container(
                width: 300,
                child: TextField(
                  onChanged: (newAmount) {
                    amount = newAmount;
                  },
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Amount',
                  ),
                ),
              ),
              TextButton(
                child: Container(
                  width: 300,
                  height: 40,
                  child: Center(child: Text("Select Date",
                  style: TextStyle(
                    fontSize: 20,
                  ),)),
                ),
                  onPressed: () {
                      DatePicker.showDatePicker(context,
                        showTitleActions: true,
                        minTime: DateTime(2018, 3, 5),
                        maxTime: DateTime(2019, 6, 7), 
                        onChanged: (date) {
                          _selectedDate = date;
                        },
        
                        onConfirm: (date) {
                          _selectedDate = date;
                        },
                        
                        currentTime: DateTime.now(), 
                    );
                  },
                ),
              
              ElevatedButton(
                onPressed: () {
                  Provider.of<TransactionData>(context, listen: false).addTransaction(title, amount, true, _selectedDate);
                  Navigator.pop(context);
                }, 
                child: Text('Add',
                style: TextStyle(
                  fontSize: 20,
              ),
              ),
              ),
            ],
          ),
          ]
        )

      ),

    );
  }
}