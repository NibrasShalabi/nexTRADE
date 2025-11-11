import 'package:flutter/material.dart';
import 'package:nextrade/presentation/screens/deposit/widgets/deposit_screen_body.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/widgets/custom_bottom_navbar.dart';


class DepositScreen extends StatelessWidget {
  const DepositScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: const DepositScreenBody(),
      bottomNavigationBar: GlassBottomNavBar(currentIndex: 1),

    );
  }
}
