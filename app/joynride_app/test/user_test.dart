import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:joynride_app/models/user.dart';

void main() {
  group('[User Test]', () {
    late User user;

    setUp(() {
      user = User(
        '0',
        'Jon',
        null,
        null,
        'masc',
        DateTime.now(),
        null,
        0,
        null,
        0,
        null,
        'student',
        '0',
      );
    });

    test('Should set phone as (99) 99999-9999', () {
      user.phone = '(99) 99999-9999';
      expect(user.phone, '(99) 99999-9999');
    });

    test('Should throw an exception', () {
      expect(
          () => user.phone = '(99) 9999-9999', throwsA(isA<FormatException>()));
    });

    test('Should set the driver rating to 4', () {
      user.addDriverRating(4);
      expect(user.driverRating, 4);
      expect(user.numberRidesGiven, 1);
    });

    test('Should increase the driver rating to 9', () {
      user.addDriverRating(4);
      user.addDriverRating(5);
      expect(user.driverRating, 9);
      expect(user.numberRidesGiven, 2);
    });

    test('Should throw an exception', () {
      expect(() => user.addDriverRating(6), throwsA(isA<FormatException>()));
    });
  });
}
