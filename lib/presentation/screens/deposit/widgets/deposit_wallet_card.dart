import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextrade/core/constants/text_style.dart' show AppTextStyle;
import 'package:nextrade/core/helpers/copy_button.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/glass_card.dart' show GlassCard;

class DepositWalletCard extends StatelessWidget {
  final String selectedNetwork;

  const DepositWalletCard({super.key, required this.selectedNetwork});

  @override
  Widget build(BuildContext context) {
    final walletAddress = selectedNetwork == 'TRC20'
        ? 'TXa3b4...9bd1'
        : '0x7DfC...a51C';

    return GlassCard(
      radius: 20.r,
      padding: EdgeInsets.all(20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$selectedNetwork Wallet Address',
            style: AppTextStyle.textStyle16.copyWith(color: Colors.white70),
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(walletAddress,
                  style: AppTextStyle.textStyle18
                      .copyWith(color: AppColors.golden)),
             CopyButton(),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            'Transfer fee: 1.2% per transaction',
            style: AppTextStyle.textStyle14.copyWith(color: Colors.white54),
          ),
        ],
      ),
    );
  }
}
