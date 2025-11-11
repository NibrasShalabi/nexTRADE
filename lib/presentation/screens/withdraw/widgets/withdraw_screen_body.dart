import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextrade/presentation/screens/withdraw/widgets/withdraw_amount_sheet.dart';
import 'package:nextrade/presentation/screens/withdraw/widgets/withdraw_button.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/text_style.dart';
import '../../../../core/widgets/glass_card.dart';
import 'withdraw_status_box.dart';

class WithdrawScreenBody extends StatefulWidget {
  const WithdrawScreenBody({super.key});

  @override
  State<WithdrawScreenBody> createState() => _WithdrawScreenBodyState();
}

class _WithdrawScreenBodyState extends State<WithdrawScreenBody> {
  double currentBalance = 4250.00;
  double? withdrawAmount;
  bool isPending = false;
  bool isApproved = false;

  void _openWithdrawSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => WithdrawAmountSheet(
        onConfirm: (amount) {
          setState(() {
            withdrawAmount = amount;
            isPending = true;
            isApproved = false;
          });

          // ⏳ محاكاة موافقة الأدمن
          Future.delayed(const Duration(seconds: 5), () {
            if (mounted) {
              setState(() {
                isPending = false;
                isApproved = true;
                currentBalance -= withdrawAmount ?? 0;
              });
            }
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Withdraw Funds',
              style: AppTextStyle.textStyle20.copyWith(
                color: AppColors.golden,
                fontWeight: FontWeight.bold,
              ),
            ),
SizedBox(height: 80.h),
            GlassCard(
              radius: 25.r,
              padding: EdgeInsets.all(18.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 20.h),
                  Text(
                    'Available Balance',
                    style: AppTextStyle.textStyle16.copyWith(
                      color: Colors.white70,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    '\$${currentBalance.toStringAsFixed(2)}',
                    style: AppTextStyle.textStyle30.copyWith(
                      color: AppColors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 25.h),
                  Text(
                    'Withdraw requests are processed within 24 hours.',
                    textAlign: TextAlign.center,
                    style: AppTextStyle.textStyle14.copyWith(
                      color: Colors.white54,
                      height: 1.3,
                    ),
                  ),
                  SizedBox(height: 35.h),

                  WithdrawButton(onPressed: _openWithdrawSheet),
                ],
              ),
            ),

            SizedBox(height: 25.h),

            // ✅ الحالة خارج الكرت
            if (isPending || isApproved)
              WithdrawStatusBox(
                isPending: isPending,
                isApproved: isApproved,
                amount: withdrawAmount ?? 0,
              ),
          ],
        ),
      ),
    );
  }
}
