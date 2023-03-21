// import 'package:flutter/material.dart';
// import 'task_tile.dart';
// import 'package:provider/provider.dart';
// import 'package:todoey/models/task_data.dart';
// class TasksList extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(itemBuilder: (context, index){
//       return TaskTile(
//           isChecked: Provider.of<TaskData>(context).tasks[index].isDone,
//           taskTitle: Provider.of<TaskData>(context).tasks[index].name,
//           checkboxCallback: (bool? checkboxState){
//             // setState(() {
//             //   Provider.of<TaskData>(context).tasks[index].toggleDone();
//             // });
//           }
//       );
//     },
//       itemCount: Provider.of<TaskData>(context).tasks.length,
//     );
//   }
// }