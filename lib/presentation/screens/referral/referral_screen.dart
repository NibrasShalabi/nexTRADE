import 'package:flutter/material.dart';
import 'package:nextrade/presentation/screens/referral/widgets/referral_screen_body.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/custom_bottom_navbar.dart';

class ReferralScreen extends StatelessWidget {
  const ReferralScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: const ReferralScreenBody(),
      bottomNavigationBar: GlassBottomNavBar(currentIndex: 4),

    );
  }
}
