import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/text_style.dart';

class UserInfoCard extends StatelessWidget {
  final String name;
  final String email;
  final double balance;

  const UserInfoCard({
    super.key,
    required this.name,
    required this.email,
    required this.balance,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(22.r),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(18.w),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.05),
            borderRadius: BorderRadius.circular(22.r),
            border: Border.all(color: Colors.white.withOpacity(0.2)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 10,
                offset: const Offset(0, 4),
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Name: $name',
                  style: AppTextStyle.textStyle16.copyWith(color: Colors.white)),
              SizedBox(height: 6.h),
              Text('Email: $email',
                  style: AppTextStyle.textStyle16.copyWith(color: Colors.white70)),
              SizedBox(height: 8.h),
              Divider(color: Colors.white24, height: 25.h),
              Text('Balance',
                  style: AppTextStyle.textStyle14.copyWith(color: Colors.white54)),
              Text(
                '\$${balance.toStringAsFixed(2)}',
                style: AppTextStyle.textStyle20.copyWith(
                  color: AppColors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
