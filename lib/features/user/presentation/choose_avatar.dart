import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocketdad/features/user/domain/user_db.dart';

import '../data/user_provider.dart';

class ChooseAvatar extends StatelessWidget {
  const ChooseAvatar({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: const Text("PocketDad"),
      ),
      body: Center(
        child: ProviderScope(
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
              Padding(
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
              Padding(
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
                  onPressed: () {
                  },
                  child: const Text(
                    "Random!",
                    textAlign: TextAlign.right,
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Profile extends ConsumerWidget{
  String avatar;
  Profile(this.avatar, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.deepOrange, width: 2),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: () {
          ref.watch(userDBProvider).ref.watch(currentUserIDProvider.notifier).state = avatar;
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(avatar),
        ),
      ),
    );
  }
}
