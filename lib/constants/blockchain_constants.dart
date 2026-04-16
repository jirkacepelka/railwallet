class BlockchainConstants {
  // Arbitrum One RPC
  static const String ARBITRUM_RPC_URL = 'https://arb1.arbitrum.io/rpc';
  
  // Railgun Vault Contract Address on Arbitrum
  static const String RAILGUN_VAULT_ADDRESS = '0x9E8F0A0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D';
  
  // Vault ABI (simplified for transfer operations)
  static const String VAULT_ABI = '''[
    {
      "constant": false,
      "inputs": [
        {"name": "to", "type": "address"},
        {"name": "amount", "type": "uint256"}
      ],
      "name": "transfer",
      "outputs": [{"name": "", "type": "bool"}],
      "type": "function"
    },
    {
      "constant": true,
      "inputs": [{"name": "account", "type": "address"}],
      "name": "balanceOf",
      "outputs": [{"name": "", "type": "uint256"}],
      "type": "function"
    },
    {
      "constant": true,
      "inputs": [],
      "name": "decimals",
      "outputs": [{"name": "", "type": "uint8"}],
      "type": "function"
    }
  ]''';

  // ETH Price API (using CoinGecko free API)
  static const String ETH_PRICE_API = 'https://api.coingecko.com/api/v3/simple/price?ids=ethereum&vs_currencies=usd';
  
  // Chain ID for Arbitrum One
  static const int ARBITRUM_CHAIN_ID = 42161;
}
