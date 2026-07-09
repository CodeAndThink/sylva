# Home Screen (`features/home`)

## Purpose
The main camera interface where users extract colors from live feed or capture photos. This is the core functionality of the Sylva app.

## Architecture
- **Page (`home_page.dart`)**: Contains the `CameraPreview` and UI overlays for capturing and switching modes.
- **Cubit (`home_cubit.dart`)**: Manages the camera state, flash modes, and image processing states.
- **Navigator (`home_navigator.dart`)**: Handles routing to `photo_preview` after a picture is taken.

## Key Methods
- `_initCamera()` / `_setCamera()`: Initializes the device camera controller.
- `_switchCamera()`: Toggles between front and rear cameras.
- `_toggleFlash()`: Cycles through flash modes (Auto, On, Off).
- `_takePicture()`: Captures the image, triggering local processing to extract color palettes.
- `_buildCameraPreview()`: Renders the live camera feed using the `camera` package.
