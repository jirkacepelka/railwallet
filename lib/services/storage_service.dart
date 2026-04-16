import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/transaction_model.dart';

class StorageService {
  static const String _userAddressKey = 'user_address';
  static const String _transactionsKey = 'transactions';

  Future<void> saveUserAddress(String address) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userAddressKey, address);
  }

  Future<String?> getUserAddress() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userAddressKey);
  }

  Future<void> saveTransactions(List<Transaction> transactions) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = transactions.map((tx) => jsonEncode(tx.toJson())).toList();
    await prefs.setStringList(_transactionsKey, jsonList);
  }

  Future<List<Transaction>> getTransactions() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = prefs.getStringList(_transactionsKey) ?? [];
    return jsonList
        .map((json) => Transaction.fromJson(jsonDecode(json)))
        .toList();
  }

  Future<void> clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
