# Shabakat Project Documentation

## Project Overview
Shabakat is a Flutter-based management system, likely designed for local network providers or ISPs. It manages core entities such as Customers, Invoices, Payments, Expenses, and Settings. The project follows a Clean Architecture approach to ensure scalability and maintainability.





### Main Technologies
- **Framework:** Flutter (Dart SDK ^3.11.5)
- **State Management:** Riverpod (utilizing `riverpod_generator`)
- **Networking:** Dio with `awesome_dio_interceptor`
- **Data Modeling:** Freezed & Json Serializable
- **Storage:** Flutter Secure Storage & Shared Preferences
- **Icons:** Lucide Icons & Cupertino Icons
- **UI Utilities:** Skeletonizer (for loading states)

### Architecture
The project is organized into the following layers within the `lib/` directory:
- `core/`: Cross-cutting concerns such as network configurations, enums, themes, and utilities.
- `data/`: Implementation of data sources and repositories.
- `domain/`: Business logic, including entities and repository contracts.
- `infrastructor/`: Database management, migrations, and seed data (Note: Directory name contains a typo, likely intended to be `infrastructure`).
- `ui/`: Presentation layer (currently scaffolded).

## Building and Running

### Prerequisites
- Flutter SDK installed and configured.
- Dart SDK ^3.11.5.

### Key Commands
- **Install Dependencies:**
  ```bash
  flutter pub get
  ```
- **Code Generation:**
  The project relies heavily on code generation for Riverpod and Freezed. Run this whenever models or providers change:
  ```bash
  dart run build_runner build --delete-conflicting-outputs
  ```
- **Run the Application:**
  ```bash
  flutter run
  ```
- **Run Tests:**
  ```bash
  flutter test
  ```

## Development Conventions

### Architecture Layers
- **Domain Layer:** Define entities and repository interfaces here. Do not include any implementation details or external dependencies (except for packages like `freezed_annotation`).
- **Data Layer:** Implement the repository interfaces defined in the domain layer. This layer handles data fetching from local or remote sources.
- **UI Layer:** Use Riverpod providers for state management and keep widgets focused on presentation.
- **Core Layer:** Store shared enums, constants, and network client configurations here.

