# Railgun Vault Wallet

A Flutter-based privacy-focused wallet for Arbitrum L2 using Railgun Vault contracts.

## Features

- **Railgun-Only Vault**: Direct communication with Railgun Vault smart contracts on Arbitrum One
- **Dark Mode UI**: Privacy-focused dark theme with blue accents
- **QR Code Support**: Generate and scan QR codes for receiving funds
- **Transaction History**: Track all vault transfers
- **Secure Storage**: Local storage of transaction history using SharedPreferences

## Technical Stack

- **Framework**: Flutter 3.x+
- **Blockchain**: Arbitrum One (Chain ID: 42161)
- **Smart Contract**: Railgun Vault ETH
- **Web3 Integration**: web3dart
- **QR Code**: qr_flutter

## Setup Instructions

### Step 1: Clone Repository

```bash
git clone https://github.com/yourusername/railgun-vault-wallet.git
cd railgun-vault-wallet
```

### Step 2: Install Dependencies

```bash
flutter pub get
```

### Step 3: Configure Environment

Create a `.env` file in the project root:

```env
ALCHEMY_API_KEY=your_alchemy_api_key
INFURA_API_KEY=your_infura_api_key
```

Get your API keys from:
- [Alchemy](https://www.alchemy.com/)
- [Infura](https://infura.io/)

### Step 4: Run the App

```bash
flutter run
```

### Step 5: Build APK Release

```bash
flutter build apk --release
```

The APK will be generated at: `build/app/outputs/apk/release/app-release.apk`

## Project Structure

```
lib/
├── main.dart                 # App entry point
├── theme/
│   └── app_theme.dart       # Dark theme configuration
├── constants/
│   └── blockchain_constants.dart  # Blockchain settings
├── models/
│   └── transaction_model.dart     # Transaction data model
├── services/
│   ├── vault_service.dart   # Railgun Vault provider
│   └── storage_service.dart # Local storage
└── screens/
    ├── home_screen.dart     # Main wallet screen
    ├── send_screen.dart     # Send transaction modal
    ├── receive_screen.dart  # Receive QR code modal
    ├── history_screen.dart  # Transaction history
    └── settings_screen.dart # Settings
```

## Security Warnings

⚠️ **IMPORTANT SECURITY NOTES:**

1. **Never share your private keys** - This wallet stores addresses locally only
2. **Never expose API keys** - Keep `.env` file private and never commit it to version control
3. **Verify addresses** - Always double-check recipient addresses before sending
4. **Test on testnet first** - Use Arbitrum Sepolia testnet before mainnet transactions
5. **Backup your wallet** - Keep secure backups of your wallet information

## Blockchain Configuration

### Arbitrum One

- **RPC URL**: `https://arb1.arbitrum.io/rpc`
- **Chain ID**: 42161
- **Vault Contract**: See `lib/constants/blockchain_constants.dart`

## API Integration

The app uses:
- **CoinGecko API** (free): For ETH/USD price conversion
- **Arbitrum RPC**: For blockchain interactions

## Building for Production

### Android Release Build

```bash
# Build signed APK
flutter build apk --release

# Build App Bundle (for Google Play)
flutter build appbundle --release
```

### iOS Build (if needed)

```bash
flutter build ios --release
```

## Troubleshooting

### Issue: "Flutter SDK not found"
- Ensure Flutter is installed and added to PATH
- Run `flutter doctor` to verify installation

### Issue: "Web3dart connection error"
- Check internet connection
- Verify RPC URL in `blockchain_constants.dart`
- Ensure API keys are valid in `.env`

### Issue: "QR code not displaying"
- Ensure `qr_flutter` package is properly installed
- Run `flutter pub get` again

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit changes (`git commit -m 'Add amazing feature'`)
4. Push to branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see LICENSE file for details.

## Support

For issues and questions:
- Open an issue on GitHub
- Check existing documentation
- Review blockchain constants for configuration

## Disclaimer

This wallet is provided as-is for educational and development purposes. Users are responsible for:
- Securing their own private keys
- Verifying all transactions before sending
- Understanding the risks of blockchain transactions
- Complying with local regulations

**Always test on testnet before using with real funds.**
