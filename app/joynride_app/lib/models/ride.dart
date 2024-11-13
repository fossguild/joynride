import 'package:joynride_app/models/user.dart';
import 'package:joynride_app/models/vehicle.dart';

class Ride {
  final String id;
  final User driver;
  final List<User> passengers;
  final String departureAddress;
  final String arrivalAdrress;
  final DateTime departureTime;
  final int totalSeats;
  final Vehicle vehicle;

  Ride(
    this.id,
    this.driver,
    this.passengers,
    this.departureAddress,
    this.arrivalAdrress,
    this.departureTime,
    this.totalSeats,
    this.vehicle,
  );
}
