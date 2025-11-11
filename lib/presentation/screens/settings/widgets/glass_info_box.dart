import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextrade/core/helpers/copy_button.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/text_style.dart';

class GlassInfoTile extends StatelessWidget {
  final String title;
  final String value;
  final bool highlight;
  final bool hasCopyButton;
  final bool fullWidth;

  const GlassInfoTile({
    super.key,
    required this.title,
    required this.value,
    this.highlight = false,
    this.hasCopyButton = false,
    this.fullWidth = false,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.r),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          width: fullWidth ? double.infinity : null,
          padding: EdgeInsets.all(14.w),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.06),
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(color: Colors.white.withOpacity(0.1)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTextStyle.textStyle14.copyWith(color: Colors.white60),
              ),
              SizedBox(height: 6.h),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      value,
                      style: AppTextStyle.textStyle16.copyWith(
                        color: highlight ? AppColors.green : Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  if (hasCopyButton)

                      CopyButton()

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
