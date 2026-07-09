---
name: Sylva Project Architecture
description: Comprehensive overview of the Sylva project structure, screen architectures, core technologies, and common functions to help the AI understand the codebase instantly.
---

# Sylva Project Architecture & Guidelines

## 1. Core Technologies
- **Framework:** Flutter (stable)
- **State Management:** `flutter_bloc` (specifically using `Cubit`)
- **Navigation:** `go_router` (managed via `core/navigation/app_router.dart`)
- **Dependency Injection:** `get_it` and `injectable` (managed via `core/di/injection.dart`)
- **Localization:** `intl` (`flutter_localizations`)
- **Hardware/Camera:** `camera` package
- **Database:** Local storage via Hive or ObjectBox (specifically for `HistoryRecord` in `data/entities`)

## 2. Project Structure (Clean Architecture)
The `lib/` directory is structured into 4 main layers:
- **`core/`**: Contains global app configurations (`app_configs.dart`), theme settings, constants (colors, assets), exceptions, extensions, and DI setup.
- **`data/`**: Data layer containing implementations of repositories, models (DTOs), and database entities.
- **`domain/`**: Domain layer containing use cases and repository interfaces.
- **`presentation/`**: UI layer containing app-level configurations (`app_cubit`, `theme_cubit`), routing, and all application features (screens).

## 3. Screen (Feature) Architecture
Each module in `lib/presentation/features/<feature_name>/` adheres to a strict pattern:
- **`<feature>_page.dart`**: The main UI component (Stateful/Stateless Widget). Handles user interactions and listens to the Cubit.
- **`<feature>_cubit.dart`**: Business logic component. Emits new states based on actions.
- **`<feature>_state.dart`**: Defines the states for the Cubit using `equatable` or standard data classes.
- **`<feature>_navigator.dart`**: Encapsulates routing logic for the specific feature to decouple navigation from the UI.
- **`widgets/`**: A subdirectory for UI components specific to this feature.

## 4. Key Screens & Functions
Detailed documentation for each screen is located in the `references/screens/` directory:
- [Home Screen Documentation](file:///Users/admin/Documents/self_project/sylva/.agents/skills/sylva_architecture/references/screens/home.md)
- [Photo Preview Screen Documentation](file:///Users/admin/Documents/self_project/sylva/.agents/skills/sylva_architecture/references/screens/photo_preview.md)
- [History Screen Documentation](file:///Users/admin/Documents/self_project/sylva/.agents/skills/sylva_architecture/references/screens/history.md)
- [Settings Screen Documentation](file:///Users/admin/Documents/self_project/sylva/.agents/skills/sylva_architecture/references/screens/settings.md)

## 5. Development Rules & Guidelines
### 5.1. Naming Conventions
- **Files/Folders**: Use `snake_case` strictly (e.g., `home_page.dart`, `custom_button.dart`).
- **Classes/Enums**: Use `PascalCase` (e.g., `HomePage`, `ContactType`).
- **Variables/Methods**: Use `camelCase` (e.g., `takePicture()`, `isFlashOn`).

### 5.2. Widget Composition & Splitting
- **Keep `build` methods clean**: If a UI component becomes too large (e.g., >50 lines of layout code), extract it into a separate private method (e.g., `_buildHeader()`) or a separate stateless widget class.
- **Feature-specific Widgets**: If a widget is only used within a specific screen, place it in `lib/presentation/features/<feature_name>/widgets/`.

### 5.3. Reusability (Extensions & Common Widgets)
- **Extensions First**: BEFORE writing custom logic for DateTime, Strings, or Numbers, check [lib/core/extensions](file:///Users/admin/Documents/self_project/sylva/lib/core/extensions). For example, use `num_extensions.dart` for spacing (e.g., `12.verticalSpace`), `date_time_extension.dart` for formatting, etc.
- **Common Widgets First**: BEFORE creating a new UI component, check [lib/presentation/widgets](file:///Users/admin/Documents/self_project/sylva/lib/presentation/widgets). It contains robust, reusable elements categorised by:
  - `buttons/` (e.g., app buttons)
  - `containers/`
  - `dialogs/`
  - `text/` & `titles/`
  - `loadings/` & `notifications/`
  Always prefer these over building from scratch.

### 5.4. State & Routing (AI Constraints)
1. **Routing**: Never use `Navigator.push`, always use `go_router` via the feature's `<feature>_navigator.dart`.
2. **State**: Use `context.read<YourCubit>()` for actions and `BlocBuilder/BlocConsumer` for UI updates.
3. **Paths**: Always use absolute paths or proper package imports when adding new files.
4. **Localization**: String hardcoding is forbidden. Use `AppLocalizations.of(context)` or `context.l10n`.
