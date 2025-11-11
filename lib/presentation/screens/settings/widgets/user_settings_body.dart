import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextrade/core/widgets/custom_button.dart';
import 'package:nextrade/presentation/screens/settings/widgets/arrow_back.dart';
import 'package:nextrade/presentation/screens/settings/widgets/glass_info_box.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/text_style.dart';
import 'logout_button.dart';

class UserSettingsBody extends StatelessWidget {
  const UserSettingsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Settings',
                  style: AppTextStyle.textStyle20.copyWith(
                    color: AppColors.golden,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 25.h),

                // 🟨 الاسم والإيميل
                Row(
                  children: const [
                    Expanded(
                      child: GlassInfoTile(title: 'Name', value: 'Nibras'),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: GlassInfoTile(
                          title: 'Email', value: 'test@test.com'),
                    ),
                  ],
                ),
                SizedBox(height: 15.h),

                // 🟩 الإحالة بعرض الشاشة
                const GlassInfoTile(
                  title: 'Referral Code',
                  value: 'INVITE-23A4',
                  hasCopyButton: true,
                  fullWidth: true,
                ),
                SizedBox(height: 15.h),

                Row(
                  children: const [
                    Expanded(
                      child: GlassInfoTile(
                        title: 'Total Earned',
                        value: '\$125.00',
                        highlight: true,
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: GlassInfoTile(
                        title: 'Joined Members',
                        value: '8 Users',
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 30.h),

                CustomButton(text: 'Logout', onPressed: (){}),
              ],
            ),
          ),

ArrowBack()
        ],
      ),
    );
  }
}
