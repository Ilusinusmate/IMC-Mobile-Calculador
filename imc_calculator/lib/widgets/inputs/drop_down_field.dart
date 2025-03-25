import 'package:flutter/material.dart';

class DropDownField extends StatelessWidget {
  final Function(String?) onChange;
  final String value;
  final List<String> valuesList;

  const DropDownField({
    super.key,
    required this.onChange,
    required this.value,
    required this.valuesList,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(border: OutlineInputBorder()),
      onChanged: onChange,
      value: value,
      items:
          valuesList
              .map(
                (String value) => DropdownMenuItem(
                  value: value,
                  child: Text(value, style: TextStyle(fontSize: 16)),
                ),
              )
              .toList(),
    );
  }
}
