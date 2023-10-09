import 'package:flutter/material.dart';
import '../components/profile.dart';

class ChooseAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("PocketDad"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
                "Choose my appearance!",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                )
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Profile(),
                    SizedBox(width: 10,),
                    Profile(),
                    SizedBox(width: 10,),
                    Profile(),
                  ]
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Profile(),
                    SizedBox(width: 10,),
                    Profile(),
                    SizedBox(width: 10,),
                    Profile(),
                  ]
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Profile(),
                    SizedBox(width: 10,),
                    Profile(),
                    SizedBox(width: 10,),
                    Profile(),
                  ]
              ),
            ),
            TextButton(
                onPressed: () {},
                child: const Text(
                  "Random!",
                  textAlign: TextAlign.right,
                )
            )
          ],
        ),
      ),
    );
  }
}