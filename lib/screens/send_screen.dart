import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/vault_service.dart';
import '../theme/app_theme.dart';

class SendScreen extends StatefulWidget {
  const SendScreen({Key? key}) : super(key: key);

  @override
  State<SendScreen> createState() => _SendScreenState();
}

class _SendScreenState extends State<SendScreen> {
  final _recipientController = TextEditingController();
  final _amountController = TextEditingController();
  bool _isLoading = false;
  bool _showDestinationModal = false;

  @override
  void dispose() {
    _recipientController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _addDigit(String digit) {
    setState(() {
      _amountController.text += digit;
    });
  }

  void _backspace() {
    setState(() {
      if (_amountController.text.isNotEmpty) {
        _amountController.text =
            _amountController.text.substring(0, _amountController.text.length - 1);
      }
    });
  }

  Future<void> _sendTransaction() async {
    if (_recipientController.text.isEmpty || _amountController.text.isEmpty) {
      _showErrorSnackBar('Please fill in all fields');
      return;
    }

    final amount = double.tryParse(_amountController.text);
    if (amount == null || amount <= 0) {
      _showErrorSnackBar('Invalid amount');
      return;
    }

    final provider = context.read<RailgunVaultProvider>();
    if (amount > provider.balanceETH) {
      _showErrorSnackBar('Insufficient balance');
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final txHash = await provider.sendToWallet(
        _recipientController.text,
        amount,
      );

      if (mounted) {
        _showSuccessSnackBar('Transaction sent: $txHash');
        Future.delayed(const Duration(seconds: 2), () {
          if (mounted) {
            Navigator.pop(context);
          }
        });
      }
    } catch (e) {
      if (mounted) {
        _showErrorSnackBar('Error: ${e.toString()}');
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppTheme.redAccent,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  void _showSuccessSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppTheme.greenAccent,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RailgunVaultProvider>(
      builder: (context, provider, _) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Handle bar
                Center(
                  child: Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: AppTheme.darkGrey,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Amount Input Section
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppTheme.darkGrey,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'USD |',
                                style: Theme.of(context).textTheme.displayMedium,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '${_amountController.text.isEmpty ? '0' : _amountController.text} ETH',
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                            ],
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: AppTheme.primaryBlue,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(
                              Icons.diamond,
                              color: AppTheme.white,
                              size: 28,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                // Send To Section
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppTheme.darkGrey,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Send to',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            _recipientController.text.isEmpty
                                ? 'Not selected'
                                : _shortenAddress(_recipientController.text),
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            _showDestinationModal = true;
                          });
                        },
                        child: const Text('Select >'),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Available Balance
                Text(
                  'USD ${provider.balanceUSD.toStringAsFixed(2)} available',
                  style: Theme.of(context).textTheme.labelSmall,
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 20),

                // Numeric Keypad
                GridView.count(
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  children: [
                    _buildKeypadButton('1'),
                    _buildKeypadButton('2'),
                    _buildKeypadButton('3'),
                    _buildKeypadButton('4'),
                    _buildKeypadButton('5'),
                    _buildKeypadButton('6'),
                    _buildKeypadButton('7'),
                    _buildKeypadButton('8'),
                    _buildKeypadButton('9'),
                    _buildKeypadButton('.'),
                    _buildKeypadButton('0'),
                    _buildBackspaceButton(),
                  ],
                ),

                const SizedBox(height: 24),

                // Swap Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _sendTransaction,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF00A8E8),
                      disabledBackgroundColor: AppTheme.darkGrey,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: _isLoading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                AppTheme.white,
                              ),
                            ),
                          )
                        : const Text('Swap'),
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildKeypadButton(String label) {
    return GestureDetector(
      onTap: () => _addDigit(label),
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.darkGrey,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              color: AppTheme.white,
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBackspaceButton() {
    return GestureDetector(
      onTap: _backspace,
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.darkGrey,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Center(
          child: Icon(
            Icons.backspace,
            color: AppTheme.white,
            size: 24,
          ),
        ),
      ),
    );
  }

  String _shortenAddress(String address) {
    if (address.length < 10) return address;
    return '${address.substring(0, 6)}...${address.substring(address.length - 4)}';
  }
}
