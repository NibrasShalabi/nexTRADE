import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/custom_bottom_navbar.dart';
import 'widgets/transactions_screen_body.dart';
class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.background,
      body: const TransactionsScreenBody(),
      bottomNavigationBar: GlassBottomNavBar(currentIndex: 3),

    );
  }
}


