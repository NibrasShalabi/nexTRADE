import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/text_style.dart';
import '../../../../core/widgets/glass_card.dart';

class ReferralListTile extends StatelessWidget {
  final String name;
  final String status;
  final String reward;

  const ReferralListTile({
    super.key,
    required this.name,
    required this.status,
    required this.reward,
  });

  @override
  Widget build(BuildContext context) {
    final isApproved = status == 'Approved';

    return GlassCard(
      radius: 18.r,
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.person, color: AppColors.golden, size: 22.sp),
              SizedBox(width: 10.w),
              Text(
                name,
                style: AppTextStyle.textStyle16.copyWith(color: Colors.white),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                status,
                style: AppTextStyle.textStyle14.copyWith(
                  color: isApproved ? AppColors.green : Colors.orangeAccent,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                reward,
                style: AppTextStyle.textStyle14.copyWith(
                  color: Colors.white70,
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
