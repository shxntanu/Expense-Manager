import 'package:expenseplanner/screens/transaction_input.dart';
import 'package:expenseplanner/models/transaction_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TransactionData(),
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.white,
          fontFamily: 'San Francisco',
        ),
        initialRoute: Home.id,
        routes: {
          Home.id: (context) => Home(),
          TransactionInput.id: (context) => TransactionInput(),
        },
      ),
    );
  }
}