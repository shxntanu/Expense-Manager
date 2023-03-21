import 'package:flutter/material.dart';
import 'package:expenseplanner/models/transaction.dart';

class TransactionWidget extends StatelessWidget {

  final Transaction transaction;

  TransactionWidget({
    required this.transaction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 25.0,
      ),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 5.0,
            spreadRadius: 1.0,
            offset: Offset(0.0, 2.0),
          ),
        ],
      ),
      
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                transaction.title,
                style: TextStyle(
                  fontFamily: 'Google Sans',
                  fontSize: 20.0,
                  color: Colors.black,
                ),
              ),
              
              Text(
                '${transaction.date.day}/${transaction.date.month}',
                style: TextStyle(
                  fontFamily: 'Google Sans',
                  fontSize: 15.0,
                  color: Colors.grey,
                ),
              ),
            ],
          ),

          Text(
                '₹ ${transaction.amount}',
                style: TextStyle(
                  fontFamily: 'Google Sans',
                  fontSize: 15.0,
                  color: transaction.isExpense ? Colors.red : Colors.green,
                ),
              ),
        ],
        
      ),
    );
  }
}