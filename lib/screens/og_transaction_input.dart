// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:provider/provider.dart';
// import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
// import 'package:expenseplanner/widgets/reusable_card.dart';
// import 'package:expenseplanner/widgets/icon_content.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// import 'package:expenseplanner/models/transaction_data.dart';

// class TransactionInput extends StatefulWidget {

//   static const String id = 'transaction_input';

//   @override
//   State<TransactionInput> createState() => _TransactionInputState();
// }

// class _TransactionInputState extends State<TransactionInput> {

//   void _showDialog(Widget child) {
//     showCupertinoModalPopup<void>(
//         context: context,
//         builder: (BuildContext context) => Container(
//               height: 216,
//               padding: const EdgeInsets.only(top: 6.0),
//               // The Bottom margin is provided to align the popup above the system
//               // navigation bar.
//               margin: EdgeInsets.only(
//                 bottom: MediaQuery.of(context).viewInsets.bottom,
//               ),
//               // Provide a background color for the popup.
//               color: CupertinoColors.systemBackground.resolveFrom(context),
//               // Use a SafeArea widget to avoid system overlaps.
//               child: SafeArea(
//                 top: false,
//                 child: child,
//               ),
//             ));
//   }

//   DateTime _selectedDate = DateTime.now();
  
//   late String title;
//   late String amount;
//   late bool IsExpense = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: SafeArea(

//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: EdgeInsets.only(
//                     right: 10.0,
//                     top: 10.0,
//                     ),
//                   child: IconButton(
//                     color: Colors.black,
//                     icon: Icon(Icons.close),
//                     onPressed: () {
//                       Navigator.pop(context);
//                     }
//                   ),
//                 ),
//               ],
//             ),
//             SingleChildScrollView(
//               padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Text('Add a transaction',
//                   style: TextStyle(
//                     fontSize: 30,
//                   ),
//                   ),
//                   SizedBox(
//                     height: 30,
//                   ),
//                   Center(
//                     child: Container(
//                       width: 300,
//                       child: TextField(
//                         onChanged: (newTitle) {
//                           title = newTitle;
//                         },
//                         style: TextStyle(
//                           fontSize: 20,
//                         ),
//                         decoration: InputDecoration(
//                           // border: InputBorder.none,
//                           border: OutlineInputBorder(),
//                           labelText: 'Title',
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 30,
//                   ),
//                   Container(
//                     width: 300,
//                     child: TextField(
//                       onChanged: (newAmount) {
//                         amount = newAmount;
//                       },
//                       style: TextStyle(
//                         fontSize: 20,
//                       ),
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(),
//                         labelText: 'Amount',
//                       ),
//                     ),
//                   ),
//                   CupertinoButton(
//                     // Display a CupertinoDatePicker in date picker mode.
//                     onPressed: () => _showDialog(
//                       CupertinoDatePicker(
//                         initialDateTime: DateTime.now(),
//                         mode: CupertinoDatePickerMode.date,
//                         use24hFormat: true,
//                         // This is called when the user changes the date.
//                         onDateTimeChanged: (DateTime newDate) {
//                           _selectedDate = newDate;
//                         },
//                       ),
//                     ),
//                     // In this example, the date is formatted manually. You can
//                     // use the intl package to format the value based on the
//                     // user's locale settings.
//                     child: Text(
//                       '${_selectedDate.month} - ${_selectedDate.day} - ${_selectedDate.year}',
//                       style: const TextStyle(
//                         decoration: TextDecoration.underline,
//                         fontSize: 22.0,
//                       ),
//                     ),
//                   ),
//               Row(
//               children: <Widget>[
//                 Expanded(
//                   child: ReusableCard(
//                     onPress: () {
//                       setState(() {
//                         IsExpense = true;
//                       });
//                     },
//                     colour: IsExpense == true
//                         ? Colors.red
//                         : Colors.grey,
//                     cardChild: IconContent(
//                       icon: FontAwesomeIcons.minus,
//                       label: 'Expense',
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: ReusableCard(
//                     onPress: () {
//                       setState(() {
//                         IsExpense = false;
//                       });
//                     },
//                     colour: IsExpense == false
//                         ? Colors.green
//                         : Colors.grey,
//                     cardChild: IconContent(
//                       icon: FontAwesomeIcons.plus,
//                       label: 'Income',
//                     ),
//                   ),
//                 ),
//               ],
//                       ),
                  
//                   CupertinoButton.filled(
//                     onPressed: () {
//                       Provider.of<TransactionData>(context, listen: false).addTransaction(title, amount, IsExpense, _selectedDate);
//                       Navigator.pop(context);
//                     }, 
//                     child: Text('Add',
//                     style: TextStyle(
//                       fontSize: 20,
//                   ),
//                   ),
//                   ),
//                 ],
//                         ),
//             ),
//           ]
//         )

//       ),

//     );
//   }
// }