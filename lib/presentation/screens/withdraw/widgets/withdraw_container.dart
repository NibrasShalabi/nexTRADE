import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/constants/text_style.dart';
import 'withdraw_button.dart';
import 'withdraw_status_box.dart';

class WithdrawContainer extends StatelessWidget {
  final double currentBalance;
  final double withdrawAmount;
  final bool isPending;
  final bool isApproved;
  final Function(double) onRequest;

  const WithdrawContainer({
    super.key,
    required this.currentBalance,
    required this.onRequest,
    required this.withdrawAmount,
    required this.isPending,
    required this.isApproved,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return ClipRRect(
      borderRadius: BorderRadius.circular(25.r),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(25.w),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white.withOpacity(0.07),
                const Color(0xFF00A896).withOpacity(0.15),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            border: Border.all(color: Colors.white.withOpacity(0.2)),
            borderRadius: BorderRadius.circular(25.r),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Available Balance',
                  style: AppTextStyle.textStyle14
                      .copyWith(color: Colors.white70),
                ),
                Text(
                  '\$${currentBalance.toStringAsFixed(2)}',
                  style: AppTextStyle.textStyle30.copyWith(
                    color: const Color(0xFF7FE9DE),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 30.h),



                WithdrawButton(
                  onPressed: () {
                    final amount =
                        double.tryParse(controller.text.trim()) ?? 0;
                    if (amount > 0) onRequest(amount);
                  },
                ),
                SizedBox(height: 25.h),

                WithdrawStatusBox(
                  isPending: isPending,
                  isApproved: isApproved,
                  amount: withdrawAmount,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
