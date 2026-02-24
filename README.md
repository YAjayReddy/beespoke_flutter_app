**Beespoke Flutter App Development** 

A simple e-commerce style Flutter application built to practice state management, navigation architecture, and local persistence.

The app demonstrates how multiple screens can communicate using Provider while maintaining state across bottom navigation tabs.

**Overview**

This project simulates a product browsing experience with:

Product feed

Wishlist (liked products)

Browsing history

WebView product preview

Persistent local storage using Hive

The focus of this project is on clean architecture and state management rather than UI complexity.

**Features**

- Product Feed

- Fetches products from API

- Displays product image, title, and price

- Like/unlike functionality

- Hero animations for smooth transitions

- Wishlist

- Displays liked products

- Persisted locally using Hive

- Updates in real time

- Browsing History

- Stores visited products

- Persistent across app restarts

- Tap to navigate back to product

- Auto-scroll to selected product in Home tab

- WebView Integration

- Opens product inside WebView

- Tracks visited products

- Progress indicator during page load

**Architecture**

The app uses:

Provider for state management

IndexedStack + BottomNavigationBar for tab navigation

Hive for local storage

ScrollController for programmatic scrolling

Navigation between tabs is handled using a shared NavigationProvider instead of pushing routes.
This keeps screen state alive and avoids unnecessary rebuilds.

Project Structure
lib/
├── models/
├── providers/
│    ├── product_provider.dart
│    ├── history_provider.dart
│    └── navigation_provider.dart
├── screens/
│    ├── main_navigation_screen.dart
│    ├── history_screen.dart
│    ├── wishlist_screen.dart
│    └── webview_screen.dart
└── main.dart

**Tech Stack**

Flutter

Dart

Provider

Hive

WebView

Shimmer



**Running the Project**

flutter pub get
flutter run