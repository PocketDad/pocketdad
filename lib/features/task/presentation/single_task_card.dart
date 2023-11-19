import 'package:flutter/material.dart';

class SingleTaskCard extends StatelessWidget {
  final String task;
  final String date;
  final String item;

  // TODO: add individual task page field as part of constructor

  const SingleTaskCard({Key? key, required this.task, required this.date, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
                Radius.circular(15)
            )
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    padding: const EdgeInsets.all(15),
                    textStyle: Theme.of(context).textTheme.titleLarge,
                    minimumSize: const Size.fromHeight(50),
                  ),
                  onPressed: () {  },
                  child: Text(
                    task,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Text(item),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 10, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(date),
                  ],
                ),
              )
            ]
        ),
      ),
    );
  }

}