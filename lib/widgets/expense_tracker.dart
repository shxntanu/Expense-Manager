import 'package:flutter/material.dart';

class ExpenseTracker extends StatelessWidget {
  
  final int amount;

  ExpenseTracker({
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 100,
        ),
        Container(
          child: Center(
            child: Text(
              'Spent this month',
              style: TextStyle(
                fontFamily: 'San Francisco',
                fontSize: 20.0,
                color: Colors.grey,
              ),
            ),
          ),
        ),
        
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 10.0,
              ),
              child: Text('₹',
              style: TextStyle(
                fontFamily: 'Google Sans',
                color: Colors.black,
                fontSize: 30.0,
              ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              verticalDirection: VerticalDirection.up, // <-- reverse direction
              children: [
                Text('$amount', style: TextStyle(
                  fontSize: 65.0,
                  fontFamily: 'Google Sans',
                  color: Colors.black,
                  ),
                  ), 
              ],
            ),
      ],
    )
      ],
    );
  }
}
