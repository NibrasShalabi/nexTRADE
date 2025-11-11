import 'package:flutter/material.dart';
import 'package:nextrade/core/widgets/custom_button.dart';

class WithdrawButton extends StatelessWidget {
  final VoidCallback onPressed;

  const WithdrawButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return CustomButton(text: 'Request Withdraw', onPressed: onPressed);
  }
}
