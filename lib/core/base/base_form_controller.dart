import 'package:flutter/material.dart';
import 'package:jr_case_boilerplate/core/base/base_controller.dart';

class BaseFormController extends BaseController {
  late GlobalKey<FormState> formKey;
  late Map<String, TextEditingController> fields;

  BaseFormController(Set<String> fieldNames) {
    fields = {for (var name in fieldNames) name: TextEditingController()};
    formKey = GlobalKey<FormState>();
  }

  TextEditingController field(String name) => fields[name]!;

  bool validate() => formKey.currentState?.validate() ?? false;

  Map<String, String> getFields() =>
      fields.map((key, value) => MapEntry(key, value.text));

  @override
  void dispose() {
    for (var field in fields.values) {
      field.dispose();
    }
    super.dispose();
  }
}
