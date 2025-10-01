# SignSpeak - Sign Language Interpreter Booking App

A Flutter application for booking sign language interpreters with educational demos showcasing Flutter concepts.

## Project Structure

```
sign_language_app/
├── lib/
│   ├── main.dart                 # Entry point and main navigation
│   ├── models/                   # Data models
│   │   └── interpreter.dart      # Interpreter model class
│   ├── services/                 # Business logic and data services
│   │   └── booking_service.dart  # Booking management service
│   ├── views/                    # Screen-level widgets (pages)
│   │   ├── home_page.dart        # Main interpreter listing page
│   │   ├── bookings_page.dart    # User bookings page
│   │   ├── hello_world_stateless.dart  # Task 2 demo
│   │   ├── hello_world_stateful.dart   # Task 3 demo
│   │   └── staggered_grid_page.dart    # Task 9 demo
│   └── widgets/                  # Reusable UI components
│       ├── custom_button.dart    # Custom button widget
│       └── interpreter_card.dart # Interpreter display card
├── pubspec.yaml                  # Dependencies and project config
└── README.md                     # This file
```

## Why This Structure?

### 1. **models/** - Data Layer
- Contains pure Dart classes that represent business entities
- No UI logic, just data structures
- Example: `Interpreter` class with name, specialty, rating
- **Benefits**: Easy to test, reusable across the app, clear data contracts

### 2. **services/** - Business Logic Layer
- Handles data operations, API calls, state management
- Acts as intermediary between models and views
- Example: `BookingService` manages interpreter data and booking counts
- **Benefits**: Separates business logic from UI, easier to maintain and test

### 3. **views/** - Screen Layer
- Complete screens/pages that users navigate to
- Contains StatefulWidgets for interactive pages
- Composes smaller widgets to build full screens
- **Benefits**: Clear navigation structure, easier to understand app flow

### 4. **widgets/** - Reusable Components
- Small, focused, reusable UI components
- Used across multiple views
- Example: `CustomButton`, `InterpreterCard`
- **Benefits**: DRY principle, consistent UI, easier maintenance

### 5. **main.dart** - Application Entry
- App initialization and routing setup
- Main navigation structure (BottomNavigationBar, Drawer)
- **Benefits**: Single source of truth for app-wide settings

## Design Decisions

### Widget Organization
- **Reusability**: Small widgets in `widgets/` folder can be used anywhere
- **Separation of Concerns**: Each folder has a single responsibility
- **Scalability**: Easy to add new features without breaking existing code

### Navigation Structure
- **BottomNavigationBar** for primary screens (Home, Bookings)
- **Drawer** for secondary features and demos
- Follows Material Design guidelines for familiar UX

### State Management
- Simple `setState()` for demos and small features
- Service classes (`BookingService`) for shared state
- Can easily migrate to Provider/BLoC as app grows

## Completed Tasks

✅ **Task 1**: Organized project into models, views, widgets, services folders  
✅ **Task 2**: `hello_world_stateless.dart` - StatelessWidget demo  
✅ **Task 3**: `hello_world_stateful.dart` - StatefulWidget with counter  
✅ **Task 4**: `custom_button.dart` - Reusable button used in multiple screens  
✅ **Task 5**: `bookings_page.dart` - Material and Cupertino widgets  
✅ **Task 6**: BottomNavigationBar + Drawer for navigation  
✅ **Task 7**: Widget tree hierarchy documented in code comments  
✅ **Task 8**: Refactored components into separate widget files  
✅ **Task 9**: Using `flutter_staggered_grid_view` package  
✅ **Task 10**: This README.md documenting the structure  

## Dependencies

- **flutter_staggered_grid_view**: ^0.7.0 - For creating staggered grid layouts
- **cupertino_icons**: ^1.0.2 - iOS-style icons

## Features

### Main App Features
- **Find Interpreters**: Browse available sign language interpreters
- **Book Sessions**: Book interpreters for various specialties
- **My Bookings**: Track your booking history
- **Emergency Booking**: Quick access to nearest interpreter

### Educational Demos (in Drawer menu)
- **Hello - Stateless**: Basic StatelessWidget demonstration
- **Hello - Stateful**: StatefulWidget with interactive counter
- **Staggered Grid**: Third-party package demonstration

## Widget Tree Hierarchy (Task 7)

```
MaterialApp
└── MainScreen (StatefulWidget)
    ├── Scaffold
    │   ├── body: IndexedStack
    │   │   ├── HomePage (StatefulWidget)
    │   │   │   └── Scaffold
    │   │   │       ├── AppBar
    │   │   │       └── Column
    │   │   │           ├── CustomButton (Emergency)
    │   │   │           └── ListView.builder
    │   │   │               └── InterpreterCard (repeated)
    │   │   │                   └── Card
    │   │   │                       └── Column (details)
    │   │   │
    │   │   └── BookingsPage (StatelessWidget)
    │   │       └── Scaffold
    │   │           ├── AppBar
    │   │           └── Column
    │   │               ├── Icon
    │   │               ├── Text (title)
    │   │               ├── Text (count)
    │   │               └── CustomButton
    │   │
    │   ├── bottomNavigationBar: BottomNavigationBar
    │   └── drawer: Drawer
    │       └── ListView
    │           ├── DrawerHeader
    │           └── ListTile (menu items)
```

## Running the App

```bash
# Install dependencies
flutter pub get

# Run on connected device/emulator
flutter run

# Build for production
flutter build apk  # Android
flutter build ios  # iOS
```

## Future Enhancements

- Add user authentication
- Implement real-time availability updates
- Add payment integration
- Include video call functionality
- Multi-language support
- Push notifications for bookings

## Learning Resources

This project demonstrates key Flutter concepts:
- Widget composition and reusability
- State management basics
- Navigation patterns
- Material vs Cupertino design
- Third-party package integration
- Project organization best practices

---

**Created for**: Flutter Development Course - First Activity Hands-On Tasks  
**Date**: 2025  
**Framework**: Flutter SDK >=2.19.0 <4.0.0