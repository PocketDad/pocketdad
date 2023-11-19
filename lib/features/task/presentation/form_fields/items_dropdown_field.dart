import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'field_padding.dart';

class ItemDropdownField extends StatelessWidget {
  const ItemDropdownField(
    {super.key, 
    required this.fieldKey,
    required this.itemNames,
    this.currentItem,
    }
  );

  final String? currentItem;
  final List<String> itemNames;
  final GlobalKey<FormBuilderFieldState<FormBuilderField<dynamic>, dynamic>> fieldKey;

  @override
  Widget build(BuildContext context) {
    String fieldName = 'Item';
    return FieldPadding(
      child: FormBuilderDropdown<String>(
        name: fieldName,
        initialValue: currentItem,
        key: fieldKey,
        decoration: InputDecoration(
          labelText: fieldName
        ),
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required()
        ]),
        items: itemNames.map((name) => DropdownMenuItem(
          alignment: AlignmentDirectional.centerStart,
          value: name,
          child: Text(name),
        )).toList(),
        valueTransformer: (val) => val?.toString(),
      )
    );
  }
}