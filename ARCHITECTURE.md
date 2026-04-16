# Architecture Documentation

## Project Structure

```
railgun-vault-wallet/
├── lib/
│   ├── main.dart                    # App entry point
│   ├── theme/
│   │   └── app_theme.dart          # Dark theme configuration
│   ├── constants/
│   │   └── blockchain_constants.dart # Blockchain settings
│   ├── models/
│   │   └── transaction_model.dart   # Transaction data model
│   ├── services/
│   │   ├── vault_service.dart      # Railgun Vault provider
│   │   └── storage_service.dart    # Local storage
│   ├── screens/
│   │   ├── home_screen.dart        # Main wallet screen
│   │   ├── send_screen.dart        # Send transaction modal
│   │   ├── receive_screen.dart     # Receive QR code modal
│   │   ├── history_screen.dart     # Transaction history
│   │   └── settings_screen.dart    # Settings
│   ├── widgets/
│   │   ├── custom_button.dart      # Reusable button
│   │   ├── transaction_tile.dart   # Transaction list item
│   │   └── balance_card.dart       # Balance display
│   └── utils/
│       ├── address_validator.dart  # Address validation
│       └── number_formatter.dart   # Number formatting
├── android/
│   └── app/
│       ├── build.gradle            # Android build config
│       └── AndroidManifest.xml     # Android manifest
├── .github/
│   └── workflows/
│       └── build-apk.yml           # CI/CD pipeline
├── pubspec.yaml                    # Flutter dependencies
├── analysis_options.yaml           # Linting rules
├── .env                            # Environment variables
├── .gitignore                      # Git ignore rules
├── README.md                       # Project documentation
├── CONTRIBUTING.md                # Contributing guidelines
├── DEPLOYMENT.md                  # Deployment guide
├── SECURITY.md                    # Security policy
├── ARCHITECTURE.md                # This file
├── CHANGELOG.md                   # Version history
└── LICENSE                        # MIT License
```

## Design Patterns

### 1. Provider Pattern (State Management)

```dart
// RailgunVaultProvider extends ChangeNotifier
// Manages wallet state and blockchain interactions
// Notifies listeners of state changes
```

**Benefits:**
- Centralized state management
- Easy to test
- Reactive UI updates
- Minimal boilerplate

### 2. Service Layer

```dart
// Services handle business logic
// - RailgunVaultProvider: Blockchain operations
// - StorageService: Local data persistence
```

**Benefits:**
- Separation of concerns
- Reusable logic
- Easy to mock for testing
- Clear dependencies

### 3. Widget Composition

```dart
// Screens composed of reusable widgets
// - CustomButton
// - TransactionTile
// - BalanceCard
```

**Benefits:**
- DRY principle
- Consistent UI
- Easy to maintain
- Testable components

## Data Flow

### Transaction Flow

```
User Input (Send Screen)
    ↓
Validation (AddressValidator)
    ↓
RailgunVaultProvider.sendToWallet()
    ↓
Web3Client.call() → Vault Contract
    ↓
Transaction Created
    ↓
StorageService.saveTransactions()
    ↓
UI Updated (notifyListeners)
    ↓
History Screen Shows Transaction
```

### Balance Update Flow

```
App Start / User Refresh
    ↓
RailgunVaultProvider.getBalance()
    ↓
Web3Client.call() → Vault Contract
    ↓
Balance Retrieved
    ↓
ETH Price Fetched (CoinGecko API)
    ↓
USD Value Calculated
    ↓
UI Updated (notifyListeners)
    ↓
Home Screen Shows Balance
```

## Technology Stack

### Frontend
- **Framework**: Flutter 3.x+
- **State Management**: Provider
- **UI Components**: Material Design 3
- **QR Code**: qr_flutter

### Blockchain
- **Web3 Library**: web3dart
- **Network**: Arbitrum One (Chain ID: 42161)
- **RPC**: Arbitrum public RPC
- **Smart Contract**: Railgun Vault

### Storage
- **Local Storage**: SharedPreferences
- **Data Format**: JSON

### External APIs
- **Price Data**: CoinGecko (free)
- **Blockchain Data**: Arbitrum RPC

## Key Components

### 1. RailgunVaultProvider

**Responsibilities:**
- Manage wallet state
- Handle blockchain interactions
- Fetch balance and prices
- Create transactions
- Manage transaction history

