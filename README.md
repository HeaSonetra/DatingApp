# KhmerCouple (ខ្មែរគូ) - Dating App for Cambodia

A modern Flutter dating app designed specifically for Cambodia, featuring Khmer localization and beautiful UI.

**Developer:** Hea Sontera

## Features

- 🌟 **Modern Material 3 Design** - Clean and beautiful user interface
- 🌐 **Dual Language Support** - English and Khmer (ខ្មែរ) localization
- 💝 **Profile Matching** - Browse and like profiles with advanced filtering
- 💬 **Messaging System** - Chat with your matches (UI implemented)
- 🔍 **Smart Search** - Find people by name, location, interests, or bio
- 🎯 **Advanced Filters** - Age range, distance, interests, online status
- 📱 **Cross-Platform** - Works on both Android and iOS
- 🎨 **Beautiful Pink Theme** - Pink and red color scheme with dark mode support

## Screenshots

*Screenshots will be added after app icon and proper assets are created*

## Getting Started

### Prerequisites

- Flutter SDK (3.10.0 or higher)
- Dart SDK (3.0.0 or higher)
- Android Studio / VS Code with Flutter extensions
- Android SDK (for Android development)
- Xcode (for iOS development, macOS only)

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd khmer_match
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate code (for Riverpod and JSON serialization)**
   ```bash
   flutter packages pub run build_runner build --delete-conflicting-outputs
   ```

4. **Generate app icons (optional)**
   ```bash
   flutter pub run flutter_launcher_icons:main
   ```

5. **Run the app**
   ```bash
   flutter run
   ```

## Project Structure

```
lib/
├── main.dart                 # App entry point
├── l10n.yaml                 # Localization configuration
└── src/
    ├── localization/         # App localization files
    │   ├── app_localizations.dart
    │   ├── app_localizations_en.dart
    │   ├── app_localizations_km.dart
    │   └── l10n/
    │       ├── app_en.arb
    │       └── app_km.arb
    ├── models/               # Data models
    │   ├── user.dart
    │   ├── message.dart
    │   └── search_filters.dart
    ├── providers/            # Riverpod providers
    │   ├── auth_provider.dart
    │   ├── profile_provider.dart
    │   └── message_provider.dart
    ├── routing/              # Navigation and routing
    │   └── app_router.dart
    ├── screens/              # UI screens
    │   ├── auth/
    │   ├── home/
    │   ├── messages/
    │   ├── onboarding/
    │   ├── profile/
    │   ├── settings/
    │   ├── main_navigation_screen.dart
    │   └── splash_screen.dart
    ├── services/             # Business logic services
    │   ├── auth_service.dart
    │   ├── profile_service.dart
    │   └── message_service.dart
    ├── theme/                # App theming
    │   └── app_theme.dart
    └── widgets/              # Reusable widgets
        ├── profile_card.dart
        └── search_filters_sheet.dart

assets/
├── images/                   # App images
├── icons/                    # App icons
└── mock/                     # Mock JSON data
    ├── profiles.json
    ├── conversations.json
    └── messages.json
```

## Key Technologies

- **Flutter** - UI framework
- **Riverpod** - State management
- **Go Router** - Navigation and routing
- **Shared Preferences** - Local data storage
- **Cached Network Image** - Image caching and loading
- **Carousel Slider** - Image carousels
- **Material Symbols Icons** - Modern icon set
- **Intl** - Internationalization support

## Development

### Adding New Translations

1. Update `lib/src/localization/l10n/app_en.arb` with new English strings
2. Update `lib/src/localization/l10n/app_km.arb` with Khmer translations
3. Run `flutter gen-l10n` to generate localization files
4. Use translations in your widgets: `AppLocalizations.of(context).yourKey`

### State Management

The app uses Riverpod for state management with code generation:

```dart
// Provider example
@riverpod
Future<List<User>> profiles(ProfilesRef ref) async {
  final service = ref.watch(profileServiceProvider);
  return service.getProfiles();
}

// Usage in widgets
final profiles = ref.watch(profilesProvider);
```

### Adding New Screens

1. Create screen file in appropriate `lib/src/screens/` subdirectory
2. Add route to `lib/src/routing/app_router.dart`
3. Update navigation calls in relevant widgets

## Testing

### Running Tests

```bash
# Run all tests
flutter test

# Run tests with coverage
flutter test --coverage

# Run integration tests
flutter drive --target=test_driver/app.dart
```

### Test Structure

- `test/` - Unit and widget tests
- `integration_test/` - Integration tests
- `test_driver/` - Driver tests

## Building for Production

### Android

```bash
# Build APK
flutter build apk --release

# Build App Bundle (recommended for Play Store)
flutter build appbundle --release
```

### iOS

```bash
# Build iOS app
flutter build ios --release
```

## Mock Data

The app includes comprehensive mock data for development:

- **10 sample profiles** with Cambodian names and locations
- **Sample conversations** with realistic message threads
- **Diverse interests** reflecting Cambodian culture and modern interests
- **Realistic timestamps** and online status

## Configuration

### App Icon

Replace `assets/icons/app_icon.png` with your 1024x1024 app icon, then run:

```bash
flutter pub run flutter_launcher_icons:main
```

### App Name and Bundle ID

Update these files for production:
- `android/app/src/main/AndroidManifest.xml` - Android package name
- `ios/Runner/Info.plist` - iOS bundle identifier
- `pubspec.yaml` - App name and description

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## Roadmap

### Phase 1 (Current) - Core Features
- ✅ Authentication scaffolding
- ✅ Profile browsing and filtering
- ✅ Basic messaging UI
- ✅ Khmer localization
- ✅ Modern Material 3 design

### Phase 2 - Enhanced Features
- [ ] Real-time messaging with WebSocket
- [ ] Photo upload and management
- [ ] Push notifications
- [ ] Advanced matching algorithm
- [ ] Location-based features

### Phase 3 - Advanced Features
- [ ] Video/voice calling
- [ ] Stories feature
- [ ] Premium features
- [ ] Social media integration
- [ ] Advanced analytics

## Known Limitations

This is a starter template with the following limitations:

- **Mock Authentication** - Uses local storage, not real backend
- **Static Data** - Profiles and messages are loaded from JSON files
- **No Real-time Features** - Messaging is UI-only
- **No Image Upload** - Uses placeholder URLs
- **No Push Notifications** - Would require backend integration

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- **Developer:** Hea Sontera
- Designed for the Cambodian dating market
- Khmer translations by native speakers
- UI/UX inspired by modern dating apps
- Built with Flutter best practices

---

**Note**: This is a starter template. For production use, you'll need to integrate with a real backend service, implement proper authentication, add real-time messaging, and handle image uploads.

For questions or support, please open an issue on the repository.
