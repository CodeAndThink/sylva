# Sylva

<p align="center">
  <img src="assets/icons/ic_app_icon.png" width="128" style="border-radius: 24px;" alt="Sylva App Icon"/>
</p>

Sylva is a camera application designed to help you capture and discover the world's colors effortlessly. It processes camera data locally on your device to analyze and extract color palettes in real time.

## Features

- **Color Palette Extraction**: Take a photo using the built-in camera, and Sylva will instantly analyze the image to extract a beautiful color palette.
- **Local Processing**: All camera analysis is done securely and locally on your device. No photos or data are uploaded to any server.
- **Multi-language Support**: Full localization for English, Vietnamese, Japanese, and Chinese.
- **Premium Design**: Built with a modern, clean, and responsive UI.

## Architecture & Tech Stack

- **Framework**: [Flutter](https://flutter.dev/)
- **State Management**: [flutter_bloc](https://pub.dev/packages/flutter_bloc) (Cubit)
- **Navigation**: [go_router](https://pub.dev/packages/go_router)
- **Localization**: [intl](https://pub.dev/packages/intl)
- **Camera**: [camera](https://pub.dev/packages/camera)

## Getting Started

### Prerequisites
- Flutter SDK (latest stable version)
- Dart SDK
- Android Studio / Xcode for deploying to devices

### Installation

1. Clone the repository:
   ```bash
   git clone <repository_url>
   ```

2. Navigate into the project directory:
   ```bash
   cd sylva
   ```

3. Install dependencies:
   ```bash
   flutter pub get
   ```

4. Generate localization files (if needed):
   ```bash
   dart run intl_utils:generate
   ```

5. Run the application:
   ```bash
   flutter run
   ```

## Acknowledgements

Sylva utilizes some free assets from talented creators on Flaticon and Magnific. Credits are provided inside the app's Settings -> Acknowledgements page.
