import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextrade/core/widgets/glass_card.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/text_style.dart';


class DepositAmountSheet extends StatelessWidget {
  final String selectedNetwork;
  final Function(double) onConfirm;

  const DepositAmountSheet({
    super.key,
    required this.selectedNetwork,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController amountController = TextEditingController();
    final walletAddress = selectedNetwork == 'TRC20'
        ? 'TXa3b4...9bd1'
        : '0x7DfC...a51C';

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: GlassCard(
        radius: 25.r,
        padding: EdgeInsets.all(20.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(20.r),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              'Enter Deposit Amount',
              style: AppTextStyle.textStyle18.copyWith(
                color: AppColors.golden,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.h),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Amount (e.g. 200)',
                hintStyle: const TextStyle(color: Colors.white54),
                filled: true,
                fillColor: Colors.white.withOpacity(0.05),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 15.w,
                  vertical: 12.h,
                ),
              ),
            ),
            SizedBox(height: 15.h),
            Text(
              'Wallet ($selectedNetwork):',
              style: AppTextStyle.textStyle14.copyWith(color: Colors.white70),
            ),
            SizedBox(height: 5.h),
            Text(
              walletAddress,
              style: AppTextStyle.textStyle16.copyWith(color: AppColors.green),
            ),
            SizedBox(height: 25.h),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 14.h),
                  backgroundColor: AppColors.golden.withOpacity(0.3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                ),
                onPressed: () {
                  final amount =
                      double.tryParse(amountController.text.trim()) ?? 0;
                  Navigator.pop(context);
                  onConfirm(amount);
                },
                child: Text(
                  'Confirm Deposit',
                  style: AppTextStyle.textStyle16.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
