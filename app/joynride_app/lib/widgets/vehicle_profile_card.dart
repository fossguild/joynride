import 'package:flutter/material.dart';
import 'package:joynride_app/models/vehicle.dart';

/// A custom widget that displays a compact card with information about a vehicle,
/// including an icon, the vehicle's model, and its color.
///
/// This widget is highly customizable, allowing the caller to specify the icon,
/// text styling, spacing, and background color.
///
/// ## Example
///
/// This example demonstrates the basic usage of the `VehicleProfileCard` widget
/// to display information about a vehicle with default settings.
///
/// ![](https://github.com/fossguild/joynride/blob/dev/app/joynride_app/assets-docs/widgets/vehicle_profile_card_default.png)
/// ```dart
/// VehicleProfileCard(
///   vehicle: myVehicle,
/// );
/// ```
class VehicleProfileCard extends StatelessWidget {
  /// Creates a [VehicleProfileCard] widget.
  ///
  /// - [vehicle]: The vehicle to display.
  /// - [icon]: An optional icon (default is [Icons.local_taxi]).
  /// - [textStyle]: Optional text style for the vehicle details.
  /// - [spacing]: Optional spacing between the icon and the text (default is 8).
  /// - [backgroundColor]: Optional background color for the card (default is [Colors.white]).
  const VehicleProfileCard(
    this.vehicle, {
    super.key,
    this.icon = Icons.local_taxi,
    this.textStyle,
    this.spacing = 8,
    this.backgroundColor = Colors.white,
  });

  /// The vehicle information to be displayed in the card.
  final Vehicle vehicle;

  /// The icon to display next to the vehicle details.
  ///
  /// Defaults to [Icons.local_taxi].
  final IconData icon;

  /// Optional text style for displaying the vehicle details.
  ///
  /// Defaults to the `labelLarge` style of the current theme.
  final TextStyle? textStyle;

  /// The spacing (in logical pixels) between the icon and the vehicle details.
  ///
  /// Defaults to 8.
  final double spacing;

  /// The background color of the card.
  ///
  /// Defaults to [Colors.white].
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    final textStyle = this.textStyle ?? Theme.of(context).textTheme.labelLarge;
    return Container(
      color: backgroundColor,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon),
          SizedBox(
            width: spacing,
          ),
          Text(
            '${vehicle.model} - ${vehicle.color}',
            style: textStyle,
          ),
        ],
      ),
    );
  }
}