### Coding Style
- Follow the standard [Dart Style Guide](https://dart.dev/guides/language/analysis-options).
- Use `freezed` for all immutable data models.
- Use `riverpod_generator` for creating providers.
- Avoid using `print()` for logging; use the `logger` package or `debugPrint()`.

### Linting
The project uses `flutter_lints` and `riverpod_lint`. Refer to `analysis_options.yaml` for specific rule configurations and exclusions. Generated files (`*.g.dart`, `*.freezed.dart`) are excluded from analysis.


## Project Rules :Flutter Theming & Controls



### 1. Theming Architecture (Single Source of Truth)
- **Rule 1.1**: All colors MUST live in `AppColors`. Never use `Color(0xFF...)` or `Colors.xxx` inside any widget file.
- **Rule 1.2**: All gradients MUST live in `AppGradients`, constructed exclusively from `AppColors` constants.
- **Rule 1.3**: All component themes (inputs, buttons, cards, chips, dialogs, etc.) MUST live in `ControlsThemes` as static factory methods.
- **Rule 1.4**: The `ThemeSelector` class is the only place where `ThemeData` is assembled. Widgets never build `ThemeData` locally.

### 2. Theme Switching & Context
- **Rule 2.1**: Always retrieve colors and text styles via `Theme.of(context)` or `ColorScheme.of(context)`. Never pass `isDarkMode` booleans down the tree.
- **Rule 2.2**: If a widget needs to know the current brightness, use `Theme.of(context).brightness`.
- **Rule 2.3**: When defining custom widget styles that aren't covered by `ControlsThemes`, derive them from the active `ColorScheme` (e.g., `Theme.of(context).colorScheme.primary`).

### 3. Adding New Themed Widgets
- **Rule 3.1**: If a new widget type (e.g., `DropdownButton`, `Checkbox`, `Slider`) is introduced, the agent MUST first add its theme definition to `ControlsThemes` as a static method before using it in any UI file.
- **Rule 3.2**: The `ControlsThemes` factory method MUST accept only `Color` parameters (or `ColorScheme` if many colors are needed). No `BuildContext` inside `ControlsThemes`.
- **Rule 3.3**: Register the new theme in `ThemeSelector` inside the `ThemeData` constructor (e.g., `dropdownMenuTheme: ControlsThemes.dropdownMenuTheme(...)`).

### 4. Widget-Level Styling (The "Zero Hardcoding" Rule)
- **Rule 4.1**: When generating a `TextField`, `TextFormField`, `ElevatedButton`, `TextButton`, or any Material widget, the agent MUST NOT specify `style`, `decoration`, `shape`, `backgroundColor`, or `foregroundColor` directly on the widget instance unless overriding.
- **Rule 4.2**: The widget should inherit its appearance entirely from `ThemeData`. Example:
  ```dart
  // CORRECT
  TextField();
  
  // INCORRECT
  TextField(
    decoration: InputDecoration(
      filled: true,
      fillColor: Colors.grey, // NEVER
    ),
  );
  ```

### 5. Overrides & Local Adjustments
- **Rule 5.1**: If a specific instance needs to differ from the global theme, the agent MUST use `Theme.of(context).<<themeProperty>.copyWith(...)`.
- **Rule 5.2**: Never create a new standalone style object from scratch for a one-off override. Always branch from the theme.
- **Rule 5.3**: Example pattern for overrides:
  ```dart
  final theme = Theme.of(context);
  TextField(
    decoration: theme.inputDecorationTheme.copyWith(
      hintText: 'Search...',
      prefixIcon: const Icon(Icons.search),
    ),
  );
  ```

### 6. Text & Typography
- **Rule 6.1**: All text styles MUST come from `Theme.of(context).textTheme` (e.g., `Theme.of(context).textTheme.bodyLarge`). Never hardcode a `TextStyle` directly in a widget.
- **Rule 6.2**: For one-off text adjustments, use `Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold)`.

### 7. Layout & Sizing (`AppSizes`)
- **Rule 7.1**: Use the `AppSizes` extension on `BuildContext` from `lib/core/constants/app_sizes.dart` for all spacing, padding, screen breakpoints, and fixed sizes (e.g., `context.paddingMedium`, `context.borderRadiusLarge`). No magic numbers like `EdgeInsets.all(16)` unless defined as a constant in a shared layout file.
- **Rule 7.2**: Partition large widgets into smaller private widget classes (`_Header`, `_ActionButton`) rather than nesting deep build methods.

### 8. Code Style
- **Rule 8.1**: No comments inside theme files or widget files unless the logic is mathematically non-obvious.
- **Rule 8.2**: Keep `AppColors`, `AppGradients`, `ControlsThemes`, and `ThemeSelector` in separate files under `core/themes/`.
- **Rule 8.3**: Use `const` constructors everywhere possible.

---

### Agent Decision Flowchart
When asked to add a new UI element:
1. Does `ControlsThemes` already define its theme? → Use it globally via `ThemeSelector`.
2. Is it missing? → Define a static factory in `ControlsThemes` using `AppColors`, then register in `ThemeSelector`.
3. Does the specific instance need a tweak? → Use `Theme.of(context).<<property>.copyWith(...)`.
4. Never hardcode colors, shapes, or padding inside the widget build method.

---

### Example: Agent-Correct Generated Snippet
```dart
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      children: [
        TextField(
          decoration: theme.inputDecorationTheme.copyWith(
            hintText: 'Email',
            prefixIcon: Icon(Icons.email, color: colorScheme.outline),
          ),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {},
          child: const Text('Sign In'),
        ),
      ],
    );
  }
}
```

Apply these rules strictly. Centralize everything, inherit by default, and override only through `Theme.of(context)...copyWith`.
