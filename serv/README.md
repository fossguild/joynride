<!--
SPDX-FileCopyrightText: 2024 The JoynRide Authors and CCOS-USP <https://ccos.icmc.usp.br>

SPDX-License-Identifier: GPL-3.0-or-later
-->

# Joynride Server

This directory contains the joynride server application.

## Running the Application

### Environment Variables

The application requires specific environment variables to function correctly. You can find a list of these variables in
the `.env.example` file. To set up your environment:

1. Copy the `.env.example` file.
2. Rename the copied file to `.env`.
3. Fill in the appropriate values for each variable in your new `.env` file.

Renaming is necessary because `docker compose` looks for a `.env` file in the same directory of the `docker-compose.yaml` file.

### Getting the Application Up

To run the application, use:

```bash
docker compose up
```

If everything is set up correctly, both the API and the database should be running and ready to be accessed.

### Database Migrations

Every change to the database must be made through a migration. This way, we ensure that all modifications are version-controlled,
maintainable, and can be easily applied or rolled back across different environments.

#### Creating a Migration

To create a new migration, use:

```bash
docker compose --profile tools run --rm create-migration <name_of_your_migration>
```

This command will generate two files in the migrations folder:

- <name_of_your_migration>.up.sql – Used to apply the migration
- <name_of_your_migration>.down.sql – Used to roll back the migration

#### Applying Migrations

To apply all pending migrations, run:

```bash
docker compose --profile tools run --rm migrate up
```

#### Rolling Back Migrations

To roll back migrations, use:

```bash
docker compose --profile tools run --rm migrate down
```

Both the up and down commands accept an optional `N` parameter, specifying how many migrations should be applied or
rolled back. For example, to roll back the last 2 migrations, use:

```bash
docker compose --profile tools run --rm migrate down 2
```

#### Additional Information

For more details about the tool and its command-line interface, visit the [official golang-migrate repository](https://github.com/golang-migrate/migrate).

## Building for Production

A Docker image of the application can be generated using:

```bash
docker build -t joynride_server .
```

Once the build is complete, you can run the image inside a container with this command:

```bash
docker run --env=file .env joynride_api
```
