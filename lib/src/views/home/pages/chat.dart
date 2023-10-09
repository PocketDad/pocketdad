import 'package:flutter/material.dart';

class Chat extends StatelessWidget {
  const Chat({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
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
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Profile("assets/images/dad1.JPG"),
                    SizedBox(width: 10,),
                    Profile("assets/images/dad2.JPG"),
                    SizedBox(width: 10,),
                    Profile("assets/images/dad3.JPG"),
                  ]
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Profile("assets/images/dad4.JPG"),
                    SizedBox(width: 10,),
                    Profile("assets/images/dad5.JPG"),
                    SizedBox(width: 10,),
                    Profile("assets/images/dad6.JPG"),
                  ]
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Profile("assets/images/dad7.JPG"),
                    SizedBox(width: 10,),
                    Profile("assets/images/dad8.JPG"),
                    SizedBox(width: 10,),
                    Profile("assets/images/dad9.JPG"),
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

class Profile extends StatelessWidget{
  final String avatar;
  const Profile(this.avatar, {super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.deepOrange, width: 2),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: () {},
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(avatar),
        ),
      ),
    );
  }
}
