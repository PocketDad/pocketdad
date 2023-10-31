import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'field_padding.dart';

class TaskDescriptionField extends StatelessWidget {
  const TaskDescriptionField({super.key, required this.fieldKey, this.currentDescription});

  final String? currentDescription;
  final GlobalKey<FormBuilderFieldState<FormBuilderField<dynamic>, dynamic>> fieldKey;

  @override
  Widget build(BuildContext context) {
    String fieldName = 'Description';
    return FieldPadding(
      child: FormBuilderTextField(
        name: fieldName,
        key: fieldKey,
        initialValue: currentDescription,
        decoration: InputDecoration(
          labelText: fieldName,
        ),
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required()
        ]),
      )
    );
  }
}

