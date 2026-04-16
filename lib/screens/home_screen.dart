import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/vault_service.dart';
import '../theme/app_theme.dart';
import 'receive_screen.dart';
import 'send_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeWallet();
    });
  }

  Future<void> _initializeWallet() async {
    final provider = context.read<RailgunVaultProvider>();
    if (provider.userAddress == null) {
      const mockAddress = '0x1234567890123456789012345678901234567890';
      await provider.setUserAddress(mockAddress);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<RailgunVaultProvider>(
        builder: (context, provider, _) {
          return SingleChildScrollView(
            child: Column(
              children: [
                // Custom AppBar with Profile
                Container(
                  color: AppTheme.secondaryBlack,
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: AppTheme.darkGrey,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(
                              Icons.person,
                              color: AppTheme.primaryBlue,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'PR*V4CY',
                                style: TextStyle(
                                  color: AppTheme.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              if (provider.userAddress != null)
                                Text(
                                  _shortenAddress(provider.userAddress!),
                                  style: const TextStyle(
                                    color: AppTheme.lightGrey,
                                    fontSize: 12,
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.qr_code_2),
                        color: AppTheme.primaryBlue,
                      ),
                    ],
                  ),
                ),

                // Main Content
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Balance in USD
                      Text(
                        '\$${provider.balanceUSD.toStringAsFixed(2)}',
                        style: Theme.of(context).textTheme.displayLarge,
                      ),

                      const SizedBox(height: 8),

                      // Balance in ETH and Change Percentage
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${provider.balanceETH.toStringAsFixed(4)} ETH',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          const SizedBox(width: 12),
                          Text(
                            '-\$0.32 (0.72%)',
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  color: AppTheme.redAccent,
                                ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 32),

                      // Action Buttons
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () {
                                showModalBottomSheet(
                                  context: context,
                                  backgroundColor: AppTheme.secondaryBlack,
                                  builder: (context) => const SendScreen(),
                                );
                              },
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(
                                  color: AppTheme.darkGrey,
                                ),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 14),
                              ),
                              child: const Text('Send'),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () {
                                showModalBottomSheet(
                                  context: context,
                                  backgroundColor: AppTheme.secondaryBlack,
                                  builder: (context) => const ReceiveScreen(),
                                );
                              },
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(
                                  color: AppTheme.darkGrey,
                                ),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 14),
                              ),
                              child: const Text('Request'),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 32),

                      // History Section
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'History',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Transaction List
                      if (provider.transactions.isEmpty)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 32.0),
                          child: Text(
                            'No transactions yet',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        )
                      else
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: provider.transactions.length,
                          itemBuilder: (context, index) {
                            final tx = provider.transactions[index];
                            return _buildTransactionTile(context, tx);
                          },
                        ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildTransactionTile(BuildContext context, dynamic tx) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
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
    );
  }

  String _shortenAddress(String address) {
    if (address.length < 10) return address;
    return '${address.substring(0, 6)}...${address.substring(address.length - 4)}';
  }
}