**Key Methods:**
```dart
Future<void> setUserAddress(String address)
Future<void> getBalance(String address)
Future<String?> sendToWallet(String toAddress, double amountETH)
Future<void> updateTransactionStatus(String txId, TransactionStatus status)
```

### 2. StorageService

**Responsibilities:**
- Persist user data locally
- Manage transaction history
- Handle data serialization

**Key Methods:**
```dart
Future<void> saveUserAddress(String address)
Future<String?> getUserAddress()
Future<void> saveTransactions(List<Transaction> transactions)
Future<List<Transaction>> getTransactions()
```

### 3. Transaction Model

**Properties:**
```dart
String id                    // Unique transaction ID
String fromAddress          // Sender address
String toAddress            // Recipient address
double amountETH            // Amount in ETH
double amountUSD            // Amount in USD
DateTime timestamp          // Transaction time
TransactionStatus status    // pending/confirmed/failed
String? txHash              // Blockchain transaction hash
```

## UI Architecture

### Screen Hierarchy

```
MainNavigationScreen (Bottom Navigation)
├── HomeScreen
│   ├── Profile Header
│   ├── Balance Display
│   ├── Action Buttons
│   │   ├── Send → SendScreen (Modal)
│   │   └── Request → ReceiveScreen (Modal)
│   └── Transaction History
├── HistoryScreen
│   └── Transaction List
└── SettingsScreen
    ├── Account Info
    ├── Network Info
    └── About
```

### Modal Dialogs

**SendScreen Modal:**
- Amount input with numeric keypad
- Recipient selection
- Transaction confirmation

**ReceiveScreen Modal:**
- QR code display
- Address copy
- Railgun URI

## Security Architecture

### Key Security Features

1. **No Private Key Storage**
   - Addresses only
   - User manages keys externally

2. **Environment Variables**
   - API keys in .env
   - Not committed to git

3. **Input Validation**
   - Address validation
   - Amount validation
   - Network verification

4. **Secure Storage**
   - SharedPreferences for local data
   - No sensitive data stored

## Testing Strategy

### Unit Tests
```dart
// Test utilities
- AddressValidator
- NumberFormatter
- Transaction model
```

### Widget Tests
```dart
// Test UI components
- CustomButton
- TransactionTile
- BalanceCard
```

### Integration Tests
```dart
// Test full flows
- Send transaction flow
- Receive QR code flow
- History display
```

## Performance Considerations

### Optimization

1. **Lazy Loading**
   - Load transactions on demand
   - Cache balance data

2. **Efficient Rendering**
   - Use ListView.builder
   - Avoid rebuilds with Consumer

3. **Network Optimization**
   - Batch API calls
   - Cache responses
   - Implement retry logic

### Monitoring

- Track API response times
- Monitor memory usage
- Profile widget builds
- Check battery impact

## Scalability

### Future Enhancements

1. **Multi-Chain Support**
   - Add Ethereum mainnet
   - Add Polygon
   - Add other L2s

2. **Advanced Features**
   - ENS resolution
   - Token swaps
   - Staking
   - DeFi integration

3. **Performance**
   - Implement caching layer
   - Add background sync
   - Optimize database queries

## Deployment Architecture

### Build Pipeline

```
Source Code
    ↓
Flutter Build
    ↓
APK Generation
    ↓
Signing
    ↓
Distribution
```

### CI/CD

- GitHub Actions workflow
- Automated APK builds
- Release management
- Artifact storage

## Error Handling

### Strategy

1. **User-Facing Errors**
   - SnackBar notifications
   - Clear error messages
   - Suggested actions

2. **Logging**
   - Debug logs
   - Error tracking
   - Performance metrics

3. **Recovery**
   - Retry mechanisms
   - Fallback options
   - State restoration

## Documentation

### Code Documentation

- Inline comments for complex logic
- Function documentation
- Class documentation
- Example usage

### User Documentation

- README.md
- DEPLOYMENT.md
- SECURITY.md
- CONTRIBUTING.md

## Maintenance

### Regular Tasks

- Update dependencies
- Security patches
- Bug fixes
- Performance optimization

### Monitoring

- Error tracking
- Performance metrics
- User feedback
- Security alerts

## References

- [Flutter Architecture](https://flutter.dev/docs/development/architecture)
- [Provider Documentation](https://pub.dev/packages/provider)
- [Web3dart Documentation](https://pub.dev/packages/web3dart)
- [Arbitrum Documentation](https://docs.arbitrum.io/)
