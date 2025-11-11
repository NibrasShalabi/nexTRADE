import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../constants/app_colors.dart';

class GlassBottomNavBar extends StatelessWidget {
  final int currentIndex;

  const GlassBottomNavBar({
    super.key,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15, left: 15, right: 15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            height: 70,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.35),
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: Colors.white.withOpacity(0.1)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _navItem(context, Icons.home, 0, '/'),
                _navItem(context, Icons.add_card_rounded, 1, '/deposit'),
                _navItem(context, Icons.swap_vert_rounded, 2, '/withdraw'),
                _navItem(context, Icons.receipt_long_rounded, 3, '/transactions'),
                _navItem(context, Icons.group, 4, '/referral'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _navItem(BuildContext context, IconData icon, int index, String route) {
    final isActive = currentIndex == index;
    return GestureDetector(
      onTap: () => context.go(route),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: isActive
              ? const LinearGradient(
            colors: [AppColors.golden, AppColors.green],
          )
              : null,
        ),
        child: Icon(
          icon,
          size: 28,
          color: isActive ? Colors.black : Colors.white70,
        ),
      ),
    );
  }
}
