# Photo Preview Screen (`features/photo_preview`)

## Purpose
Displays the captured image alongside the extracted color palettes. It provides options for the user to save the palette to their history or share it.

## Architecture
- **Page (`photo_preview_page.dart`)**: Renders the image and a list/grid of the extracted colors.
- **Cubit (`photo_preview_cubit.dart`)**: Handles the state of saving the image/palette.
- **Navigator (`photo_preview_navigator.dart`)**: Handles routing back to home or to other screens.

## Key Behaviors
- **Color Extraction**: Receives the `ProcessImageModel` containing the image and its extracted dominant colors.
- **Saving**: Interacts with the data layer (e.g., `HistoryRecord`) to save the analyzed data locally.
- **Sharing**: Integrates with system share sheets to share the color palette.
