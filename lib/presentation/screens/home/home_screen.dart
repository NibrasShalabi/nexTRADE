import 'package:flutter/material.dart';
import 'package:nextrade/presentation/screens/home/widgets/home_screen_body.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/widgets/custom_bottom_navbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: const HomeScreenBody(),
      bottomNavigationBar: GlassBottomNavBar(currentIndex: 0),

    );
  }
}
