// import 'package:flutter/material.dart';
// import 'package:curved_navigation_bar/curved_navigation_bar.dart';


// import 'package:expenseplanner/widgets/expense_tracker.dart';
// import 'package:expenseplanner/widgets/transaction_widget.dart';

// import 'package:expenseplanner/models/transaction.dart';

// class Home_test extends StatelessWidget {

//   static const String id = 'home_test';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(

//       body: CustomScrollView(
//         slivers: [
//           SliverAppBar(
//             backgroundColor: Color(0xfffafafafa),
//             expandedHeight: MediaQuery.of(context).size.height * 0.230,
//             floating: false,
//             pinned: true,
//             flexibleSpace: FlexibleSpaceBar(
//               expandedTitleScale: 1,
//               centerTitle: true,
//               title: ExpenseTracker(amount: 500),
//             ),
//           ),
//           SliverList(
//             delegate: SliverChildListDelegate(
//               [
//                 Container(
//                   child: Column(
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           Padding(
//                             padding: EdgeInsets.only(
//                               right: 10.0,
//                               top: 10.0,
//                               ),
//                             child: IconButton(
//                               color: Colors.black,
//                               icon: Icon(Icons.add),
//                               onPressed: () {
//                                 showModalBottomSheet(
//                                   context: context,
//                                   builder: (BuildContext context) => SingleChildScrollView(
//                                     child: Container(
//                                     padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
//                                       child: addOption(),      
//                                   ),
//                                   ),
//                                 );
//                               }
//                             ),
//                           ),
//                         ],
//                       ),
//                       ExpenseTracker(amount: 500),
//                       SizedBox(
//                             height: 10,
//                       ),
                      
//                      // add a scroll view for transactions
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

