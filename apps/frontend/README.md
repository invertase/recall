# Recall Frontend

A Flutter web application for the Recall notes platform, showcasing modern Flutter development practices, responsive design, and full-stack Dart integration.

## 🏗️ Architecture

The frontend is built with Flutter and follows a clean architecture pattern:

```
frontend/
├── lib/
│   ├── src/
│   │   ├── config/           # Environment configuration
│   │   ├── models/           # Data models
│   │   ├── presentation/     # UI layer
│   │   │   ├── landing/      # Landing page
│   │   │   └── notes/        # Notes management
│   │   ├── providers/        # State management (Riverpod)
│   │   ├── services/         # Business logic
│   │   └── shared/           # Shared components
│   └── main.dart             # App entry point
├── assets/                   # Static assets
└── web/                      # Web-specific files
```

## 🚀 Quick Start

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install) ^3.9.0
- [Dart SDK](https://dart.dev/get-dart) ^3.9.0
- A modern web browser

### 1. Install Dependencies

```bash
flutter pub get
```

### 2. Configure API URL

The frontend connects to the backend API. By default, it connects to `http://localhost:8080` for local development.

For production or custom backend:

```bash
# Set custom API URL
flutter run -d web-server --web-port 3000 --dart-define=API_URL=https://your-api-url.com
```

### 3. Run the Application

```bash
# Development mode
flutter run -d web-server --web-port 3000

# With hot reload
flutter run -d web-server --web-port 3000 --hot
```

The app will be available at `http://localhost:3000`

### 4. Build for Production

```bash
# Build for web
flutter build web

# Build with custom API URL
flutter build web --dart-define=API_URL=https://recall-api.globeapp.dev
```

## 🎨 Features

### ✅ Implemented Features

- **Responsive Design**: Works seamlessly on desktop and mobile
- **Authentication**: OAuth 2.0 with Google and GitHub
- **Notes Management**: Create, edit, delete, and organize notes
- **Rich Text Editor**: Powered by Flutter Quill
- **Dark/Light Theme**: Theme switching with system preference detection
- **Cross-Device Sync**: Notes sync across devices via API
- **User Profile**: Profile management with OAuth providers
- **Mobile-First**: Optimized mobile experience

### 🚧 Coming Soon

- **AI Features**: AI-powered note assistance
- **Collaboration**: Share notes with other users
- **Export/Import**: Export notes in various formats
- **Search**: Full-text search across notes
- **Categories**: Organize notes with tags and categories

## 🛠️ Development

### Project Structure

#### State Management (Riverpod)

```dart
// Providers for different features
providers/
├── auth_provider.dart          # Authentication state
├── notes_provider.dart         # Notes management
├── selected_note_provider.dart # Currently selected note
├── note_mutations.dart         # Note CRUD operations
└── theme_provider.dart         # Theme management
```

#### UI Components

```dart
// Shared components
shared/
├── widgets/                    # Reusable widgets
├── theme/                      # Theme configuration
├── router/                     # Navigation setup
└── utils/                      # Utility functions
```

#### Feature Modules

```dart
// Feature-specific UI
presentation/
├── landing/                    # Landing page
│   ├── pages/
│   └── widgets/
└── notes/                      # Notes management
    ├── pages/
    └── widgets/
```

### Code Generation

The project uses code generation for:

- JSON serialization (Dart Mappable)
- Model mapping

```bash
# Generate code
dart run build_runner build

# Watch for changes
dart run build_runner watch
```

### Code Style

The project uses [Lints](https://pub.dev/packages/lints) for code analysis.

```bash
# Run linter
flutter analyze

# Fix issues
dart fix --apply
```

## 🧪 Testing

### Run Tests

```bash
# Run all tests
flutter test

# Run tests with coverage
flutter test --coverage
```

### Test Structure

```
test/
└── widget_test.dart           # Widget tests
```

## 🎨 Theming

The app supports both light and dark themes with a custom theme system:

### Theme Configuration

```dart
// Custom theme colors and typography
shared/theme/
├── app_colors.dart            # Color definitions
├── color_scheme.dart          # Material color schemes
├── text_theme.dart            # Typography
└── theme_data.dart            # Theme configuration
```

### Using Themes

```dart
// Access theme in widgets
final theme = GlobeTheme.of(context);
final colorScheme = theme.colorScheme;
final textTheme = theme.textTheme;
```

## 📱 Responsive Design

The app is fully responsive and adapts to different screen sizes:

### Breakpoints

- **Mobile**: < 768px
- **Desktop**: ≥ 768px

### Responsive Utilities

```dart
// Check screen size
if (context.isMobile) {
  // Mobile-specific UI
} else {
  // Desktop-specific UI
}
```

## 🔌 API Integration

### Services

```dart
services/
├── auth_service.dart          # Authentication
├── notes_service.dart         # Notes API
├── user_service.dart          # User management
└── authenticated_client.dart  # HTTP client with auth
```

### API Configuration

```dart
// Environment configuration
class Environment {
  static const String apiUrl = String.fromEnvironment(
    'API_URL',
    defaultValue: 'http://localhost:8080',
  );
}
```

## 🚀 Deployment

### Local Development

```bash
flutter run -d web-server --web-port 3000
```

### Production Build

```bash
flutter build web --release
```

### Globe Platform Deployment

The frontend is deployed on Globe Platform at `https://recall.globeapp.dev`

## 📦 Dependencies

### Core Dependencies

- `flutter` - UI framework
- `flutter_riverpod` - State management
- `go_router` - Navigation
- `flutter_quill` - Rich text editor
- `http` - HTTP client
- `url_launcher` - URL handling

### UI Dependencies

- `google_fonts` - Typography
- `flutter_svg` - SVG support
- `native_storage` - Local storage

### Development Dependencies

- `flutter_test` - Testing framework
- `lints` - Code analysis

## 🔧 Configuration

### Environment Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `API_URL` | Backend API URL | `http://localhost:8080` |

### Build Configuration

```bash
# Custom API URL
flutter build web --dart-define=API_URL=https://recall-api.globeapp.dev

# Release build
flutter build web --release
```

## 🐛 Troubleshooting

### Common Issues

#### Hot Reload Not Working

```bash
# Restart with hot reload
flutter run -d web-server --web-port 3000 --hot
```

#### Build Issues

```bash
# Clean and rebuild
flutter clean
flutter pub get
flutter build web
```

#### API Connection Issues

1. Verify backend is running
2. Check API URL configuration
3. Ensure CORS is properly configured

## 📱 Browser Support

- Chrome (recommended)
- Firefox
- Safari
- Edge

## 🤝 Contributing

1. Follow Flutter best practices
2. Maintain responsive design
3. Add tests for new features
4. Update documentation
5. Ensure accessibility compliance

## 📄 License

This project is licensed under the MIT License.