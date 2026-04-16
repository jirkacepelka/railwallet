import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../services/vault_service.dart';
import '../theme/app_theme.dart';

class ReceiveScreen extends StatefulWidget {
  const ReceiveScreen({Key? key}) : super(key: key);

  @override
  State<ReceiveScreen> createState() => _ReceiveScreenState();
}

class _ReceiveScreenState extends State<ReceiveScreen> {
  bool _showQRCode = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<RailgunVaultProvider>(
      builder: (context, provider, _) {
        if (provider.userAddress == null) {
          return const Center(
            child: Text('Address not loaded'),
          );
        }

        final railgunUri = 'railgun://${provider.userAddress}';

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
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

                // Title
                Text(
                  'Receive crypto by scanning your QR code below',
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 24),

                // QR Code Section
                if (_showQRCode)
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppTheme.darkGrey,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: QrImage(
                      data: railgunUri,
                      version: QrVersions.auto,
                      size: 240,
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFF00A8E8),
                      errorCorrectionLevel: QrErrorCorrectLevel.H,
                    ),
                  )
                else
                  Container(
                    width: 240,
                    height: 240,
                    decoration: BoxDecoration(
                      color: AppTheme.darkGrey,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: AppTheme.darkGrey,
                        width: 2,
                      ),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.qr_code_2,
                        size: 80,
                        color: Color(0xFF00A8E8),
                      ),
                    ),
                  ),

                const SizedBox(height: 24),

                // Show QR Code Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _showQRCode = !_showQRCode;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.darkGrey,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: Text(
                      _showQRCode ? 'Hide QR Code' : 'Show my QR code',
                    ),
                  ),
                ),

                const SizedBox(height: 32),

                // Address Section
                Text(
                  'Or simply copy your address:',
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 16),

                // Address Display with Avatar
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppTheme.darkGrey,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: AppTheme.secondaryBlack,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Icon(
                          Icons.person,
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
                              'PR*V4CY',
                              style: TextStyle(
                                color: AppTheme.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              _shortenAddress(provider.userAddress!),
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          _copyToClipboard(provider.userAddress!);
                        },
                        icon: const Icon(
                          Icons.content_copy,
                          color: AppTheme.white,
                          size: 20,
                        ),
                      ),
                    ],
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

  String _shortenAddress(String address) {
    if (address.length < 10) return address;
    return '${address.substring(0, 6)}...${address.substring(address.length - 4)}';
  }

  void _copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Address copied to clipboard'),
        duration: Duration(seconds: 2),
      ),
    );
  }
}
