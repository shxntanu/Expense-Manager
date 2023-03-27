import 'package:expenseplanner/screens/transaction_input.dart';
import 'package:flutter/material.dart';

import 'package:expenseplanner/models/transaction_data.dart';
import 'package:expenseplanner/models/transaction.dart';

import 'package:expenseplanner/widgets/expense_tracker.dart';
import 'package:expenseplanner/widgets/transaction_widget.dart';

import 'package:provider/provider.dart';

class Home extends StatefulWidget {

  static const String id = 'home';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    right: 10.0,
                    top: 10.0,
                    ),
                  child: IconButton(
                    color: Colors.black,
                    icon: Icon(Icons.add, color: Colors.blue,),
                    onPressed: () {
                      Navigator.pushNamed(context, TransactionInput.id);
                    }
                  ),
                ),
              ],
            ),
            ExpenseTracker(amount: Provider.of<TransactionData>(context, listen: true).totalExpense()),
            SizedBox(
                  height: 10,
            ),
            
           // add a scroll view for transactions
            Expanded(
              child: Container(
                child: Consumer<TransactionData>(
                  builder: (context, transactionData, child)
                  {
                    return ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      final ttransaction = transactionData.transactions[index];
                      return Dismissible(
                        key: ValueKey<TransactionWidget>(TransactionWidget(transaction: transactionData.transactions[index])),
                        onDismissed: (DismissDirection direction) {
                          setState(() {
                            transactionData.deleteTransaction(ttransaction);
                          });
                        },
                        background: Container(
                          color: Colors.green,
                        ),
                        child: TransactionWidget(transaction: transactionData.transactions[index]),
                      );
                    },
                    itemCount: transactionData.transactions.length,
                  );
                  },
                )
      ),
    ),
          ],
        ),
      )
    );
  }
}

// Route _createRoute() {
//   return PageRouteBuilder(
//     pageBuilder: (context, animation, secondaryAnimation) => TransactionInput(),
//     transitionsBuilder: (context, animation, secondaryAnimation, child) {
//       const begin = Offset(0.0, 1.0);
//       const end = Offset.zero;
//       const curve = Curves.ease;

//       var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

//       return SlideTransition(
//         position: animation.drive(tween),
//         child: child,
//       );
//     },
//   );
// }