# Settings Screen (`features/settings`)

## Purpose
Manages app preferences including language, theme, contact/support, and subscription/sponsor information.

## Architecture
- **Page (`settings_page.dart`)**: Renders the list of settings options.
- **Cubit (`settings_cubit.dart`)**: Minimal business logic, mostly delegates to global cubits.
- **Navigator (`settings_navigator.dart`)**: Handles routing to sub-settings like "Sponsors", "Contact", etc.

## Key Behaviors
- **Localization**: Interacts with the global `locale_cubit` to switch between English, Vietnamese, Japanese, Chinese.
- **Theming**: Interacts with the global `theme_cubit`.
- **Links**: Navigates to external support pages or other features (`features/sponsors`, `features/contact`).
