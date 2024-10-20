<!--
SPDX-FileCopyrightText: 2024 The JoynRide Authors and CCOS-USP <https://ccos.icmc.usp.br>

SPDX-License-Identifier: GPL-3.0-or-later
-->

# Joynride API

This directory contains the application back-end.

## Running it During Development

### Environment Variables

The application requires specific environment variables to function correctly. You can find a list of these variables in
the `.env.example` file. To set up your environment:

1. Copy the `.env.example` file.
2. Rename the copied file to `.env`.
3. Fill in the appropriate values for each variable in your new `.env` file.

Renaming is necessary because `docker compose` looks for a `.env` file in the same directory of the `docker-compose.yaml` file.

### Starting the Live-Reload Server

To run the application in development mode with live-reload functionality, use:

```bash
# while in serv/backend
docker compose up
```

If everything is set up correctly, you should see the [Air](https://github.com/air-verse/air) logo indicating that the
application is running. From now on, every change you make in the source code will prompt Air to reload the service, keeping it updated.

### Database Connection

To ensure the API services function properly, you will need to run the database. Instructions on how to do so can be found
in the [database README file](../db/README.md).

## Building for Production

A Docker image of the application can be generated using:

```bash
docker build -t joynride_api .
```

Once the build is complete, you can run the image inside a container with this command:

```bash
docker run --env=file .env joynride_api
```
