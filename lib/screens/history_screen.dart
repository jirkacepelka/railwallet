import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/vault_service.dart';
import '../theme/app_theme.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction History'),
        elevation: 0,
      ),
      body: Consumer<RailgunVaultProvider>(
        builder: (context, provider, _) {
          if (provider.transactions.isEmpty) {
            return Center(
              child: Text(
                'No transactions yet',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: provider.transactions.length,
            itemBuilder: (context, index) {
              final tx = provider.transactions[index];
              return _buildTransactionTile(context, tx);
            },
          );
        },
      ),
    );
  }

  Widget _buildTransactionTile(BuildContext context, dynamic tx) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppTheme.secondaryBlack,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppTheme.darkGrey,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.diamond,
                color: AppTheme.primaryBlue,
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Ethereum',
                    style: TextStyle(
                      color: AppTheme.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    '${tx.amountETH.toStringAsFixed(4)} ETH',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '\$${tx.amountUSD.toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  '-\$0.32 (0.72%)',
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: AppTheme.redAccent,
                      ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
