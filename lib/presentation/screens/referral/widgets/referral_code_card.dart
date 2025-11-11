import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextrade/core/helpers/copy_button.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/text_style.dart';
import '../../../../core/widgets/glass_card.dart';

class ReferralCodeCard extends StatelessWidget {
  const ReferralCodeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      radius: 20.r,
      padding: EdgeInsets.all(18.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Your Referral Code',
            style: AppTextStyle.textStyle16.copyWith(
              color: Colors.white70,
            ),
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'NEX12345',
                style: AppTextStyle.textStyle20.copyWith(
                  color: AppColors.golden,
                  fontWeight: FontWeight.bold,
                ),
              ),
              CopyButton(),

            ],
          ),
        ],
      ),
    );
  }
}
