import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/text_style.dart';
import '../../../../core/widgets/glass_card.dart';

class ReferralInfoBox extends StatelessWidget {
  const ReferralInfoBox({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      radius: 20.r,
      padding: EdgeInsets.all(18.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Referral Reward',
            style: AppTextStyle.textStyle18.copyWith(
              color: AppColors.golden,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'Earn a 10% bonus for each user who registers with your referral code. '
                'Rewards are added automatically once approved by the admin.',
            style: AppTextStyle.textStyle14.copyWith(
              color: Colors.white70,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}
