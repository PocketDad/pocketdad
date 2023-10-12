import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pocketdad/src/data_models/user_db.dart';

class ListTaskItem extends StatelessWidget {
  const ListTaskItem(/*this.taskID, */ {super.key});
  //final String taskID;
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Card(
        child: SizedBox(
          width: 300,
          height: 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(),
              Text('MM/DD/YY'),
              Spacer(),
              Column(
                children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            textAlign: TextAlign.center,
                            'Task Name: ',
                            style:
                              TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.w400
                              )
                          ),
                        ]
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Task Description',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.w400
                            )
                          ),
                        ],
                      ),
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