# Twinfix - Smart Photo Cleaner & Utilities

Twinfix is a powerful, Flutter-based mobile application designed to help users intelligently clean up their device storage by finding duplicate photos, blurry images, and large media files. It also offers a rich set of utility features including AI face blurring, GPS data removal, watermarking, and document detection.

## 📋 Project Overview

The app provides a seamless and gamified experience to free up storage space. Users can simply swipe to keep or delete photos, earn badges and streaks, and utilize premium AI features to manage their photo gallery securely and efficiently.

### 🎯 Key Features

- **Smart Cleanup**: Rapidly scan and group duplicate or visually similar photos, blurry images, and screenshots to free up space.
- **Swipe to Clean**: Tinder-style swipe gestures to easily sort photos (Swipe left to delete, right to keep).
- **Gamification & Achievements**: Track your cleanup streaks, monitor the total space saved, and unlock achievement badges.
- **Privacy Utilities**:
  - **Remove GPS**: Strip location data from photos before sharing.
  - **Face Blur**: AI-powered automatic face detection and blurring/pixelating.
- **Photo Enhancements**: Add custom watermarks or edit photos with a built-in image editor.
- **Document Detection**: Automatically identify and group photos containing text or documents.

## 🛠️ Tech Stack

- **Framework**: Flutter
- **Language**: Dart
- **State Management**: flutter_bloc (Cubit)
- **Dependency Injection**: get_it & injectable
- **Local Database**: Isar Database
- **Backend / Auth**: Supabase
- **Navigation**: go_router
- **Localization**: flutter_intl

## 📂 Project Structure

The project follows a Clean Architecture pattern, separating concerns into core, data, domain, and presentation layers.

```text
lib/
├── core/             # Configurations, constants, DI, extensions, and shared services
├── data/             # Repositories implementation, data sources, and Isar models
├── domain/           # Entities, repository interfaces, and use cases
└── presentation/     # UI layer
    ├── app/          # App-level configurations and global Cubits
    ├── features/     # Feature-based UI modules (e.g., scan, settings, achievement)
    ├── theme/        # Global theme, colors, and typography
    └── widgets/      # Reusable UI components
```

## 🚀 Getting Started

### Prerequisites
- Flutter SDK installed
- Dart SDK installed
- Supabase Project (for Authentication and Backend)

### Installation

1. **Clone the repository**:
   ```bash
   git clone <repository_url>
   ```

2. **Install dependencies**:
   ```bash
   flutter pub get
   ```

3. **Generate code (Isar, Injectable, etc.)**:
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

4. **Configure Environment Variables**:
   Set up your `.env` file with Supabase URL and keys, or follow the configuration inside the `core` layer.

5. **Run the application**:
   ```bash
   flutter run
   ```

## 🧭 App Navigation Flow

- **Splash & Onboarding**: Introduces the app to new users with a swipe tutorial.
- **Main Tabs**:
  1. **Scan**: Central hub for running smart storage scans and accessing the gallery manager.
  2. **Other Features**: Access utilities like Face Blur, Watermark, Remove GPS, and Image Editor.
  3. **Achievements**: Gamified dashboard showing memory warnings, cleanup streaks, and earned badges.
  4. **Settings**: User profile, synchronization options, language toggles, and premium subscription (Paywall).

## 🤝 Contributing

1. Create a feature branch (`git checkout -b feature/AmazingFeature`).
2. Commit your changes (`git commit -m 'Add some AmazingFeature'`).
3. Push to the branch (`git push origin feature/AmazingFeature`).
4. Open a Pull Request.
