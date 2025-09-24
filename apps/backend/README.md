# Recall Backend

A Dart Frog API server that powers the Recall notes application, showcasing Globe DB integration, OAuth authentication, and RESTful API design.

## 🏗️ Architecture

The backend is built with [Dart Frog](https://dartfrog.vgv.dev/), a modern web framework for Dart, and uses the following architecture:

```
backend/
├── lib/
│   ├── config/           # Environment configuration
│   ├── database/         # Drift database setup
│   ├── handlers/         # Request handlers
│   ├── repositories/     # Data access layer
│   ├── services/         # Business logic
│   └── utils/            # Utility functions
├── routes/               # API routes
└── test/                 # Tests
```

## 🚀 Quick Start

### Prerequisites

- [Dart SDK](https://dart.dev/get-dart) ^3.9.2
- [Dart Frog CLI](https://dartfrog.vgv.dev/docs/getting-started/installation)

### 1. Install Dependencies

```bash
dart pub get
```

### 2. Set Up Environment Variables

Create a `.env` file in the `apps/backend/` directory:

```env
# Server Configuration
BASE_URL=http://localhost:8080
CLIENT_URL=http://localhost:3000

# OAuth Configuration
GITHUB_CLIENT_ID=your_github_client_id
GITHUB_CLIENT_SECRET=your_github_client_secret
GOOGLE_CLIENT_ID=your_google_client_id
GOOGLE_CLIENT_SECRET=your_google_client_secret

# JWT Configuration
JWT_SECRET=your_jwt_secret_key
```

### 3. Generate Database Code

```bash
dart run build_runner build
```

### 4. Run the Server

```bash
# Development mode with hot reload
dart_frog dev

# Production mode
dart_frog build
dart run build/bin/server.dart
```

The API will be available at `http://localhost:8080`

## 🔧 Configuration

### Environment Variables

| Variable | Description | Required |
|----------|-------------|----------|
| `BASE_URL` | Backend server URL | Yes |
| `CLIENT_URL` | Frontend client URL | Yes |
| `GITHUB_CLIENT_ID` | GitHub OAuth client ID | Yes |
| `GITHUB_CLIENT_SECRET` | GitHub OAuth client secret | Yes |
| `GOOGLE_CLIENT_ID` | Google OAuth client ID | Yes |
| `GOOGLE_CLIENT_SECRET` | Google OAuth client secret | Yes |
| `JWT_SECRET` | JWT signing secret | Yes |

### OAuth Setup

For detailed OAuth setup instructions, refer to the Globe documentation:

- **[GitHub OAuth Setup Guide](https://docs.globe.dev/guides/sign-in-with-github#step-1-configure-your-github-oauth-app)**
- **[Google OAuth Setup Guide](https://docs.globe.dev/guides/sign-in-with-google#step-1-configure-your-google-cloud-credentials)**

#### Quick Setup Summary

**GitHub OAuth:**
1. Go to [GitHub Developer Settings](https://github.com/settings/developers)
2. Create a new OAuth App
3. Set Authorization callback URL to: `{BASE_URL}/auth/github/callback`
4. Copy Client ID and Client Secret to your `.env` file

**Google OAuth:**
1. Go to [Google Cloud Console](https://console.cloud.google.com/)
2. Create a new project or select existing one
3. Navigate to **APIs & Services** → **Credentials**
4. Create OAuth 2.0 credentials
5. Set Authorized redirect URIs to: `{BASE_URL}/auth/google/callback`
6. Copy Client ID and Client Secret to your `.env` file

## 📊 Database

The backend uses [Drift](https://drift.simonbinder.eu/) as an ORM with SQLite for local development and Globe DB for production.

### Schema

#### Users Table
```sql
CREATE TABLE users (
  id TEXT PRIMARY KEY,
  email TEXT UNIQUE NOT NULL,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  provider TEXT NOT NULL,
  provider_id TEXT NOT NULL,
  avatar_url TEXT,
  created_at DATETIME NOT NULL,
  updated_at DATETIME NOT NULL
);
```

#### Notes Table
```sql
CREATE TABLE notes (
  id TEXT PRIMARY KEY,
  user_id TEXT NOT NULL,
  title TEXT NOT NULL,
  content TEXT NOT NULL,
  created_at DATETIME NOT NULL,
  updated_at DATETIME NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users (id)
);
```

### Database Operations

```bash
# Generate database code
dart run build_runner build

# Watch for changes
dart run build_runner watch
```

## 🛣️ API Routes

### Authentication

| Method | Endpoint | Description |
|--------|----------|-------------|
| `GET` | `/auth/google` | Get Google OAuth URL |
| `GET` | `/auth/github` | Get GitHub OAuth URL |
| `GET` | `/auth/google/callback` | Google OAuth callback |
| `GET` | `/auth/github/callback` | GitHub OAuth callback |

### User Management

| Method | Endpoint | Description |
|--------|----------|-------------|
| `GET` | `/api/me` | Get current user info |

### Notes

| Method | Endpoint | Description |
|--------|----------|-------------|
| `GET` | `/api/notes` | Get user's notes |
| `POST` | `/api/notes` | Create a new note |
| `GET` | `/api/notes/{id}` | Get specific note |
| `PUT` | `/api/notes/{id}` | Update a note |
| `DELETE` | `/api/notes/{id}` | Delete a note |

### Example API Usage

#### Create a Note

```bash
curl -X POST http://localhost:8080/api/notes \
  -H "Authorization: Bearer YOUR_JWT_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "title": "My First Note",
    "content": "This is the content of my note"
  }'
```

#### Get User's Notes

```bash
curl -X GET http://localhost:8080/api/notes \
  -H "Authorization: Bearer YOUR_JWT_TOKEN"
```

## 🧪 Testing

### Run Tests

```bash
# Run all tests
dart test

# Run tests with coverage
dart test --coverage=coverage
```

### Test Structure

```
test/
├── routes/
│   └── index_test.dart    # API route tests
└── unit/                  # Unit tests
```

## 🚀 Deployment

### Local Development

```bash
dart_frog dev
```

### Production Build

```bash
dart_frog build
dart run build/bin/server.dart
```

### Globe Platform Deployment

The backend is deployed on Globe Platform at `https://recall-api.globeapp.dev`

## 🔒 Security

### Authentication

- OAuth 2.0 with Google and GitHub
- JWT tokens for API authentication
- Secure token storage and validation

### CORS

CORS is configured to allow requests from the frontend domain.

### Environment Variables

Sensitive configuration is stored in environment variables and not committed to version control.

## 📝 Development

### Code Generation

The project uses code generation for:

- Database models (Drift)
- JSON serialization (Dart Mappable)

```bash
# Generate all code
dart run build_runner build

# Watch for changes
dart run build_runner watch
```

### Code Style

The project uses [Very Good Analysis](https://pub.dev/packages/very_good_analysis) for linting.

```bash
# Run linter
dart analyze

# Fix issues
dart fix --apply
```

## 🐛 Troubleshooting

### Common Issues

#### Database Connection Issues

```bash
# Regenerate database code
dart run build_runner clean
dart run build_runner build
```

#### OAuth Issues

1. Verify OAuth app configuration
2. Check callback URLs match exactly
3. Ensure environment variables are set correctly

#### Port Already in Use

```bash
# Kill process on port 8080
lsof -ti:8080 | xargs kill -9
```

## 📚 Dependencies

### Core Dependencies

- `dart_frog` - Web framework
- `drift` - Database library
- `dart_jsonwebtoken` - JWT handling
- `http` - HTTP client
- `uuid` - UUID generation

### Development Dependencies

- `build_runner` - Code generation
- `drift_dev` - Drift code generation
- `very_good_analysis` - Linting rules
- `test` - Testing framework

## 🤝 Contributing

1. Follow the existing code style
2. Add tests for new features
3. Update documentation
4. Ensure all tests pass

## 📄 License

This project is licensed under the MIT License.