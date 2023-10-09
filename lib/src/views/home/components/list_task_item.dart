import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class ListTaskItem extends StatelessWidget {
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
              Row(
                children: [
                  Column(
                    children: [
                      Text(
                        'Task Name: ',
                        style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w400
                      ))]
                  ),
                  Row(
                    children: [
                      Text('Task Description. task description',
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