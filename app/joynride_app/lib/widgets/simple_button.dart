import 'package:flutter/material.dart';

class SimpleButton extends StatelessWidget {
  const SimpleButton(
      {super.key, required this.text, required this.onPressed, this.icon});

  final String text;
  final void Function() onPressed;
  final Icon? icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorSchema = theme.colorScheme;
    final textTheme = theme.textTheme;

    return ElevatedButton.icon(
      icon: icon,
      style: ElevatedButton.styleFrom(
        iconColor: colorSchema.onTertiary,
        backgroundColor: colorSchema.tertiary,
        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      onPressed: onPressed,
      label: Text(
        text,
        style: textTheme.titleLarge!.copyWith(
          color: colorSchema.onTertiary,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
