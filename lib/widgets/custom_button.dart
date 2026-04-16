import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool isLoading;
  final bool isOutlined;
  final Color? backgroundColor;
  final Color? textColor;
  final double? width;
  final double height;
  final IconData? icon;

  const CustomButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    this.isOutlined = false,
    this.backgroundColor,
    this.textColor,
    this.width,
    this.height = 48,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final button = isOutlined
        ? OutlinedButton(
            onPressed: isLoading ? null : onPressed,
            style: OutlinedButton.styleFrom(
              side: BorderSide(
                color: backgroundColor ?? AppTheme.primaryBlue,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 24,
                vertical: height / 2 - 8,
              ),
            ),
            child: _buildContent(),
          )
        : ElevatedButton(
            onPressed: isLoading ? null : onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor ?? AppTheme.primaryBlue,
              disabledBackgroundColor: AppTheme.darkGrey,
              padding: EdgeInsets.symmetric(
                horizontal: 24,
                vertical: height / 2 - 8,
              ),
            ),
            child: _buildContent(),
          );

    if (width != null) {
      return SizedBox(width: width, child: button);
    }
    return button;
  }

  Widget _buildContent() {
    if (isLoading) {
      return SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(
            textColor ?? AppTheme.white,
          ),
        ),
      );
    }

    if (icon != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon),
          const SizedBox(width: 8),
          Text(label),
        ],
      );
    }

    return Text(label);
  }
}
