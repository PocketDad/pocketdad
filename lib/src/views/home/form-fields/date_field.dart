import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'field_padding.dart';

class TaskDateField extends StatelessWidget {
  const TaskDateField({super.key, required this.fieldKey, this.currentDate});

  final DateTime? currentDate;
  final GlobalKey<FormBuilderFieldState<FormBuilderField<dynamic>, dynamic>> fieldKey;

  @override
  Widget build(BuildContext context) {
    String fieldName = 'Date';
    return FieldPadding(
      child: FormBuilderDateTimePicker(
        name: fieldName,
        key: fieldKey,
        initialValue: currentDate,
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

