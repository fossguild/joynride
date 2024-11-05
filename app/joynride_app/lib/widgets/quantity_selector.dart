import 'package:flutter/material.dart';

class QuantitySelector extends StatefulWidget {
  QuantitySelector({super.key, this.min, this.max, initialValue})
      : _value = initialValue ?? 0;

  final int? min;
  final int? max;
  int _value;

  int get value => _value;

  @override
  State<QuantitySelector> createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  void increment() {
    if ((widget.max != null && widget._value <= widget.max!) ||
        widget.max == null) {
      setState(() {
        widget._value++;
      });
    }
  }

  void decrement() {
    if ((widget.min != null && widget._value > widget.min!) ||
        widget.min == null) {
      setState(() {
        widget._value--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    const double radius = 20.0;
    const double elevation = 10.0;
    const topPadding = 15.0;
    const leftPadding = 4.0;
    const rightPadding = 4.0;
    const bottomPadding = 10.0;

    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return Row(
      children: [
        Text(
          widget._value.toString(),
          style: textTheme.headlineLarge!.copyWith(
            color: colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Column(
          children: [
            ElevatedButton(
              onPressed: increment,
              style: const ButtonStyle(
                minimumSize: WidgetStatePropertyAll(Size.zero),
                padding: WidgetStatePropertyAll(
                  EdgeInsets.only(
                    top: topPadding,
                    left: leftPadding,
                    right: rightPadding,
                    bottom: bottomPadding,
                  ),
                ),
                elevation: WidgetStatePropertyAll(elevation),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    // side: BorderSide(),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(radius),
                      topRight: Radius.circular(radius),
                    ),
                  ),
                ),
              ),
              child: const Icon(Icons.add),
            ),
            const SizedBox(
              height: 1,
            ),
            ElevatedButton(
              onPressed: decrement,
              style: const ButtonStyle(
                minimumSize: WidgetStatePropertyAll(Size.zero),
                padding: WidgetStatePropertyAll(
                  EdgeInsets.only(
                    top: bottomPadding,
                    left: leftPadding,
                    right: rightPadding,
                    bottom: topPadding,
                  ),
                ),
                elevation: WidgetStatePropertyAll(elevation),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(radius),
                      bottomRight: Radius.circular(radius),
                    ),
                  ),
                ),
              ),
              child: const Icon(Icons.remove),
            ),
          ],
        ),
      ],
    );
  }
}
