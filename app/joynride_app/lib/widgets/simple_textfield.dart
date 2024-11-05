import 'package:flutter/material.dart';
import 'package:joynride_app/utils/constants.dart';

class SimpleTextField extends StatelessWidget {
  const SimpleTextField({
    super.key,
    this.labelText,
    this.hintText,
    this.icon,
    this.textInputType,
  });

  final String? labelText;
  final String? hintText;
  final Icon? icon;
  final TextInputType? textInputType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: textInputType,
      style: const TextStyle(color: grayBlue),
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixIcon: icon,
        hintStyle: TextStyle(color: grayBlue.withAlpha(127)),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
