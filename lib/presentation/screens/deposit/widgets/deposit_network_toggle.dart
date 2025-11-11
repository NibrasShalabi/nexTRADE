import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/glass_card.dart';


class DepositNetworkToggle extends StatelessWidget {
  final String selectedNetwork;
  final Function(String) onToggle;

  const DepositNetworkToggle({
    super.key,
    required this.selectedNetwork,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      radius: 18.r,
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildOption('TRC20'),
          _buildOption('ERC20'),
        ],
      ),
    );
  }

  Widget _buildOption(String label) {
    final isActive = label == selectedNetwork;
    return GestureDetector(
      onTap: () => onToggle(label),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: isActive
              ? AppColors.golden.withOpacity(0.25)
              : Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: isActive ? AppColors.golden : Colors.transparent,
            width: 1.2,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isActive ? AppColors.golden : Colors.white70,
            fontWeight: FontWeight.w600,
            fontSize: 14.sp,
          ),
        ),
      ),
    );
  }
}
