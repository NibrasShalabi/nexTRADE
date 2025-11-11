import 'package:flutter/material.dart';
import '../../../../core/widgets/glass_button.dart';

class DepositButton extends StatelessWidget {
  final VoidCallback onPressed;

  const DepositButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GlassButton(
        title: 'Send Deposit Request',
        onTap: onPressed,
      ),
    );
  }
}
