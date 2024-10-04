
```markdown
# Countdown Timer App

## Overview

This Flutter application features a single screen that displays a list of 1000 countdown timer items.
Each item includes a countdown timer set to 1 minute and a GIF image.
The app is optimized for performance to ensure a smooth scrolling experience while rendering a large number of items with dynamic content.

## Features

- **Single Screen UI**: Displays a list of countdown timers.
- **Countdown Timer**: Each item has a 1-minute countdown timer.
- **GIF Images**: Each countdown item is accompanied by a GIF image.
- **Pagination**: Implements pagination to optimize loading performance.
- **State Management**: Utilizes `flutter_bloc` for state management.
- **Clean Architecture**: Follows clean architecture principles for maintainable code.

## Requirements

- Flutter SDK
- Dart SDK

## Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/haelalhsen/large_list_app.git
   ```

2. Navigate to the project directory:
   ```bash
   cd countdown_timer_app
   ```

3. Install the dependencies:
   ```bash
   flutter pub get
   ```

4. Run the app:
   ```bash
   flutter run
   ```

## Architecture

This application follows the Clean Architecture principles:

- **Presentation Layer**: Contains UI components and state management logic using BLoC.
- **Domain Layer**: Defines business logic and entities.
- **Data Layer**: Handles data fetching and storage, including the `CountdownRepository`.

