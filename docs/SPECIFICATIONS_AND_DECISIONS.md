# Specifications and Decisions

## Introduction

This document outlines the key specifications and decisions made during the development of Joynride, a self-hosted lift application. Joynride is designed to help communities streamline transportation by enabling members to request and offer rides easily. By focusing on simplicity and user collaboration, Joynride promotes shared mobility while giving communities full control over their own data and usage.

## Requesting a Ride

To request a ride, users must provide the place of departure, place of arrival, and time of departure. These details are used to filter and identify rides matching the specified criteria. Users may create multiple requests for the same trip, forming a group of requests. When a driver accepts one of these requests, the ride is scheduled, and the remaining requests in the group are automatically canceled.

Once a ride is confirmed, the user gains access to an in-app chat to coordinate with the driver regarding the trip details.

## Offering a Ride

Drivers must specify their place of departure, place of arrival, time of departure, and vehicle details when offering a ride. This information allows passengers to make informed decisions when selecting a ride.

Drivers can review incoming ride requests and communicate with passengers individually via the in-app chat to clarify details or confirm arrangements.

## During the Ride

After the ride's scheduled departure time, the system marks it as active. Both the driver and passengers can indicate the ride's completion within the application. This process ensures that drivers can't partake in more than one ride at once.

## In-app chat

The in-app chat used by drivers and passengers to communicate is stored in the client app using a SQLite database. All the messages must be stored on the site to ensure privacy and accountability in the case of the need of proof against illegal activities.

## Geolocation

To display in-app maps the application uses the tools offered by the [OpenStreetMap](https://www.openstreetmap.org/about) suite, while to determine estimated trips duration it uses the [OSRM (Open Source Routing Machine) Api](https://project-osrm.org/).
