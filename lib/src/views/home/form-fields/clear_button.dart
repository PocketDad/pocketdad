import 'package:flutter/material.dart';
import 'field_padding.dart';

class ClearButton extends StatelessWidget {
  const ClearButton({super.key, required this.onClear});

  final void Function() onClear;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FieldPadding(
        child: OutlinedButton(
          onPressed: onClear,
          child: Text(
            'Clear',
            style: TextStyle(color: Theme.of(context).colorScheme.secondary),
          ),
        ),
      ),
    );
  }
}