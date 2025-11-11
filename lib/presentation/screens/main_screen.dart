import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nextrade/core/constants/app_colors.dart';

import '../../core/widgets/custom_bottom_navbar.dart';

class MainScreen extends StatefulWidget {
  final Widget child;
  final int currentIndex;

  const MainScreen({
    super.key,
    required this.child,
    required this.currentIndex,
  });

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  void _onTabSelected(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/home');
        break;
      case 1:
        context.go('/deposit');
        break;
      case 2:
        context.go('/withdraw');
        break;
      case 3:
        context.go('/transactions');
        break;
      case 4:
        context.go('/referral');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: widget.child,
      bottomNavigationBar: GlassBottomNavBar(
        currentIndex: widget.currentIndex,
      ),
    );
  }
}
