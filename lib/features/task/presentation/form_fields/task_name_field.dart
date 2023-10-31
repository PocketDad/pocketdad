import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'field_padding.dart';

class TaskNameField extends StatelessWidget {
  const TaskNameField({super.key, required this.fieldKey, this.currentName});

  final String? currentName;
  final GlobalKey<FormBuilderFieldState<FormBuilderField<dynamic>, dynamic>> fieldKey;

  @override
  Widget build(BuildContext context) {
    String fieldName = 'Task Name';
    return FieldPadding(
      child: FormBuilderTextField(
        name: fieldName,
        key: fieldKey,
        initialValue: currentName,
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

