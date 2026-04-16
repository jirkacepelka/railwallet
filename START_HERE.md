# 🚀 START HERE

Welcome to Railgun Vault Wallet! This is your entry point.

## What is This?

A complete Flutter application for managing Railgun Vault on Arbitrum L2.

**Features:**
- 🔐 Privacy-focused dark mode UI
- 💰 Send and receive ETH
- 📊 Transaction history
- 🎯 QR code support
- ⚡ Real-time price updates

## Quick Start (5 minutes)

### 1. Prerequisites

- Flutter 3.x+ installed
- Android SDK
- Git

### 2. Clone & Setup

```bash
git clone https://github.com/yourusername/railgun-vault-wallet.git
cd railgun-vault-wallet
flutter pub get
cp .env.example .env
# Edit .env with your API keys
```

### 3. Run

```bash
flutter run
```

**Done!** App is running on your device.

## What's Next?

### 👤 I'm a User
→ Download APK from [Releases](https://github.com/yourusername/railgun-vault-wallet/releases)

### 👨‍💻 I'm a Developer
→ Read [QUICK_START.md](QUICK_START.md) (5 min)

### 🏗️ I'm Contributing
→ Read [CONTRIBUTING.md](CONTRIBUTING.md)

### 🚀 I'm Deploying
→ Read [DEPLOYMENT.md](DEPLOYMENT.md)

### 📚 I Want Full Docs
→ Read [DOCUMENTATION_INDEX.md](DOCUMENTATION_INDEX.md)

## Project Structure

```
lib/
├── main.dart              # App entry
├── screens/               # UI screens
├── services/              # Blockchain logic
├── models/                # Data models
├── widgets/               # Reusable components
├── utils/                 # Utilities
└── theme/                 # Dark theme

android/                   # Android config
test/                      # Tests
.github/workflows/         # CI/CD
```

## Key Files

| File | Purpose |
|------|---------|
| `pubspec.yaml` | Dependencies |
| `.env.example` | Environment template |
| `lib/main.dart` | App entry point |
| `lib/services/vault_service.dart` | Blockchain logic |
| `README.md` | Full documentation |

## Common Tasks

### Run App
```bash
flutter run
```

### Build APK
```bash
flutter build apk --release
```

### Run Tests
```bash
flutter test
```

### Format Code
```bash
dart format lib/
```

### Check Quality
```bash
flutter analyze
```

## Documentation

| Document | Purpose |
|----------|---------|
| [README.md](README.md) | Full documentation |
| [QUICK_START.md](QUICK_START.md) | 5-minute setup |
| [INSTALLATION_GUIDE.md](INSTALLATION_GUIDE.md) | Detailed setup |
| [ARCHITECTURE.md](ARCHITECTURE.md) | Code structure |
| [DEPLOYMENT.md](DEPLOYMENT.md) | Build & release |
| [SECURITY.md](SECURITY.md) | Security guidelines |
| [CONTRIBUTING.md](CONTRIBUTING.md) | Contributing guide |
| [TESTING.md](TESTING.md) | Testing guide |
| [DOCUMENTATION_INDEX.md](DOCUMENTATION_INDEX.md) | All docs |

## Technology Stack

- **Framework:** Flutter 3.x+
- **Blockchain:** web3dart
- **Network:** Arbitrum One
- **State:** Provider
- **Storage:** SharedPreferences
- **QR:** qr_flutter

## Features

✅ Home screen with balance
✅ Send transaction modal
✅ Receive QR code
✅ Transaction history
✅ Settings screen
✅ Dark mode theme
✅ Address validation
✅ Local storage
✅ Error handling
✅ Loading states

## Security

⚠️ **Important:**
- No private key storage
- Never share API keys
- Test on testnet first
- Verify addresses carefully

See [SECURITY.md](SECURITY.md) for details.

## Troubleshooting

### "Flutter not found"
```bash
export PATH="$PATH:~/flutter/bin"
```

### "No devices"
```bash
flutter emulators --launch <emulator_name>
```

### "Build fails"
```bash
flutter clean
flutter pub get
flutter run
```

See [INSTALLATION_GUIDE.md](INSTALLATION_GUIDE.md) for more.

## Support

- 📖 [Documentation](DOCUMENTATION_INDEX.md)
- 🐛 [Report Issues](https://github.com/yourusername/railgun-vault-wallet/issues)
- 💬 [Discussions](https://github.com/yourusername/railgun-vault-wallet/discussions)
- 🔒 [Security](SECURITY.md)

## Next Steps

1. **Choose your path:**
   - User? → Download APK
   - Developer? → [QUICK_START.md](QUICK_START.md)
   - Contributor? → [CONTRIBUTING.md](CONTRIBUTING.md)
   - DevOps? → [DEPLOYMENT.md](DEPLOYMENT.md)

2. **Read relevant docs**

3. **Get started!**

## Quick Links

- [GitHub Repository](https://github.com/yourusername/railgun-vault-wallet)
- [Flutter Docs](https://flutter.dev)
- [Arbitrum Docs](https://docs.arbitrum.io/)
- [Railgun Docs](https://docs.railgun.io/)

---

## 🎯 Choose Your Path

### 👤 User
```
1. Download APK from Releases
2. Install on Android device
3. Add your Railgun address
4. Start using!
```

### 👨‍💻 Developer
```
1. Read QUICK_START.md (5 min)
2. Clone repository
3. Run flutter run
4. Explore code
5. Make changes
```

### 🤝 Contributor
```
1. Read CONTRIBUTING.md
2. Fork repository
3. Create feature branch
4. Make changes
5. Submit pull request
```

### 🚀 DevOps
```
1. Read DEPLOYMENT.md
2. Read GITHUB_SETUP.md
3. Setup GitHub Actions
4. Build APK
5. Create release
```

---

**Ready? Pick your path above and get started!** 🚀

**Questions?** Check [DOCUMENTATION_INDEX.md](DOCUMENTATION_INDEX.md)
