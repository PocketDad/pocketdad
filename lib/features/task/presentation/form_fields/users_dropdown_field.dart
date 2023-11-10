import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'field_padding.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class UsersDropdownField extends StatelessWidget {
  UsersDropdownField(
    {super.key, 
    required this.fieldKey,
    required this.userNames,
    this.currentUsers,
    this.selectedUsers
    }
  );

  final List<String>? currentUsers;
  final List<String> userNames;
  List<String>? selectedUsers;
  final GlobalKey<FormBuilderFieldState<FormBuilderField<dynamic>, dynamic>> fieldKey;

  @override
  Widget build(BuildContext context) {
    String fieldName = 'Users';
    return FieldPadding(
      child: MultiSelectDialogField(
        initialValue: [currentUsers],
        items: userNames.map((name) => MultiSelectItem(name, name)).toList(),
        listType: MultiSelectListType.CHIP,
        onConfirm: (values) {
          selectedUsers = values.cast<String>();
        },
      ),
    );
  }
}

/*
class UsersDropdownField extends StatelessWidget {
  UsersDropdownField({
    super.key,
    required this.fieldKey,
    required this.users,
    this.selectedUsers,
  });

  List<String>? selectedUsers;
  final List<String> users;
  final GlobalKey<FormBuilderFieldState<FormBuilderField<dynamic>, dynamic>>
      fieldKey;

  @override
  Widget build(BuildContext context) {
    String fieldName = 'Users';
    return FieldPadding(
      child: MultiSelectDialogField(
        items: users.map((name) => MultiSelectItem(name, name)).toList(),
        listType: MultiSelectListType.CHIP,
        onConfirm: (values) {
          selectedUsers = values;
        },
      ),
    );
  }
}
*/