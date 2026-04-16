# Quick Start Guide

Get the Railgun Vault Wallet running in 5 minutes.

## Prerequisites

- Flutter SDK 3.x+ ([Install](https://flutter.dev/docs/get-started/install))
- Android SDK with API 34
- Git

## Installation

### 1. Clone Repository

```bash
git clone https://github.com/yourusername/railgun-vault-wallet.git
cd railgun-vault-wallet
```

### 2. Install Dependencies

```bash
flutter pub get
```

### 3. Configure Environment

Create `.env` file:

```bash
cp .env.example .env
```

Edit `.env` and add your API keys:

```env
ALCHEMY_API_KEY=your_key_here
INFURA_API_KEY=your_key_here
```

Get free API keys from:
- [Alchemy](https://www.alchemy.com/)
- [Infura](https://infura.io/)

### 4. Run App

```bash
flutter run
```

Or on specific device:

```bash
flutter run -d <device_id>
```

## First Steps

### 1. View Your Address

- App opens to Home screen
- Your Railgun address shown at top
- Copy address with icon

### 2. Receive Funds

- Tap "Request" button
- Show QR code to sender
- Or copy address manually

### 3. Send Funds

- Tap "Send" button
- Enter recipient address
- Enter amount
- Tap "Swap" to send

### 4. Check History

- Tap "History" tab
- View all transactions
- See amounts and dates

## Common Tasks

### Build APK

```bash
flutter build apk --release
```

APK location: `build/app/outputs/apk/release/app-release.apk`

### Run Tests

```bash
flutter test
```

### Check Code Quality

```bash
flutter analyze
```

### Format Code

```bash
dart format lib/
```

## Troubleshooting

### "Flutter SDK not found"

```bash
# Add Flutter to PATH
export PATH="$PATH:~/flutter/bin"

# Verify installation
flutter doctor
```

### "Android SDK not found"

```bash
# Set Android SDK path
export ANDROID_SDK_ROOT=~/Android/Sdk
export PATH="$PATH:$ANDROID_SDK_ROOT/tools/bin"
```

### "No connected devices"

```bash
# List available devices
flutter devices

# Run on emulator
flutter emulators --launch <emulator_name>
```

### "Build fails"

```bash
# Clean and rebuild
flutter clean
flutter pub get
flutter run
```

## Next Steps

1. **Read Documentation**
   - [README.md](README.md) - Full documentation
   - [ARCHITECTURE.md](ARCHITECTURE.md) - Technical details
   - [SECURITY.md](SECURITY.md) - Security guidelines

2. **Explore Code**
   - Check `lib/screens/` for UI
   - Check `lib/services/` for logic
   - Check `lib/models/` for data

3. **Customize**
   - Update colors in `lib/theme/app_theme.dart`
   - Update contract address in `lib/constants/blockchain_constants.dart`
   - Add your branding

4. **Deploy**
   - Follow [DEPLOYMENT.md](DEPLOYMENT.md)
   - Build release APK
   - Distribute to users

## Important Notes

⚠️ **Security:**
- Never commit `.env` file
- Never share private keys
- Test on testnet first
- Verify addresses carefully

⚠️ **Blockchain:**
- Arbitrum One mainnet by default
- Check contract address
- Verify gas prices
- Monitor network status

## Support

- 📖 [Documentation](README.md)
- 🐛 [Report Issues](https://github.com/yourusername/railgun-vault-wallet/issues)
- 💬 [Discussions](https://github.com/yourusername/railgun-vault-wallet/discussions)

## Resources

- [Flutter Docs](https://flutter.dev/docs)
- [Arbitrum Docs](https://docs.arbitrum.io/)
- [Web3dart Docs](https://pub.dev/packages/web3dart)
- [Railgun Docs](https://docs.railgun.io/)

Happy coding! 🚀
