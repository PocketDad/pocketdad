import 'package:flutter/material.dart';

class FieldPadding extends StatelessWidget {
  const FieldPadding({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(5.0), child: child);
  }
}