# Common Package

Shared models, DTOs, and utilities used across the Recall application's backend and frontend.

## 📦 Purpose

This package contains shared code that is used by both the backend and frontend applications, ensuring consistency and reducing code duplication across the monorepo.

## 🏗️ Structure

```
common/
├── lib/
│   ├── dtos/                  # Data Transfer Objects
│   ├── models/                # Domain models
│   ├── extensions/            # Utility extensions
│   └── common.dart            # Package exports
└── test/                      # Tests
```

## 📋 Contents

### Models

#### User Model
```dart
class User {
  final String id;
  final String email;
  final String firstName;
  final String lastName;
  final AuthProvider provider;
  final String providerId;
  final String? avatarUrl;
  final DateTime createdAt;
  final DateTime updatedAt;
}
```

#### Note Model
```dart
class Note {
  final String id;
  final String userId;
  final String title;
  final String content;
  final DateTime createdAt;
  final DateTime updatedAt;
}
```

#### OAuth Models
```dart
class OAuthData {
  final String id;
  final String email;
  final String firstName;
  final String lastName;
  final String provider;
  final String? avatarUrl;
}

class OAuthResponse {
  final String token;
  final OAuthData user;
}
```

### DTOs (Data Transfer Objects)

#### Create Note Parameters
```dart
class CreateNoteParams {
  final String title;
  final String content;
  
  static String? validate(Map<String, dynamic> data);
  static CreateNoteParams fromMap(Map<String, dynamic> map);
}
```

#### Update Note Parameters
```dart
class UpdateNoteParams {
  final String? title;
  final String? content;
  
  static String? validate(Map<String, dynamic> data);
  static UpdateNoteParams fromMap(Map<String, dynamic> map);
}
```

### Extensions

#### Schema Validation Result Extension
```dart
extension SchemaValidationResultExtension on SchemaValidationResult {
  String? get firstError;
}
```

## 🚀 Usage

### In Backend

```dart
import 'package:common/common.dart';

// Use models
final user = User.fromOAuthData(/* ... */);
final note = Note(/* ... */);

// Use DTOs
final params = CreateNoteParams.fromMap(requestData);
final validationError = CreateNoteParams.validate(requestData);
```

### In Frontend

```dart
import 'package:common/common.dart';

// Use models
final user = User.fromJson(jsonData);
final note = Note.fromJson(jsonData);

// Use DTOs
final createParams = CreateNoteParams(
  title: 'My Note',
  content: 'Note content',
);
```

## 🛠️ Development

### Code Generation

The package uses [Dart Mappable](https://pub.dev/packages/dart_mappable) for code generation:

```bash
# Generate mappers
dart run build_runner build

# Watch for changes
dart run build_runner watch
```

### Adding New Models

1. Create the model class in `lib/models/`
2. Add the export to `lib/models/models.dart`
3. Run code generation: `dart run build_runner build`
4. Add tests in `test/`

### Adding New DTOs

1. Create the DTO class in `lib/dtos/`
2. Add validation methods
3. Add the export to `lib/dtos/dtos.dart`
4. Run code generation: `dart run build_runner build`
5. Add tests in `test/`

## 🧪 Testing

### Run Tests

```bash
dart test
```

### Test Structure

```
test/
├── models/                    # Model tests
├── dtos/                      # DTO tests
└── extensions/                # Extension tests
```

## 📦 Dependencies

### Core Dependencies

- `dart_mappable` - Code generation for serialization
- `luthor` - Schema validation
- `uuid` - UUID generation

### Development Dependencies

- `build_runner` - Code generation runner
- `dart_mappable_builder` - Mappable code generation
- `lints` - Code analysis
- `test` - Testing framework

## 🔧 Configuration

### pubspec.yaml

```yaml
name: common
description: Shared models and utilities for Recall
version: 1.0.0

environment:
  sdk: ^3.9.2

dependencies:
  dart_mappable: ^4.6.0
  luthor: ^0.9.0
  uuid: ^4.5.1

dev_dependencies:
  build_runner: ^2.7.0
  dart_mappable_builder: ^4.6.0
  lints: ^6.0.0
  test: ^1.25.6
```

## 📝 Best Practices

### Model Design

1. **Immutable Models**: All models should be immutable
2. **Validation**: Include validation methods for DTOs
3. **Serialization**: Use code generation for JSON serialization
4. **Documentation**: Document all public APIs

### DTO Design

1. **Validation**: Always include validation methods
2. **Null Safety**: Use nullable types appropriately
3. **Consistency**: Follow consistent naming conventions
4. **Error Handling**: Provide clear error messages

### Code Generation

1. **Regenerate**: Always regenerate code after model changes
2. **Version Control**: Commit generated files
3. **CI/CD**: Include code generation in build process

## 🔄 Versioning

The common package follows semantic versioning:

- **Major**: Breaking changes to models or APIs
- **Minor**: New features or models
- **Patch**: Bug fixes and improvements

## 🤝 Contributing

1. Follow the existing code style
2. Add tests for new models/DTOs
3. Update documentation
4. Ensure code generation works
5. Test with both backend and frontend

## 📄 License

This project is licensed under the MIT License.