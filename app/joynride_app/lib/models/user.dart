class User {
  final String id;
  final String name;

  /// Contains the user's phone number.
  ///
  /// If not null, the phone number must be in the following format:
  /// (XX) XXXXX-XXXX
  String? _phone;
  String? address;
  String gender;
  DateTime birthDate;
  int? driverRating;
  int _numberRidesGiven;
  int? passengerRating;
  int _numberRidesTaken;
  String? imgUrl;
  String role;
  final String communityId;

  User(
    this.id,
    this.name,
    this._phone,
    this.address,
    this.gender,
    this.birthDate,
    this.driverRating,
    this._numberRidesGiven,
    this.passengerRating,
    this._numberRidesTaken,
    this.imgUrl,
    this.role,
    this.communityId,
  );

  String? get phone => _phone;

  /// Set the user's phone number.
  ///
  /// If not null, `phone` must be in the following format: (XX) XXXXX-XXXX
  ///
  /// @param phone The new phone number.
  ///
  /// @throws [FormatException] if `phone` is not in the required format.
  set phone(String? phone) {
    if (phone != null) {
      String pattern = r'^\(\d{2}\) \d{5}-\d{4}$';
      RegExp regExp = RegExp(pattern);
      if (!regExp.hasMatch(phone)) {
        throw const FormatException(
            'O número celular deve ter o seguinte formato: (XX) XXXXX-XXXX.');
      }
    }
    _phone = phone;
  }

  int get numberRidesGiven => _numberRidesGiven;

  set numberRidesGiven(int rides) {
    if (rides < 0) {
      throw const FormatException('O número de viagens deve ser positivo.');
    }

    _numberRidesGiven = rides;
  }

  int get numberRidesTaken => _numberRidesTaken;

  set numberRidesTaken(int rides) {
    if (rides < 0) {
      throw const FormatException('O número de viagens deve ser positivo.');
    }

    _numberRidesTaken = rides;
  }

  /// Add a new rating to the driver's rating and increments the number
  /// of rides given by one.
  ///
  /// If the driver rating is null, the `rating` value will be set as
  /// the driver's rating, and the number of rides given will be set to 1.
  ///
  /// The `rating` value must be between 0 and 5; otherwise
  /// a [FormatException] is thrown.
  ///
  /// @param rating The new rating to be added.
  ///
  /// @throws [FormatException] if `rating` is not between 0 and 5.
  void addDriverRating(int rating) {
    if (rating < 0 || rating > 5) {
      throw const FormatException('A avaliação deve estar entre 0 e 5.');
    }

    if (driverRating == null) {
      driverRating = rating;
      _numberRidesGiven = 1;
    } else {
      driverRating = driverRating! + rating;
      _numberRidesGiven += 1;
    }
  }

  /// Adds a new rating to the passenger's rating and increments the number
  /// of rides taken by one.
  ///
  /// If the passenger's rating is null, the `rating` value will be set as the
  /// passenger's rating, and the number of rides taken will be set to 1.
  ///
  /// The `rating` value must be between 0 and 5; otherwise,
  /// a [FormatException] is thrown.
  ///
  /// @param rating The new rating to be added.
  ///
  /// @throws [FormatException] if `rating` is not between 0 and 5.
  void addPassengerRating(int rating) {
    if (rating < 0 || rating > 5) {
      throw const FormatException('A avaliação deve estar entre 0 e 5.');
    }

    if (passengerRating == null) {
      passengerRating = rating;
      _numberRidesTaken = 1;
    } else {
      passengerRating = passengerRating! + rating;
      _numberRidesTaken += 1;
    }
  }
}
