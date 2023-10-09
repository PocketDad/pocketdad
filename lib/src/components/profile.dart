import 'package:flutter/material.dart';

class Profile extends StatelessWidget{
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      child: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: () {},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        tooltip: 'Increment',
        child: const Icon(Icons.insert_emoticon),
      ),
    );/*ElevatedButton(
        style: ButtonStyle(
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
          overlayColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.hovered)) {
                return Colors.orangeAccent.withOpacity(0.04);
              }
              if (states.contains(MaterialState.focused) || states.contains(MaterialState.pressed)) {
                return Colors.orangeAccent.withOpacity(0.12);
              }
              return null; // Defer to the widget's default.
            },
          ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                    side: BorderSide(color: Colors.red)
                )
            )
        ),
        onPressed: () {},
        child: SizedBox(width: 0, height: 10),

      /*Container(
          color: Colors.orange,
          height: 50,
          width: 50,
        ),*/
      );*/
  }
}