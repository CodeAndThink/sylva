# History Screen (`features/history`)

## Purpose
Displays previously captured and extracted color palettes, allowing users to revisit their favorite or past color analyses.

## Architecture
- **Page (`history_page.dart`)**: UI for listing historical records. Usually implements a grid or list view.
- **Cubit (`history_cubit.dart`)**: Fetches data from the local database.
- **Navigator (`history_navigator.dart`)**: Navigation logic.

## Key Behaviors
- **Data Fetching**: Uses `HistoryRecord` entities stored locally via Hive/ObjectBox.
- **Interactions**: Tapping a record usually navigates to a detailed view (often reusing or similar to `photo_preview`).
