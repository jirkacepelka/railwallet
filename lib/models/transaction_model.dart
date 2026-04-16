import 'package:intl/intl.dart';

class Transaction {
  final String id;
  final String fromAddress;
  final String toAddress;
  final double amountETH;
  final double amountUSD;
  final DateTime timestamp;
  final TransactionStatus status;
  final String? txHash;

  Transaction({
    required this.id,
    required this.fromAddress,
    required this.toAddress,
    required this.amountETH,
    required this.amountUSD,
    required this.timestamp,
    required this.status,
    this.txHash,
  });

  String get formattedDate {
    return DateFormat('MMM dd, yyyy HH:mm').format(timestamp);
  }

  String get shortAddress {
    if (toAddress.length < 10) return toAddress;
    return '${toAddress.substring(0, 6)}...${toAddress.substring(toAddress.length - 4)}';
  }

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['id'] as String,
      fromAddress: json['fromAddress'] as String,
      toAddress: json['toAddress'] as String,
      amountETH: (json['amountETH'] as num).toDouble(),
      amountUSD: (json['amountUSD'] as num).toDouble(),
      timestamp: DateTime.parse(json['timestamp'] as String),
      status: TransactionStatus.values.firstWhere(
        (e) => e.toString() == 'TransactionStatus.${json['status']}',
        orElse: () => TransactionStatus.pending,
      ),
      txHash: json['txHash'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fromAddress': fromAddress,
      'toAddress': toAddress,
      'amountETH': amountETH,
      'amountUSD': amountUSD,
      'timestamp': timestamp.toIso8601String(),
      'status': status.toString().split('.').last,
      'txHash': txHash,
    };
  }
}

enum TransactionStatus {
  pending,
  confirmed,
  failed,
}
