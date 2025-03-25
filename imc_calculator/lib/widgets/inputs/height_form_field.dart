import 'package:flutter/material.dart';
import 'package:imc_calculator/widgets/inputs/base_form_field.dart';

class HeightFormField extends StatelessWidget implements BaseFormField {
  const HeightFormField({
    super.key,
    required this.controller,
    required this.labelText,
  });

  @override
  final String labelText;
  @override
  final TextEditingController controller;

  InputDecoration _buildDecoration(BuildContext context) {
    return InputDecoration(
      labelText: labelText,
      border: OutlineInputBorder(),
      labelStyle: Theme.of(context).textTheme.bodySmall,
    );
  }

  String? _validator(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter a weigth";
    }
    var _temp = double.tryParse(value);
    if (_temp == null || _temp <= 0) {
      return "Enter values above 0";
    }

    return null;
  }

  @override
  TextFormField build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: _buildDecoration(context),
      validator: _validator,
    );
  }
}
