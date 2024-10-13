<!--
SPDX-FileCopyrightText: 2024 The JoynRide Authors and CCOS-USP <https://ccos.icmc.usp.br>

SPDX-License-Identifier: GPL-3.0-or-later
-->

# Joynride Database

This directory contains the application database.

## Running the Database

### Environment Variables

The application requires specific environment variables to function correctly. You can find a list of these variables in
the `.env.example` file. To set up your environment:

1. Copy the `.env.example` file.
2. Rename the copied file to `.env`.
3. Fill in the appropriate values for each variable in your new `.env` file.

Renaming is necessary because `docker compose` looks for a `.env` file in the same directory of the `docker-compose.yaml` file.

### Getting the Database Up

To run the database, use the command:

```bash
# while in serv/db
docker compose up
```

If everything is set up correctly, you should be able to access the database using the credentials defined via environment variables.

## Migrations

Every change to the database must be made through a migration. This way, we ensure that all modifications are version-controlled,
maintainable, and can be easily applied or rolled back across different environments.

### Creating a Migration

To create a new migration, use:

```bash
docker compose --profile tools run --rm create-migration <name_of_your_migration>
```

This command will generate two files in the migrations folder:

- <name_of_your_migration>.up.sql – Used to apply the migration
- <name_of_your_migration>.down.sql – Used to roll back the migration

### Applying Migrations

To apply all pending migrations, run:

```bash
docker compose --profile tools run --rm migrate up
```

### Rolling Back Migrations

To roll back migrations, use:

```bash
docker compose --profile tools run --rm migrate down
```

Both the up and down commands accept an optional `N` parameter, specifying how many migrations should be applied or
rolled back. For example, to roll back the last 2 migrations, use:

```bash
docker compose --profile tools run --rm migrate down 2
```

### Additional Information

For more details about the tool and its command-line interface, visit the [official golang-migrate repository](https://github.com/golang-migrate/migrate).
