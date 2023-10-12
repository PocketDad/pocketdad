import 'package:flutter/material.dart';

import '../../../data_models/task_db.dart';

class ListTaskItem extends StatelessWidget {
  const ListTaskItem({Key? key, required this.task}) : super(key: key);

  final TaskData task;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: SizedBox(
          width: 300,
          height: 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              Text(task.dueDate.toString()),
              Spacer(),
              Row(
                children: [
                  Column(
                    children: [
                      Text(
                        task.name,
                        style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w400
                      ))]
                  ),
                  Row(
                    children: [
                      Text(task.description,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w400
                        )
                      ),
                    ],
                  )
                ]
              ),
              Spacer(),
          ])
        ),
      ),
    );
  }
}

//
// class ListTaskItem extends StatelessWidget {
//   Widget build(BuildContext context) {
//     return const ListTile(
//       leading: CircleAvatar(
//         backgroundColor: Colors.orange,
//       ),
//       title: Text(
//         'Task name'
//       )
//     );
//   }
// }