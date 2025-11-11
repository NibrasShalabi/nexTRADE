import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_colors.dart';
import '../constants/text_style.dart';

class InfoItem extends StatelessWidget {
  final String title;
  final String value;

  const InfoItem({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: AppTextStyle.textStyle14.copyWith(
            color: Colors.white70,
            fontSize: 13.sp,
          ),
        ),
        SizedBox(height: 6.h),
        Text(
          value,
          style: AppTextStyle.textStyle16.copyWith(
            color: AppColors.golden,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
