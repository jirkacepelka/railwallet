class AddressValidator {
  static bool isValidEthereumAddress(String address) {
    if (address.isEmpty) return false;
    
    // Remove 0x prefix if present
    String cleanAddress = address.startsWith('0x') 
        ? address.substring(2) 
        : address;
    
    // Check if it's 40 hex characters
    if (cleanAddress.length != 40) return false;
    
    // Check if all characters are valid hex
    return RegExp(r'^[0-9a-fA-F]{40}$').hasMatch(cleanAddress);
  }

  static String formatAddress(String address) {
    if (!isValidEthereumAddress(address)) {
      throw ArgumentError('Invalid Ethereum address');
    }
    
    if (!address.startsWith('0x')) {
      return '0x$address';
    }
    return address;
  }

  static String shortenAddress(String address, {int prefixLength = 6, int suffixLength = 4}) {
    if (address.length < prefixLength + suffixLength) {
      return address;
    }
    return '${address.substring(0, prefixLength)}...${address.substring(address.length - suffixLength)}';
  }
}
