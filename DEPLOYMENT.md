# Deployment Guide

This guide covers building and deploying the Railgun Vault Wallet APK.

## Prerequisites

- Flutter SDK 3.x+ installed
- Android SDK with API level 34
- Java Development Kit (JDK) 11+
- Git

## Building APK

### Development Build

```bash
# Build debug APK
flutter build apk --debug

# Output: build/app/outputs/apk/debug/app-debug.apk
```

### Release Build

```bash
# Build release APK
flutter build apk --release

# Output: build/app/outputs/apk/release/app-release.apk
```

### App Bundle (for Google Play)

```bash
# Build app bundle
flutter build appbundle --release

# Output: build/app/outputs/bundle/release/app-release.aab
```

## Signing APK

### Generate Keystore

```bash
keytool -genkey -v -keystore ~/railgun-vault.keystore \
  -keyalg RSA -keysize 2048 -validity 10000 \
  -alias railgun-vault-key
```

### Create Signing Configuration

Create `android/key.properties`:

```properties
storePassword=your_store_password
keyPassword=your_key_password
keyAlias=railgun-vault-key
storeFile=/path/to/railgun-vault.keystore
```

### Build Signed APK

```bash
flutter build apk --release
```

## Automated Deployment (GitHub Actions)

### Setup

1. Create a GitHub repository
2. Push code to main branch
3. Create a release tag: `git tag v1.0.0`
4. Push tag: `git push origin v1.0.0`

### Workflow

The `.github/workflows/build-apk.yml` will:
1. Trigger on tag push
2. Build release APK
3. Upload to GitHub Releases
4. Store as artifact

### Manual Trigger

```bash
# Go to Actions tab in GitHub
# Select "Build APK Release"
# Click "Run workflow"
```

## Distribution

### GitHub Releases

1. Go to Releases page
2. Create new release
3. Upload APK file
4. Add release notes
5. Publish

### Google Play Store

1. Create Google Play Developer account
2. Create app listing
3. Upload signed AAB
4. Fill store listing details
5. Submit for review

### Direct Distribution

1. Host APK on server
2. Create download link
3. Share with users
4. Users install via "Unknown Sources"

## Testing Before Release

### Local Testing

```bash
# Install on connected device
flutter install

# Run app
flutter run --release
```

### Device Testing

1. Test on multiple Android versions
2. Test on different screen sizes
3. Test all features:
   - Send transaction
   - Receive QR code
   - View history
   - Copy address
4. Test error scenarios
5. Test network connectivity

### Testnet Deployment

1. Update RPC URL to testnet
2. Use testnet contract address
3. Test with testnet ETH
4. Verify all transactions

## Version Management

### Semantic Versioning

Format: `MAJOR.MINOR.PATCH`

- MAJOR: Breaking changes
- MINOR: New features
- PATCH: Bug fixes

### Update Version

Edit `pubspec.yaml`:

```yaml
version: 1.0.0+1
```

Format: `version+build_number`

## Release Checklist

- [ ] Update version in pubspec.yaml
- [ ] Update CHANGELOG.md
- [ ] Run tests: `flutter test`
- [ ] Run analysis: `flutter analyze`
- [ ] Build APK: `flutter build apk --release`
- [ ] Test on device
- [ ] Create git tag
- [ ] Push to GitHub
- [ ] Create release notes
- [ ] Upload to distribution platform

## Troubleshooting

### Build Fails

```bash
# Clean build
flutter clean
flutter pub get
flutter build apk --release
```

### Signing Issues

```bash
# Verify keystore
keytool -list -v -keystore ~/railgun-vault.keystore
```

### Size Issues

```bash
# Check APK size
flutter build apk --release --analyze-size

# Enable shrinking
# Edit android/app/build.gradle
```

## Monitoring

### Crash Reporting

Consider integrating:
- Firebase Crashlytics
- Sentry
- Bugsnag

### Analytics

Consider integrating:
- Firebase Analytics
- Mixpanel
- Amplitude

## Security

- Keep keystore file secure
- Never commit keystore to git
- Use environment variables for passwords
- Rotate keys periodically
- Monitor for unauthorized access

## Support

For deployment issues:
1. Check Flutter documentation
2. Review GitHub Actions logs
3. Check Android build documentation
4. Open GitHub issue with details
