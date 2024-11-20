import 'package:flutter/material.dart';
import 'package:joynride_app/models/ride.dart';
import 'package:joynride_app/utils/format.dart';
import 'package:joynride_app/widgets/location_timeline.dart';
import 'package:joynride_app/widgets/user_profile_card.dart';
import 'package:joynride_app/widgets/vehicle_profile_card.dart';

class TravelScreen extends StatelessWidget {
  const TravelScreen(this.ride, {super.key});

  final Ride ride;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    final map = {
      ride.departureTime: ride.departureAddress,
      DateTime.parse("2024-12-05 08:20:00"): "Av. Meio 1",
      // DateTime.parse("2024-12-05 08:50:00"): "Av. Meio 2",
      ride.arrivalTime: ride.arrivalAddress
    };
    return SingleChildScrollView(
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                formatDate(ride.departureTime),
                style: textTheme.headlineMedium!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 16,
              ),
              LocationTimeline(map),
              // LocationTimeline(ride.arrivalTime, ride.arrivalAddress),
              const Divider(),
              UserProfileCard(ride.driver),
              const SizedBox(
                height: 8,
              ),
              VehicleProfileCard(ride.vehicle),
              const Divider(),
              Text(
                'Passageiros',
                style: textTheme.headlineSmall,
              ),
              for (var passenger in ride.passengers)
                UserProfileCard(
                  passenger,
                  showDriverRating: false,
                  showPassengerRating: false,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
