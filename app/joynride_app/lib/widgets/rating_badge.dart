import 'package:flutter/material.dart';

/// A widget that displays a compact and customizable rating badge.
///
/// The `RatingBadge` is designed to show a numeric rating value, the total number of ratings,
/// and an optional icon in a concise format. It supports a wide range of customization options,
/// such as text styles, colors, spacing, and elevation, making it suitable for various design contexts.
///
/// ## Example
///
/// This example shows how to create a `RatingBadge` with default configuration.
///
/// ![This example displays a `RatingBadge` with a star icon, a rating of `4.5`,
/// and `123` total ratings, styled with default colors and spacing.](https://github.com/fossguild/joynride/blob/dev/app/joynride_app/assets-docs/widgets/rating_badge_default.png)
///
/// ```dart
/// RatingBadge(
///   4.5,
///   123,
/// )
/// ```
class RatingBadge extends StatelessWidget {
  /// Creates a [RatingBadge].
  ///
  /// - [rating]: The rating score to display (e.g., `4.5`), required.
  /// - [numberOfRatings]: The total number of ratings, displayed in parentheses (e.g., `(123)`), required.
  /// - [icon]: An optional icon to display. Defaults to [Icons.grade].
  /// - [size]: Font size for the rating text and icon. If not specified, the theme default is used.
  /// - [textStyle]: Custom [TextStyle] for the rating text and number of ratings. Defaults to the theme's `labelSmall`.
  /// - [spacing]: Space between the icon, rating, and number of ratings. Defaults to `4.0`.
  /// - [elevation]: Elevation of the surrounding card. Defaults to `4.0`.
  /// - [color]: Color of the text and icon. Defaults to the theme's `onTertiary`.
  /// - [backgroundColor]: Background color of the badge. Defaults to the theme's `tertiary`.
  const RatingBadge(
    this.rating,
    this.numberOfRatings, {
    super.key,
    this.icon = Icons.grade,
    this.size,
    this.textStyle,
    this.spacing = 4,
    this.elevation = 4,
    this.color,
    this.backgroundColor,
  });

  /// The rating score to display (e.g., `4.5`).
  final double rating;

  /// The total number of ratings, shown in parentheses (e.g., `(123)`).
  final int numberOfRatings;

  /// An icon to display alongside the rating. Defaults to [Icons.grade].
  final IconData icon;

  /// Font size for the rating text and icon. Defaults to theme settings.
  final double? size;

  /// Custom [TextStyle] for the rating text and number of ratings.
  final TextStyle? textStyle;

  /// Space between the icon, rating, and number of ratings. Defaults to `4.0`.
  final double? spacing;

  /// Elevation of the surrounding card. Defaults to `4.0`.
  final double elevation;

  /// Color of the text and icon. Defaults to the theme's `onTertiary`.
  final Color? color;

  /// Background color of the badge. Defaults to the theme's `tertiary`.
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final effectiveColor = color ?? colorScheme.onTertiary;
    final effectiveBackgroundColor = backgroundColor ?? colorScheme.tertiary;

    final effectiveTextStyle = textStyle ??
        theme.textTheme.labelSmall!.copyWith(
          fontSize: size,
          fontWeight: FontWeight.bold,
          color: effectiveColor,
        );

    final iconSize = effectiveTextStyle.fontSize != null
        ? effectiveTextStyle.fontSize! * 1.4
        : null;

    return Card(
      elevation: elevation,
      margin: const EdgeInsets.all(0),
      color: effectiveBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: effectiveColor,
              size: iconSize,
            ),
            SizedBox(width: spacing),
            Text(
              rating.toString(),
              style: effectiveTextStyle,
            ),
            SizedBox(width: spacing),
            Text(
              '($numberOfRatings)',
              style: effectiveTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
