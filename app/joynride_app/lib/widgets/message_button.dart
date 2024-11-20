import 'package:flutter/material.dart';

/// A custom button widget that displays a chat icon and triggers an action when pressed.
///
/// The [MessageButton] widget is a customizable button that uses the
/// `Icons.forum_outlined` (chat bubble) icon by default. It allows for
/// customization of the icon color and background color, both of which default
/// to the current theme's color scheme if not specified.
///
/// ## Example
///
/// This example shows how to create a `MessageButton` with a custom configuration.
///
/// ![This example displays a `MessageButton` with a white icon and a blue background.](https://github.com/fossguild/joynride/blob/dev/app/joynride_app/assets-docs/widgets/message_button_custom.png)
///
/// ```dart
/// MessageButton(
///   () {
///     print('Button pressed!');
///   },
///   color: Colors.white,
///   backgroundColor: Colors.blue,
/// );
/// ```
class MessageButton extends StatelessWidget {
  /// Creates a [MessageButton] widget.
  ///
  /// - [onPressed]: A required callback function that is executed when the button is pressed.
  /// - [color]: An optional parameter to specify the color of the icon. Defaults to the theme's `onTertiary` color.
  /// - [backgroundColor]: An optional parameter to specify the background color of the button. Defaults to the theme's `tertiary` color.
  const MessageButton(
    this.onPressed, {
    super.key,
    this.color,
    this.backgroundColor,
  });

  /// The color of the icon.
  ///
  /// Defaults to the theme's `onTertiary` color if not specified.
  final Color? color;

  /// The background color of the button.
  ///
  /// Defaults to the theme's `tertiary` color if not specified.
  final Color? backgroundColor;

  /// The callback function that is triggered when the button is pressed.
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final colorSchema = Theme.of(context).colorScheme;
    final color = this.color ?? colorSchema.onTertiary;
    final backgroundColor = this.backgroundColor ?? colorSchema.tertiary;

    return IconButton(
      onPressed: onPressed,
      icon: const Icon(Icons.forum_outlined), // Default chat icon
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(backgroundColor),
        iconColor: WidgetStatePropertyAll(color),
        shape: const WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(16), // Rounded corners for the button
            ),
          ),
        ),
      ),
    );
  }
}
