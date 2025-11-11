import 'package:flutter/material.dart';
import 'package:nextrade/core/widgets/custom_button.dart';


class HomeDepositButton extends StatelessWidget {
  const HomeDepositButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: CustomButton(text: 'Deposit Now', onPressed: () {}));
  }
}
