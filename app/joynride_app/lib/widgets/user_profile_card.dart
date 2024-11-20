import 'package:flutter/material.dart';
import 'package:joynride_app/models/user.dart';
import 'package:joynride_app/utils/format.dart';
import 'package:joynride_app/widgets/message_button.dart';
import 'package:joynride_app/widgets/rating_badge.dart';

/// A widget that displays a user profile card with customizable information.
///
/// The `UserProfileCard` is designed to present a user's profile in a visually
/// appealing and customizable format. It includes the user's name, profile
/// picture, ratings as a passenger and driver, and an optional message button.
///
/// ## Example
///
/// This example demonstrates how to use the `UserProfileCard` widget to display
/// a user's profile with customized options.
///
/// ![](https://github.com/fossguild/joynride/blob/dev/app/joynride_app/assets-docs/widgets/user_profile_card_custom.png)
///
/// ```dart
/// UserProfileCard(
///   user,
///   displayName: "John Doe",
///   pictureSize: 64,
///   showDriverRating: true,
///   showPassengerRating: false,
/// );
/// ```
class UserProfileCard extends StatelessWidget {
  /// Creates a [UserProfileCard] widget.
  ///
  /// - [user]: The `User` object containing the user's details (e.g., name,
  ///   ratings, and ride data).
  /// - [displayName]: Custom name to display. Defaults to [user.name].
  /// - [displayNameStyle]: Text style for the display name. Defaults to
  ///   `bodyLarge` from the current theme with bold weight.
  /// - [backgroundColor]: Background color of the card. Defaults to `Colors.white`.
  /// - [ratingBadgeTextStyle]: Text style for the rating badges. Defaults to
  ///   the theme's default style.
  /// - [ratingBadgeColor]: Custom color for the text and icons of the rating badges.
  ///    Defaults to the theme's settings.
  /// - [ratingBadgeBackgroundColor]: Background color for the rating badges.
  ///    Defaults to the theme's `tertiary` color.
  /// - [pictureSize]: Size of the user's profile picture. Defaults to `48`.
  /// - [elevation]: Elevation of the card. Defaults to `4.0`.
  /// - [showPassengerRating]: Whether to show the passenger rating badge.
  ///    Defaults to `true`.
  /// - [showDriverRating]: Whether to show the driver rating badge. Defaults
  ///    to `true`.
  /// - [showMessageButton]: Whether to display the message button. Defaults to `true`.
  const UserProfileCard(
    this.user, {
    super.key,
    this.displayName,
    this.displayNameStyle,
    this.backgroundColor = Colors.white,
    this.ratingBadgeTextStyle,
    this.ratingBadgeColor,
    this.ratingBadgeBackgroundColor,
    this.pictureSize = 48,
    this.elevation = 4,
    this.showPassengerRating = true,
    this.showDriverRating = true,
    this.showMessageButton = true,
  });

  /// The user's data, including name, ratings, and ride statistics.
  final User user;

  /// Custom name to display in place of [user.name].
  final String? displayName;

  /// The text style for the user's name.
  final TextStyle? displayNameStyle;

  /// Background color for the card.
  final Color backgroundColor;

  /// Text style for the rating badges.
  final TextStyle? ratingBadgeTextStyle;

  /// Text and icon color for the rating badges.
  final Color? ratingBadgeColor;

  /// Background color for the rating badges.
  final Color? ratingBadgeBackgroundColor;

  /// The size of the profile picture icon.
  final double pictureSize;

  /// The elevation of the card.
  final double? elevation;

  /// Visibility control for the passenger rating badge.
  final bool showPassengerRating;

  /// Visibility control for the driver rating badge.
  final bool showDriverRating;

  /// Visibility control for the message button.
  final bool showMessageButton;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final displayNameStyle = this.displayNameStyle ??
        theme.textTheme.bodyLarge!.copyWith(
          fontWeight: FontWeight.bold,
        );

    final displayName = this.displayName ?? user.name;
    final passengerRating =
        formatRating(user.passengerRating, user.numberRidesTaken);
    final driverRating = formatRating(user.driverRating, user.numberRidesGiven);

    return Container(
      color: backgroundColor,
      child: Row(
        children: [
          Card.filled(
            margin: const EdgeInsets.all(0),
            elevation: elevation,
            color: theme.colorScheme.tertiary,
            shape: const CircleBorder(),
            child: Icon(
              Icons.person,
              size: pictureSize,
            ),
          ),
          const SizedBox(
            width: 4,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                displayName,
                style: displayNameStyle,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (showPassengerRating)
                    RatingBadge(
                      passengerRating,
                      user.numberRidesTaken,
                      textStyle: ratingBadgeTextStyle,
                      color: ratingBadgeColor,
                      backgroundColor: ratingBadgeBackgroundColor,
                    ),
                  if (showPassengerRating && showDriverRating)
                    const SizedBox(
                      width: 8,
                    ),
                  if (showDriverRating)
                    RatingBadge(
                      driverRating,
                      user.numberRidesGiven,
                      textStyle: ratingBadgeTextStyle,
                      color: ratingBadgeColor,
                      backgroundColor: ratingBadgeBackgroundColor,
                      icon: Icons.local_taxi,
                    ),
                ],
              ),
            ],
          ),
          const Spacer(),
          if (showMessageButton) MessageButton(() {}),
        ],
      ),
    );
  }
}
