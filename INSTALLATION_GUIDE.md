# Installation Guide

Step-by-step guide to install and run Railgun Vault Wallet.

## System Requirements

### Minimum Requirements

- **OS:** Windows 10+, macOS 10.14+, or Linux
- **RAM:** 4 GB
- **Storage:** 5 GB free space
- **Android Device:** Android 5.0+ (API 21)

### Recommended Requirements

- **OS:** Windows 11, macOS 12+, or Ubuntu 20.04+
- **RAM:** 8 GB+
- **Storage:** 10 GB SSD
- **Android Device:** Android 10+ (API 29+)

## Step 1: Install Flutter

### Windows

1. Download Flutter SDK from [flutter.dev](https://flutter.dev/docs/get-started/install/windows)
2. Extract to `C:\flutter`
3. Add to PATH:
   - Open Environment Variables
   - Add `C:\flutter\bin` to PATH
4. Verify installation:
   ```bash
   flutter doctor
   ```

### macOS

```bash
# Using Homebrew
brew install flutter

# Or download manually from flutter.dev
# Extract and add to PATH in ~/.zshrc or ~/.bash_profile
export PATH="$PATH:~/flutter/bin"
```

### Linux

```bash
# Download Flutter
cd ~
git clone https://github.com/flutter/flutter.git -b stable

# Add to PATH in ~/.bashrc
export PATH="$PATH:~/flutter/bin"

# Verify
flutter doctor
```

## Step 2: Install Android SDK

### Windows/macOS/Linux

1. Download Android Studio from [developer.android.com](https://developer.android.com/studio)
2. Install Android Studio
3. Open Android Studio
4. Go to Settings → SDK Manager
5. Install:
   - Android SDK Platform 34
   - Android SDK Build-Tools 34.x.x
   - Android Emulator
   - Android SDK Platform-Tools

### Verify Installation

```bash
flutter doctor
```

Should show:
- ✓ Flutter
- ✓ Android toolchain
- ✓ Android Studio
- ✓ Connected devices (or emulator)

## Step 3: Clone Repository

### Using Git

```bash
# Clone repository
git clone https://github.com/yourusername/railgun-vault-wallet.git

# Navigate to project
cd railgun-vault-wallet
```

### Using GitHub Desktop

1. Open GitHub Desktop
2. File → Clone Repository
3. Select repository
4. Choose local path
5. Click Clone

## Step 4: Install Dependencies

```bash
# Get Flutter dependencies
flutter pub get

# This will download all packages from pubspec.yaml
```

## Step 5: Configure Environment

### Create .env File

```bash
# Copy example file
cp .env.example .env

# Edit .env
nano .env  # or use your editor
```

### Add API Keys

Edit `.env`:

```env
ALCHEMY_API_KEY=your_alchemy_key_here
INFURA_API_KEY=your_infura_key_here
```

**Get API Keys:**

1. **Alchemy:**
   - Go to [alchemy.com](https://www.alchemy.com/)
   - Sign up for free account
   - Create app
   - Copy API key

2. **Infura:**
   - Go to [infura.io](https://infura.io/)
   - Sign up for free account
   - Create project
   - Copy API key

## Step 6: Setup Android Device

### Physical Device

1. Enable Developer Mode:
   - Go to Settings → About Phone
   - Tap Build Number 7 times
   - Go back to Settings → Developer Options
   - Enable USB Debugging

2. Connect via USB:
   - Connect phone to computer
   - Allow USB debugging on phone
   - Verify connection:
     ```bash
     flutter devices
     ```

### Android Emulator

```bash
# List available emulators
flutter emulators

# Launch emulator
flutter emulators --launch <emulator_name>

# Or use Android Studio
# Tools → Device Manager → Create Virtual Device
```

## Step 7: Run Application

### Run on Connected Device

```bash
# Run app
flutter run

# Or specify device
flutter run -d <device_id>
```

### Run on Emulator

```bash
# Launch emulator first
flutter emulators --launch <emulator_name>

# Then run app
flutter run
```

### Run in Release Mode

```bash
flutter run --release
```

## Step 8: Verify Installation

### Check App Features

1. **Home Screen**
   - See balance display
   - See transaction history
   - See action buttons

2. **Send Transaction**
   - Tap "Send" button
   - Enter recipient address
   - Enter amount
   - Verify numeric keypad

3. **Receive QR Code**
   - Tap "Request" button
   - See QR code
   - Copy address

4. **Settings**
   - Tap "Settings" tab
   - See wallet address
   - See network info

## Troubleshooting

### Issue: "Flutter not found"

**Solution:**
```bash
# Add Flutter to PATH
export PATH="$PATH:~/flutter/bin"

# Verify
flutter --version
```

### Issue: "Android SDK not found"

**Solution:**
```bash
# Set Android SDK path
export ANDROID_SDK_ROOT=~/Android/Sdk
export PATH="$PATH:$ANDROID_SDK_ROOT/tools/bin"

# Verify
flutter doctor
```

### Issue: "No connected devices"

**Solution:**
```bash
# List devices
flutter devices

# If no devices, launch emulator
flutter emulators --launch <emulator_name>

# Or connect physical device with USB debugging
```

### Issue: "Build fails"

**Solution:**
```bash
# Clean build
flutter clean

# Get dependencies again
flutter pub get

# Run again
flutter run
```

### Issue: "API key errors"

**Solution:**
1. Verify `.env` file exists
2. Check API keys are correct
3. Ensure `.env` is in project root
4. Restart app

### Issue: "Permission denied"

**Solution:**
```bash
# Make scripts executable
chmod +x android/gradlew

# Or use Flutter's built-in gradle
flutter build apk
```

## Building APK

### Debug APK

```bash
flutter build apk --debug
# Output: build/app/outputs/apk/debug/app-debug.apk
```

### Release APK

```bash
flutter build apk --release
# Output: build/app/outputs/apk/release/app-release.apk
```

### Install APK on Device

```bash
# Install debug APK
flutter install

# Or manually
adb install build/app/outputs/apk/debug/app-debug.apk
```

## Development Setup

### IDE Setup

#### VS Code

1. Install Flutter extension
2. Install Dart extension
3. Open project folder
4. Press F5 to run

#### Android Studio

1. Install Flutter plugin
2. Install Dart plugin
3. Open project
4. Click Run button

### Code Formatting

```bash
# Format all code
dart format lib/

# Format specific file
dart format lib/main.dart
```

### Code Analysis

```bash
# Run linter
flutter analyze

# Fix issues
dart fix --apply
```

## Testing

### Run Tests

```bash
# Run all tests
flutter test

# Run specific test
flutter test test/utils/address_validator_test.dart

# Run with coverage
flutter test --coverage
```

## Next Steps

1. **Read Documentation**
   - [README.md](README.md)
   - [QUICK_START.md](QUICK_START.md)

2. **Explore Code**
   - Check `lib/screens/`
   - Check `lib/services/`
   - Check `lib/models/`

3. **Customize**
   - Update colors
   - Update contract address
   - Add branding

4. **Deploy**
   - Build release APK
   - Upload to GitHub
   - Share with users

## Support

- **Flutter Docs:** [flutter.dev](https://flutter.dev)
- **Android Docs:** [developer.android.com](https://developer.android.com)
- **GitHub Issues:** [Report issues](https://github.com/yourusername/railgun-vault-wallet/issues)

## Uninstall

### Remove Flutter

```bash
# Remove Flutter directory
rm -rf ~/flutter

# Remove from PATH
# Edit ~/.bashrc or ~/.zshrc and remove Flutter path
```

### Remove Android SDK

```bash
# Remove Android SDK
rm -rf ~/Android/Sdk

# Remove Android Studio
# Use system uninstall tool
```

### Remove Project

```bash
# Remove project directory
rm -rf railgun-vault-wallet
```

---

**Installation complete! Start developing!** 🚀

Next: Read [QUICK_START.md](QUICK_START.md) for quick setup.
