import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'field_padding.dart';

// might be made obsolete when adding in map functionality (Google Maps?)
class TaskLocationField extends StatelessWidget {
  const TaskLocationField({super.key, required this.fieldKey, this.currentLocation});

  final String? currentLocation;
  final GlobalKey<FormBuilderFieldState<FormBuilderField<dynamic>, dynamic>> fieldKey;

  @override
  Widget build(BuildContext context) {
    String fieldName = 'Location';
    return FieldPadding(
      child: FormBuilderTextField(
        name: fieldName,
        key: fieldKey,
        initialValue: currentLocation,
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

