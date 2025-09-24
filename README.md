# Recall

A full-stack Dart & Flutter notes application built on Globe, showcasing authentication, database, and AI features (coming soon!).

## 🎯 Project Purpose

Recall serves multiple purposes:

- **Globe Platform Showcase**: Demonstrates Globe DB, Globe Platform (hosting), and various Globe features
- **Educational Resource**: Teaches Dart and Flutter developers about full-stack Dart development
- **Reference Implementation**: Provides a working example of a complete platform with backend and frontend

## 🌐 Live Demo

- **Frontend**: [https://recall.globeapp.dev](https://recall.globeapp.dev)
- **Backend API**: [https://recall-api.globeapp.dev](https://recall-api.globeapp.dev)

## 🏗️ Architecture

This is a monorepo containing three main components:

```
recall/
├── apps/
│   ├── backend/          # Dart Frog API server
│   └── frontend/         # Flutter web application
└── packages/
    └── common/           # Shared models and DTOs
```

### Tech Stack

**Backend:**
- [Dart Frog](https://dartfrog.vgv.dev/) - Web framework for Dart
- [Drift](https://drift.simonbinder.eu/) - Type-safe ORM for database operations
- [Globe DB](https://globe.dev) - Cloud database (SQLite for local development)
- OAuth 2.0 authentication (Google & GitHub)

**Frontend:**
- [Flutter](https://flutter.dev/) - UI framework
- [Riverpod](https://riverpod.dev/) - State management
- [Go Router](https://pub.dev/packages/go_router) - Navigation
- [Flutter Quill](https://pub.dev/packages/flutter_quill) - Rich text editor

**Shared:**
- [Dart Mappable](https://pub.dev/packages/dart_mappable) - Code generation
- [Luthor](https://pub.dev/packages/luthor) - Schema validation

## 🚀 Quick Start

### Prerequisites

- [Dart SDK](https://dart.dev/get-dart) ^3.9.0
- [Flutter SDK](https://flutter.dev/docs/get-started/install) ^3.9.0
- [Git](https://git-scm.com/)

### 1. Clone the Repository

```bash
git clone https://github.com/invertase/recall.git
cd recall
```

### 2. Install Dependencies

```bash
# Install dependencies for each package individually
# Backend dependencies
cd apps/backend
dart pub get

# Frontend dependencies  
cd ../frontend
flutter pub get

# Common package dependencies
cd ../../packages/common
dart pub get

# Return to root
cd ../..
```

### 3. Set Up OAuth Applications

Before setting up environment variables, you need to configure OAuth applications with GitHub and Google.

#### GitHub OAuth Setup

1. Go to [GitHub Developer Settings](https://github.com/settings/developers)
2. Click **OAuth Apps** → **New OAuth App**
3. Fill out the form:
   - **Application name**: Recall App
   - **Homepage URL**: `http://localhost:8080`
   - **Authorization callback URL**: `http://localhost:8080/auth/github/callback`
4. Click **Register application**
5. Copy your **Client ID** and generate a **Client Secret**

#### Google OAuth Setup

1. Go to [Google Cloud Console](https://console.cloud.google.com/)
2. Create a new project or select existing one
3. Navigate to **APIs & Services** → **Credentials**
4. Click **+ CREATE CREDENTIALS** → **OAuth client ID**
5. Configure the OAuth consent screen if prompted
6. Select **Web application** as the application type
7. Add **Authorized redirect URI**: `http://localhost:8080/auth/google/callback`
8. Click **CREATE** and copy your **Client ID** and **Client Secret**

### 4. Set Up Environment Variables

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

### 5. Run the Backend

```bash
cd apps/backend
dart_frog dev
```

The API will be available at `http://localhost:8080`

### 6. Run the Frontend

```bash
cd apps/frontend
flutter run -d web-server --web-port 3000
```

The app will be available at `http://localhost:3000`

## 📚 Documentation

- [Backend Documentation](./apps/backend/README.md)
- [Frontend Documentation](./apps/frontend/README.md)
- [Common Package Documentation](./packages/common/README.md)

## 🧪 Testing

### Backend Tests

```bash
cd apps/backend
dart test
```

### Frontend Tests

```bash
cd apps/frontend
flutter test
```

### Common Package Tests

```bash
cd packages/common
dart test
```

## 🚀 Deployment

### Backend (Globe Platform)

The backend is deployed on Globe Platform at `https://recall-api.globeapp.dev`

### Frontend (Globe Platform)

The frontend is deployed on Globe Platform at `https://recall.globeapp.dev`

## 🤝 Contributing

We welcome contributions! Please see our [Contributing Guidelines](./CONTRIBUTING.md) for details.

### Development Workflow

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/amazing-feature`
3. Make your changes
4. Run tests: `dart test`
5. Commit your changes: `git commit -m 'Add amazing feature'`
6. Push to the branch: `git push origin feature/amazing-feature`
7. Open a Pull Request

## 📋 Features

### ✅ Implemented

- **Authentication**: OAuth 2.0 with Google and GitHub
- **Notes Management**: Create, read, update, delete notes
- **Rich Text Editor**: Powered by Flutter Quill
- **Responsive Design**: Works on desktop and mobile
- **Dark/Light Theme**: Theme switching support
- **Cross-Device Sync**: Notes sync across devices via API
- **User Management**: Profile management with OAuth providers

### 🚧 Coming Soon

- **AI Features**: AI-powered note assistance
- **Collaboration**: Share notes with other users
- **Export/Import**: Export notes in various formats
- **Search**: Full-text search across notes
- **Categories**: Organize notes with tags and categories

## 🏛️ Globe Platform Features Showcased

- **Globe DB**: Cloud database with local SQLite development
- **Globe Platform**: Seamless deployment and hosting
- **Authentication**: OAuth integration
- **API Management**: RESTful API with Dart Frog
- **API Integration**: RESTful API for data synchronization

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Built with [Globe](https://globe.dev) platform
- Powered by [Dart Frog](https://dartfrog.vgv.dev/)
- UI components from [Flutter](https://flutter.dev/)
- Database powered by [Globe DB](https://globe.dev)

## 📞 Support

- **Documentation**: [Globe Docs](https://docs.globe.dev)
- **Community**: [Globe Discord](https://invertase.link/globe-discord)
- **Issues**: [GitHub Issues](https://github.com/invertase/recall/issues)
- **Email**: [contact@globe.dev](mailto:contact@globe.dev)

---

**Recall** - Built with ❤️ by the Globe team
