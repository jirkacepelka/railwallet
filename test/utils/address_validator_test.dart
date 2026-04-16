import 'package:flutter_test/flutter_test.dart';
import 'package:railgun_vault_wallet/utils/address_validator.dart';

void main() {
  group('AddressValidator', () {
    test('validates correct Ethereum address', () {
      const validAddress = '0x1234567890123456789012345678901234567890';
      expect(AddressValidator.isValidEthereumAddress(validAddress), true);
    });

    test('validates address without 0x prefix', () {
      const validAddress = '1234567890123456789012345678901234567890';
      expect(AddressValidator.isValidEthereumAddress(validAddress), true);
    });

    test('rejects invalid address - too short', () {
      const invalidAddress = '0x123';
      expect(AddressValidator.isValidEthereumAddress(invalidAddress), false);
    });

    test('rejects invalid address - invalid characters', () {
      const invalidAddress = '0xZZZZ567890123456789012345678901234567890';
      expect(AddressValidator.isValidEthereumAddress(invalidAddress), false);
    });

    test('rejects empty address', () {
      expect(AddressValidator.isValidEthereumAddress(''), false);
    });

    test('formats address with 0x prefix', () {
      const address = '1234567890123456789012345678901234567890';
      final formatted = AddressValidator.formatAddress(address);
      expect(formatted, '0x1234567890123456789012345678901234567890');
    });

    test('shortens address correctly', () {
      const address = '0x1234567890123456789012345678901234567890';
      final shortened = AddressValidator.shortenAddress(address);
      expect(shortened, '0x1234...7890');
    });

    test('throws error for invalid address format', () {
      const invalidAddress = '0xZZZZ';
      expect(
        () => AddressValidator.formatAddress(invalidAddress),
        throwsArgumentError,
      );
    });
  });
}
