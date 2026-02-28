# Laravel Docker Examples Project

## Table of Contents

- [Overview](#overview)
- [Project Structure](#project-structure)
- [Clone the Repository](#clone-the-repository)
- [Setting Up the Development Environment](#setting-up-the-development-environment)
- [Usage](#usage)

## Overview

## Project Structure

```
project-root/
├── app/ # Contain the core logic of the application
│    ├──
├── bootstrap/  # Contains the app.php file which bootstraps the framework and a cache directory
├── config/  # Application's configuration files
├── database/  # Database migrations, model factories, and seeds
├── public/  # Entry point for requests and assets CSS, Javascript and images
├── resources/  # Views and un-compiled assets
├── routes/  # Contains routes definitions
├── storage/  # Used to store user-generated files, such as profile avatars, that should be publicly accessible
├── tests/  # Contains automated tests
├── vendor/  # Composer dependencies
├── node_modules/  # Javascript dependencies
├── ...  # Other Laravel files and directories
├── docker/
│   ├── common/ # Shared configurations
│   ├── development/ # Development-specific configurations
│   ├── production/ # Production-specific configurations
├── compose.dev.yaml # Docker Compose for development
├── compose.prod.yaml # Docker Compose for production
└── .env.example # Example environment configuration
```

### Clone the Repository

```bash
git clone https://github.com/Harugumo/laravel-docker.git
cd laravel-docker
```

### Setting Up the Development Environment

1. Copy the .env.example file to .env and adjust any necessary environment variables:

```bash
cp .env.example .env
```

Hint: adjust the `UID` and `GID` variables in the `.env` file to match your user ID and group ID. You can find these by running `id -u` and `id -g` in the terminal.

2. Start the Docker Compose Services:

```bash
docker compose -f compose.dev.yaml up -d
```

3. Install Laravel Dependencies:

```bash
docker compose -f compose.dev.yaml exec workspace bash
composer install
npm install
npm run dev
```

4. Run Migrations:

```bash
docker compose -f compose.dev.yaml exec workspace php artisan migrate
```

5. Access the Application:

Open your browser and navigate to [http://localhost](http://localhost).

## Usage

Here are some common commands and tips for using the development environment:

### Accessing the Workspace Container

The workspace sidecar container includes Composer, Node.js, NPM, and other tools necessary for Laravel development (e.g. assets building).

```bash
docker compose -f compose.dev.yaml exec workspace bash
```

### Run Artisan Commands:

```bash
docker compose -f compose.dev.yaml exec workspace php artisan migrate
```

### Rebuild Containers:

```bash
docker compose -f compose.dev.yaml up -d --build
```

### Stop Containers:

```bash
docker compose -f compose.dev.yaml down
```

### View Logs:

```bash
docker compose -f compose.dev.yaml logs -f
```

For specific services, you can use:

```bash
docker compose -f compose.dev.yaml logs -f web
```
