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

**My Approach**

I approached this project by first defining a clear separation between:

- UI (Screens)

- Business Logic (Providers)

- Data Layer (API + Hive storage)

Instead of building everything inside widgets, I structured the app using Providers to manage state independently from UI components.

**State Management Choice**

ProductProvider → manages product list, likes, and selected product.

HistoryProvider → manages browsing history.

NavigationProvider → manages bottom navigation index.

**Data Persistence Method**
I used Hive for local data persistence
All persisted data is loaded when the app starts, ensuring state is restored even after complete app termination.

**Approximate Time Spent**

Total time spent: 12–15 hours

Breakdown:

Initial structure & API integration: ~4 hours

State management & navigation logic: ~3–4 hours

Persistence with Hive: ~2 hours

UI refinements & animations: ~2 hours

Debugging & optimization: ~2–3 hours

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


**Conclusion**

This project focuses on structured architecture, state consistency across multiple screens, and clean navigation logic rather than heavy UI design.

It demonstrates practical Flutter application structuring with persistent state and multi-tab coordination.