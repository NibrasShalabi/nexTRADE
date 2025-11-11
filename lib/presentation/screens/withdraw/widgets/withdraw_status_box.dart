import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/text_style.dart';
import '../../../../../core/widgets/glass_card.dart';

class WithdrawStatusBox extends StatelessWidget {
  final bool isPending;
  final bool isApproved;
  final double amount;

  const WithdrawStatusBox({
    super.key,
    required this.isPending,
    required this.isApproved,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    if (!isPending && !isApproved) return const SizedBox.shrink();

    String statusText;
    Color statusColor;

    if (isPending) {
      statusText = 'Waiting for admin approval...';
      statusColor = Colors.amber;
    } else if (isApproved) {
      statusText = 'Withdrawal of \$${amount.toStringAsFixed(2)} completed ✅';
      statusColor = AppColors.green;
    } else {
      statusText = '';
      statusColor = Colors.transparent;
    }

    return GlassCard(
      radius: 16.r,
      padding: EdgeInsets.all(30.w),
      child: Flexible(
        child: Wrap(
          alignment: WrapAlignment.center,
          runSpacing: 5.h,
          children: [
            Icon(
              isPending ? Icons.hourglass_empty : Icons.check_circle_outline,
              color: statusColor,
              size: 26.sp,
            ),
            SizedBox(width: 6.w),
            Text(
              statusText,
              textAlign: TextAlign.center,
              style: AppTextStyle.textStyle14.copyWith(
                color: statusColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
