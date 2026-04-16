import 'package:intl/intl.dart';

class NumberFormatter {
  static String formatCurrency(double amount, {String symbol = '\$', int decimals = 2}) {
    final formatter = NumberFormat.currency(
      symbol: symbol,
      decimalDigits: decimals,
    );
    return formatter.format(amount);
  }

  static String formatETH(double amount, {int decimals = 4}) {
    return '${amount.toStringAsFixed(decimals)} ETH';
  }

  static String formatPercentage(double percentage, {int decimals = 2}) {
    final sign = percentage >= 0 ? '+' : '';
    return '$sign${percentage.toStringAsFixed(decimals)}%';
  }

  static String formatLargeNumber(double number) {
    if (number >= 1000000) {
      return '${(number / 1000000).toStringAsFixed(2)}M';
    } else if (number >= 1000) {
      return '${(number / 1000).toStringAsFixed(2)}K';
    }
    return number.toStringAsFixed(2);
  }

  static double parseAmount(String input) {
    try {
      return double.parse(input);
    } catch (e) {
      return 0.0;
    }
  }
}
