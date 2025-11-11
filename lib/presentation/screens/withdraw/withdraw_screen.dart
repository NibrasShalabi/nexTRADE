import 'package:flutter/material.dart';
import 'package:nextrade/presentation/screens/withdraw/widgets/withdraw_screen_body.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../core/widgets/custom_bottom_navbar.dart';


class WithdrawScreen extends StatelessWidget {
  const WithdrawScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: const WithdrawScreenBody(),
      bottomNavigationBar: GlassBottomNavBar(currentIndex: 2),

    );
  }
}
