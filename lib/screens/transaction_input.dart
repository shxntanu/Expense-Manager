import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'package:expenseplanner/models/transaction_data.dart';

bool isNumeric(String s) {
  return double.tryParse(s) != null;
}

class TransactionInput extends StatefulWidget {
  const TransactionInput({super.key});

  static const String id = 'transaction_input';

  @override
  State<TransactionInput> createState() => _TransactionInputState();
}

class _TransactionInputState extends State<TransactionInput> {
  late String title;

  late String amount;

  late bool isExpense = false;

  late DateTime _chosenDateTime;

  void _showDatePicker(ctx) {
    // showCupertinoModalPopup is a built-in function of the cupertino library
    showCupertinoModalPopup(
        context: ctx,
        builder: (_) => Container(
              height: 400,
              color: const Color.fromARGB(255, 255, 255, 255),
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

                  CupertinoButton(
                    child: const Text('OK'),
                    onPressed: () => Navigator.of(ctx).pop(),
                  )

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
        trailing: CupertinoButton(
          padding: EdgeInsetsDirectional.zero,
          child: const Icon(CupertinoIcons.add),
          onPressed: () {
            Provider.of<TransactionData>(context, listen: false).addTransaction(title, amount, isExpense, _chosenDateTime);
            Navigator.pop(context);
          },
        ),
        middle: const Text('Add Transaction',
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
            header: const Text('ENTER TRANSACTION',
            style: TextStyle(
              fontFamily: 'San Francisco',
            ),
            ),
            children: <Widget> [

              CupertinoTextFormFieldRow(
                prefix: const Text('Title',
                style: TextStyle(
                  fontFamily: 'San Francisco',
                ),),
                placeholder: 'Enter title',
                validator: (String? value) {
                  if(value != null) {
                    if( value.isEmpty ){
                    return 'Please enter a title';
                  }}
                  return null;
                },
                onChanged: (newValue) {
                  title = newValue;
                },
              ),

              CupertinoTextFormFieldRow(
                prefix: const Text('Amount',
                style: TextStyle(
                  fontFamily: 'San Francisco',
                ),),
                placeholder: 'Enter amount',
                validator: (String? value) {
                  if(value != null) {
                    if( !isNumeric(value) ){
                    return 'Please enter a valid number';
                  }}
                  return null;
                },
                onChanged: (newValue) {
                  amount = newValue;
                },
              ),

              CupertinoFormRow(
                prefix: const Text('Expense',
                style: TextStyle(
                  fontFamily: 'San Francisco',
                ),),
                child: CupertinoSwitch(
                    value: isExpense,
                    onChanged: (bool value) { setState(() { isExpense = value; }); },
                  ),
              ),

              CupertinoButton(
                padding: EdgeInsetsDirectional.zero,
                child: const Text('Show Picker'),
                onPressed: () => _showDatePicker(context),
              ),
              
            ],
            ),
          ),
        ),
      );
  }
}
