// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

bool isNumeric(String s) {
  if(s == null) {
    return false;
  }
  return double.tryParse(s) != null;
}

class TransactionInput extends StatelessWidget {

  static const String id = 'transaction_input';

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: CupertinoThemeData(brightness: Brightness.light),
      home: FromSectionExample(),
    );
  }
}

class FromSectionExample extends StatefulWidget {

  @override
  State<FromSectionExample> createState() => _FromSectionExampleState();
}

class _FromSectionExampleState extends State<FromSectionExample> {
  late String title;

  late String amount;

  late bool IsExpense = false;

  late DateTime _chosenDateTime;

  void _showDatePicker(ctx) {
    // showCupertinoModalPopup is a built-in function of the cupertino library
    showCupertinoModalPopup(
        context: ctx,
        builder: (_) => Container(
              height: 300,
              color: Color.fromARGB(255, 255, 255, 255),
              child: Column(
                children: [
                  SizedBox(
                    height: 300,
                    child: CupertinoDatePicker(
                        initialDateTime: DateTime.now(),
                        onDateTimeChanged: (val) {
  
                            _chosenDateTime = val;

                        }),
                  ),
                ],
              ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: CupertinoButton(
          padding: EdgeInsetsDirectional.zero,
          child: const Text('Back'),
          onPressed: () => Navigator.pop(context),
        ),
        middle: Text('Add Transaction',
        style: TextStyle(
          color: Colors.black,
          fontFamily: 'San Francisco',
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        ),
      ),
      // Add safe area widget to place the CupertinoFormSection below the navigation bar.
      child: SafeArea(
        child: Form(
          autovalidateMode: AutovalidateMode.always,
          onChanged: () {

          },
          child: CupertinoFormSection.insetGrouped(
            header: Text('ENTER TRANSACTION',
            style: TextStyle(
              fontFamily: 'San Francisco',
            ),
            ),
            children: <Widget> [

              CupertinoTextFormFieldRow(
                prefix: Text('Title',
                style: TextStyle(
                  fontFamily: 'San Francisco',
                ),),
                placeholder: 'Enter title',
                validator: (String? value) {
                  if(value != null) {
                    if( value.isEmpty ){
                    return 'Please enter a title';
                  }}
                },
              ),

              CupertinoTextFormFieldRow(
                prefix: Text('Amount',
                style: TextStyle(
                  fontFamily: 'San Francisco',
                ),),
                placeholder: 'Enter amount',
                validator: (String? value) {
                  if(value != null) {
                    if( !isNumeric(value) ){
                    return 'Please enter a valid number';
                  }}
                },
              ),

              CupertinoFormRow(
                prefix: Text('Expense',
                style: TextStyle(
                  fontFamily: 'San Francisco',
                ),),
                child: CupertinoSwitch(
                    value: IsExpense,
                    onChanged: (bool value) { setState(() { IsExpense = value; }); },
                  ),
              ),

              CupertinoButton(
                padding: EdgeInsetsDirectional.zero,
                child: Text('Show Picker'),
                onPressed: () => _showDatePicker(context),
              ),
              
            ],
            ),
          ),
        ),
      );
  }
}
