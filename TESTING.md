# Testing Guide

Comprehensive testing guide for Railgun Vault Wallet.

## Test Types

### 1. Unit Tests

Test individual functions and classes in isolation.

**Location:** `test/utils/`, `test/models/`

**Example:**
```dart
test('validates correct Ethereum address', () {
  const validAddress = '0x1234567890123456789012345678901234567890';
  expect(AddressValidator.isValidEthereumAddress(validAddress), true);
});
```

**Run:**
```bash
flutter test test/utils/address_validator_test.dart
```

### 2. Widget Tests

Test UI components and their interactions.

**Location:** `test/widgets/`

**Example:**
```dart
testWidgets('renders button with label', (WidgetTester tester) async {
  await tester.pumpWidget(
    MaterialApp(
      home: Scaffold(
        body: CustomButton(
          label: 'Test Button',
          onPressed: () {},
        ),
      ),
    ),
  );

  expect(find.text('Test Button'), findsOneWidget);
});
```

**Run:**
```bash
flutter test test/widgets/custom_button_test.dart
```

### 3. Integration Tests

Test complete user flows and app interactions.

**Location:** `integration_test/`

**Example:**
```dart
testWidgets('complete send transaction flow', (WidgetTester tester) async {
  // Setup
  await tester.pumpWidget(const RailgunVaultApp());
  
  // Tap Send button
  await tester.tap(find.byIcon(Icons.send));
  await tester.pumpAndSettle();
  
  // Enter recipient
  await tester.enterText(find.byType(TextField).first, '0x...');
  
  // Enter amount
  await tester.enterText(find.byType(TextField).last, '0.1');
  
  // Tap Send
  await tester.tap(find.text('Swap'));
  await tester.pumpAndSettle();
  
  // Verify success
  expect(find.text('Transaction sent'), findsOneWidget);
});
```

**Run:**
```bash
flutter test integration_test/app_test.dart
```

## Running Tests

### All Tests

```bash
flutter test
```

### Specific Test File

```bash
flutter test test/utils/address_validator_test.dart
```

### Tests Matching Pattern

```bash
flutter test --name "AddressValidator"
```

### With Coverage

```bash
flutter test --coverage
```

### Watch Mode

```bash
flutter test --watch
```

## Test Coverage

### Generate Coverage Report

```bash
flutter test --coverage
```

### View Coverage

```bash
# Install lcov
brew install lcov

# Generate HTML report
genhtml coverage/lcov.info -o coverage/html

# Open report
open coverage/html/index.html
```

### Coverage Goals

- Utilities: 90%+
- Models: 85%+
- Services: 80%+
- Widgets: 75%+
- Screens: 60%+

## Mocking

### Mock Services

```dart
class MockRailgunVaultProvider extends Mock implements RailgunVaultProvider {}

void main() {
  group('HomeScreen', () {
    late MockRailgunVaultProvider mockProvider;

    setUp(() {
      mockProvider = MockRailgunVaultProvider();
      when(mockProvider.balanceETH).thenReturn(1.5);
      when(mockProvider.balanceUSD).thenReturn(2500.0);
    });

    testWidgets('displays balance', (WidgetTester tester) async {
      await tester.pumpWidget(
        ChangeNotifierProvider<RailgunVaultProvider>.value(
          value: mockProvider,
          child: const MaterialApp(home: HomeScreen()),
        ),
      );

      expect(find.text('\$2500.00'), findsOneWidget);
    });
  });
}
```

### Mock HTTP Requests

```dart
import 'package:http/testing.dart';

void main() {
  test('fetches ETH price', () async {
    final client = MockClient((request) async {
      return http.Response('{"ethereum":{"usd":2500}}', 200);
    });

    // Use client in your code
  });
}
```

## Test Organization

### File Structure

```
test/
├── utils/
│   ├── address_validator_test.dart
│   └── number_formatter_test.dart
├── models/
│   └── transaction_model_test.dart
├── services/
│   ├── vault_service_test.dart
│   └── storage_service_test.dart
├── widgets/
│   ├── custom_button_test.dart
│   ├── transaction_tile_test.dart
│   └── balance_card_test.dart
└── screens/
    ├── home_screen_test.dart
    ├── send_screen_test.dart
    └── receive_screen_test.dart

integration_test/
└── app_test.dart
```

## Best Practices

### 1. Test Naming

```dart
// Good
test('validates correct Ethereum address', () {});
test('rejects invalid address - too short', () {});
test('formats address with 0x prefix', () {});

// Bad
test('test address', () {});
test('address validation', () {});
```

### 2. Arrange-Act-Assert

```dart
test('sends transaction successfully', () {
  // Arrange
  const recipient = '0x...';
  const amount = 0.1;
  
  // Act
  final result = provider.sendToWallet(recipient, amount);
  
  // Assert
  expect(result, isNotNull);
});
```

### 3. One Assertion Per Test

```dart
// Good
test('validates address format', () {
  expect(AddressValidator.isValidEthereumAddress('0x...'), true);
});

test('rejects short address', () {
  expect(AddressValidator.isValidEthereumAddress('0x123'), false);
});

// Avoid
test('validates address', () {
  expect(AddressValidator.isValidEthereumAddress('0x...'), true);
  expect(AddressValidator.isValidEthereumAddress('0x123'), false);
});
```

### 4. Use Descriptive Matchers

```dart
// Good
expect(balance, greaterThan(0));
expect(address, matches(RegExp(r'^0x[0-9a-f]{40}$')));
expect(transactions, isNotEmpty);

// Avoid
expect(balance > 0, true);
expect(address.length, 42);
expect(transactions.length > 0, true);
```

## Continuous Integration

### GitHub Actions

Tests run automatically on:
- Push to main branch
- Pull requests
- Scheduled daily

**Workflow:** `.github/workflows/build-apk.yml`

### Local Pre-commit

```bash
#!/bin/bash
# .git/hooks/pre-commit

flutter test
if [ $? -ne 0 ]; then
  echo "Tests failed. Commit aborted."
  exit 1
fi
```

## Debugging Tests

### Print Debugging

```dart
test('debug test', () {
  print('Debug message');
  debugPrint('Debug print');
});
```

### Run with Verbose Output

```bash
flutter test -v
```

### Run Single Test

```bash
flutter test test/utils/address_validator_test.dart -v
```

### Use Debugger

```dart
test('debug with breakpoint', () {
  debugger(); // Breakpoint here
  // Test code
});
```

## Performance Testing

### Benchmark Tests

```dart
void main() {
  benchmark('address validation', () {
    for (int i = 0; i < 1000; i++) {
      AddressValidator.isValidEthereumAddress('0x...');
    }
  });
}
```

### Memory Profiling

```bash
flutter test --profile
```

## Test Checklist

- [ ] Unit tests for utilities
- [ ] Unit tests for models
- [ ] Widget tests for components
- [ ] Widget tests for screens
- [ ] Integration tests for flows
- [ ] Mock external services
- [ ] Test error scenarios
- [ ] Test edge cases
- [ ] Achieve 80%+ coverage
- [ ] All tests passing

## Resources

- [Flutter Testing](https://flutter.dev/docs/testing)
- [Mockito](https://pub.dev/packages/mockito)
- [Integration Testing](https://flutter.dev/docs/testing/integration-tests)
- [Test Best Practices](https://flutter.dev/docs/testing/best-practices)

## Support

For testing questions:
- Check Flutter documentation
- Review existing tests
- Open GitHub issue
- Ask in discussions
