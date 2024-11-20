import 'package:joynride_app/models/user.dart';
import 'package:joynride_app/models/vehicle.dart';

class Ride {
  final String id;
  final User driver;
  final List<User> passengers;
  final String departureAddress;
  final String arrivalAddress;
  final DateTime departureTime;
  final DateTime arrivalTime;
  final int totalSeats;
  final Vehicle vehicle;

  Ride(
    this.id,
    this.driver,
    this.passengers,
    this.departureAddress,
    this.arrivalAddress,
    this.departureTime,
    this.arrivalTime,
    this.totalSeats,
    this.vehicle,
  );
}
