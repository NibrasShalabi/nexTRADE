import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/text_style.dart';
import '../../../../core/widgets/glass_card.dart';


class DepositStatusBox extends StatelessWidget {
  final bool isPending;
  final bool isApproved;
  final double amount;
  final String network;

  const DepositStatusBox({
    super.key,
    required this.isPending,
    required this.isApproved,
    required this.amount,
    required this.network,
  });

  @override
  Widget build(BuildContext context) {
    String statusText;
    Color statusColor;

    if (isPending) {
      statusText = 'Waiting for admin confirmation...';
      statusColor = Colors.amber;
    } else if (isApproved) {
      statusText = 'Deposit of \$${amount.toStringAsFixed(2)} confirmed ✅';
      statusColor = AppColors.green;
    } else {
      statusText = '';
      statusColor = Colors.transparent;
    }

    return GlassCard(
      radius: 16.r,
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            isPending
                ? Icons.hourglass_empty_rounded
                : Icons.check_circle_outline,
            color: statusColor,
            size: 26.sp,
          ),
          SizedBox(height: 10.h),
          Text(
            statusText,
            style: AppTextStyle.textStyle14.copyWith(
              color: statusColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'Network: $network',
            style: AppTextStyle.textStyle14.copyWith(color: Colors.white70),
          ),
        ],
      ),
    );
  }
}