# Railgun Vault Wallet v1.0.0

## 🎉 Initial Release

Complete Flutter application for Railgun Vault on Arbitrum L2.

## ✨ Features

### Core Features
- 🔐 **Railgun Vault Integration** - Direct communication with Railgun Vault smart contracts
- 💰 **Send ETH** - Send transactions through Railgun Vault with numeric keypad
- 📥 **Receive ETH** - Generate QR codes for receiving funds
- 📊 **Transaction History** - Track all vault transfers
- 🌙 **Dark Mode UI** - Privacy-focused dark theme with blue accents
- 💵 **Real-time Prices** - ETH/USD conversion with live updates

### Security
- ✅ No private key storage
- ✅ Address validation
- ✅ Input sanitization
- ✅ Secure local storage
- ✅ Environment variable support

### Developer Features
- ✅ Comprehensive documentation (14 guides)
- ✅ Unit and widget tests
- ✅ CI/CD pipeline with GitHub Actions
- ✅ Code formatting and linting
- ✅ Architecture documentation

## 📱 Installation

### For Users
1. Download `app-release.apk` from this release
2. Enable "Unknown Sources" in Android settings
3. Install APK on your Android device (API 21+)
4. Launch app and add your Railgun address

### For Developers
```bash
# Clone repository
git clone https://github.com/jirkacepelka/railwallet.git
cd railwallet

# Install dependencies
flutter pub get

# Configure environment
cp .env.example .env
# Edit .env with your API keys

# Run app
flutter run
```

## 🔧 Technology Stack

- **Framework:** Flutter 3.x+
- **Blockchain:** web3dart
- **Network:** Arbitrum One (Chain ID: 42161)
- **State Management:** Provider
- **Storage:** SharedPreferences
- **QR Code:** qr_flutter

## 📚 Documentation

- **[START_HERE.md](START_HERE.md)** - Quick entry point
- **[README.md](README.md)** - Complete documentation
- **[QUICK_START.md](QUICK_START.md)** - 5-minute setup
- **[INSTALLATION_GUIDE.md](INSTALLATION_GUIDE.md)** - Detailed setup
- **[ARCHITECTURE.md](ARCHITECTURE.md)** - Technical details
- **[SECURITY.md](SECURITY.md)** - Security guidelines
- **[DEPLOYMENT.md](DEPLOYMENT.md)** - Build & release guide

## ⚠️ Important Notes

### Security
- **Never share your private keys**
- **Never commit .env file to git**
- **Test on testnet first**
- **Verify addresses carefully before sending**

### Network
- **Arbitrum One mainnet** by default
- **Chain ID:** 42161
- **RPC:** https://arb1.arbitrum.io/rpc

### Requirements
- **Android:** 5.0+ (API 21)
- **Internet:** Required for blockchain operations
- **Storage:** ~60 MB for APK

## 🐛 Known Issues

None at this time. Please report issues on GitHub.

## 🚀 What's Next

### Planned Features
- ENS name resolution
- Multi-chain support
- Advanced analytics
- Biometric authentication
- Hardware wallet support

### Roadmap
- v1.1.0 - ENS support
- v1.2.0 - Multi-chain
- v2.0.0 - iOS support

## 📞 Support

- **Issues:** [GitHub Issues](https://github.com/jirkacepelka/railwallet/issues)
- **Discussions:** [GitHub Discussions](https://github.com/jirkacepelka/railwallet/discussions)
- **Documentation:** See README.md
- **Security:** See SECURITY.md

## 📄 License

MIT License - See LICENSE file

## 🙏 Credits

Built with:
- Flutter framework
- web3dart library
- Arbitrum network
- Railgun protocol

---

**Ready to use!** Download APK and get started. 🎉

For detailed setup instructions, see [QUICK_START.md](QUICK_START.md).
