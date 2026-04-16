import 'package:flutter/foundation.dart';
import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../constants/blockchain_constants.dart';
import '../models/transaction_model.dart';
import 'storage_service.dart';

class RailgunVaultProvider extends ChangeNotifier {
  late Web3Client _web3client;
  late StorageService _storageService;
  
  String? _userAddress;
  double _balanceETH = 0.0;
  double _ethPriceUSD = 0.0;
  List<Transaction> _transactions = [];
  bool _isLoading = false;

  RailgunVaultProvider() {
    _initialize();
  }

  Future<void> _initialize() async {
    _web3client = Web3Client(
      BlockchainConstants.ARBITRUM_RPC_URL,
      http.Client(),
    );
    _storageService = StorageService();
    await _loadStoredData();
    await _fetchETHPrice();
  }

  // Getters
  String? get userAddress => _userAddress;
  double get balanceETH => _balanceETH;
  double get ethPriceUSD => _ethPriceUSD;
  double get balanceUSD => _balanceETH * _ethPriceUSD;
  List<Transaction> get transactions => _transactions;
  bool get isLoading => _isLoading;

  Future<void> _loadStoredData() async {
    _userAddress = await _storageService.getUserAddress();
    _transactions = await _storageService.getTransactions();
    notifyListeners();
  }

  Future<void> setUserAddress(String address) async {
    _userAddress = address;
    await _storageService.saveUserAddress(address);
    await getBalance(address);
    notifyListeners();
  }

  Future<void> getBalance(String address) async {
    try {
      _isLoading = true;
      notifyListeners();

      final vaultAddress = EthereumAddress.fromHex(
        BlockchainConstants.RAILGUN_VAULT_ADDRESS,
      );
      final userAddr = EthereumAddress.fromHex(address);

      final contract = DeployedContract(
        ContractAbi.fromJson(
          BlockchainConstants.VAULT_ABI,
          'RailgunVault',
        ),
        vaultAddress,
      );

      final balanceFunction = contract.function('balanceOf');
      final result = await _web3client.call(
        contract: contract,
        function: balanceFunction,
        params: [userAddr],
      );

      if (result.isNotEmpty) {
        final balance = result[0] as BigInt;
        _balanceETH = double.parse(
          balance.toString(),
        ) /
            1e18;
      }

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      rethrow;
    }
  }

  Future<String?> sendToWallet(
    String toAddress,
    double amountETH,
  ) async {
    try {
      if (_userAddress == null) {
        throw Exception('User address not set');
      }

      _isLoading = true;
      notifyListeners();

      final vaultAddress = EthereumAddress.fromHex(
        BlockchainConstants.RAILGUN_VAULT_ADDRESS,
      );
      final recipient = EthereumAddress.fromHex(toAddress);

      final contract = DeployedContract(
        ContractAbi.fromJson(
          BlockchainConstants.VAULT_ABI,
          'RailgunVault',
        ),
        vaultAddress,
      );

      final transferFunction = contract.function('transfer');
      final amountWei = BigInt.from(amountETH * 1e18);

      // Note: In production, you would sign this transaction with the user's private key
      // This is a placeholder for the transaction creation
      final txHash = _generateMockTxHash();

      // Create transaction record
      final transaction = Transaction(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        fromAddress: _userAddress!,
        toAddress: toAddress,
        amountETH: amountETH,
        amountUSD: amountETH * _ethPriceUSD,
        timestamp: DateTime.now(),
        status: TransactionStatus.pending,
        txHash: txHash,
      );

      _transactions.insert(0, transaction);
      await _storageService.saveTransactions(_transactions);

      _isLoading = false;
      notifyListeners();

      return txHash;
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      rethrow;
    }
  }

  Future<void> _fetchETHPrice() async {
    try {
      final response = await http.get(
        Uri.parse(BlockchainConstants.ETH_PRICE_API),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _ethPriceUSD = (data['ethereum']['usd'] as num).toDouble();
        notifyListeners();
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching ETH price: $e');
      }
    }
  }

  String _generateMockTxHash() {
    return '0x${DateTime.now().millisecondsSinceEpoch.toRadixString(16).padLeft(64, '0')}';
  }

  Future<void> updateTransactionStatus(
    String txId,
    TransactionStatus status,
  ) async {
    final index = _transactions.indexWhere((tx) => tx.id == txId);
    if (index != -1) {
      final updatedTx = Transaction(
        id: _transactions[index].id,
        fromAddress: _transactions[index].fromAddress,
        toAddress: _transactions[index].toAddress,
        amountETH: _transactions[index].amountETH,
        amountUSD: _transactions[index].amountUSD,
        timestamp: _transactions[index].timestamp,
        status: status,
        txHash: _transactions[index].txHash,
      );
      _transactions[index] = updatedTx;
      await _storageService.saveTransactions(_transactions);
      notifyListeners();
    }
  }
}
