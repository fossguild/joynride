CREATE TABLE "User" (
    id varchar PRIMARY KEY,
    "name" varchar NOT NULL,
    phone varchar,
    "address" varchar,
    gender varchar NOT NULL,
    birth_date date NOT NULL,
    driver_rating int,
    number_of_rides_given int NOT NULL,
    passenger_rating int,
    number_of_rides_taken int NOT NULL,
    img_url varchar,
    "role" varchar NOT NULL,
    community_id varchar NOT NULL UNIQUE,
);

CREATE TABLE Ride (
    id varchar PRIMARY KEY,
    driver varchar NOT NULL,
    departure_address varchar NOT NULL,
    arrival_address varchar NOT NULL,
    departure_time date NOT NULL,
    total_seats int NOT NULL,
    vehicle varchar NOT NULL,
    FOREIGN KEY (driver) REFERENCES "User"(id),
    FOREIGN KEY (vehicle) REFERENCES Vehicle(id)
);

CREATE TABLE UserRide (
    id varchar PRIMARY KEY,
    ride varchar NOT NULL,
    user varchar NOT NULL,
    status varchar NOT NULL,
    FOREIGN KEY (ride) REFERENCES Ride(id),
    FOREIGN KEY (user) REFERENCES "User"(id)
);

CREATE TABLE UserRideRating (
    id varchar PRIMARY KEY,
    user_ride varchar NOT NULL,
    review_from varchar NOT NULL,
    review_to varchar NOT NULL,
    rating float NOT NULL,
    FOREIGN KEY (user_ride) REFERENCES UserRide(id),
    FOREIGN KEY (review_from) REFERENCES "User"(id),
    FOREIGN KEY (review_to) REFERENCES "User"(id)
);

CREATE TABLE Place (
    id varchar PRIMARY KEY,
    "name" varchar NOT NULL,
    "address" varchar NOT NULL,
    latitude float NOT NULL,
    longitude float NOT NULL,
);

CREATE TABLE Vehicle (
    id varchar PRIMARY KEY,
    model varchar NOT NULL,
    licence_plate varchar NOT NULL UNIQUE,
    color varchar NOT NULL,
);

CREATE TABLE UserVehicle (
    id varchar PRIMARY KEY,
    user varchar NOT NULL,
    vehicle varchar NOT NULL,
    FOREIGN KEY (user) REFERENCES "User"(id),
    FOREIGN KEY (vehicle) REFERENCES Vehicle(id)
);
