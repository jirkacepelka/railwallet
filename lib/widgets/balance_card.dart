import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class BalanceCard extends StatelessWidget {
  final double balanceUSD;
  final double balanceETH;
  final double percentageChange;

  const BalanceCard({
    Key? key,
    required this.balanceUSD,
    required this.balanceETH,
    required this.percentageChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isPositive = percentageChange >= 0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '\$${balanceUSD.toStringAsFixed(2)}',
          style: Theme.of(context).textTheme.displayLarge,
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${balanceETH.toStringAsFixed(4)} ETH',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(width: 12),
            Text(
              '${isPositive ? '+' : ''}\$${percentageChange.abs().toStringAsFixed(2)} (${percentageChange.toStringAsFixed(2)}%)',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: isPositive ? AppTheme.greenAccent : AppTheme.redAccent,
                  ),
            ),
          ],
        ),
      ],
    );
  }
}
