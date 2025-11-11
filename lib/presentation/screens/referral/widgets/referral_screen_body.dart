import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextrade/presentation/screens/referral/widgets/referral_code_card.dart';
import 'package:nextrade/presentation/screens/referral/widgets/referral_info_box.dart';
import 'package:nextrade/presentation/screens/referral/widgets/referral_list_section.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/text_style.dart';

class ReferralScreenBody extends StatelessWidget {
  const ReferralScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(20.w),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Referral System',
                style: AppTextStyle.textStyle20.copyWith(
                  color: AppColors.golden,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.h),

              // 🔹 الكود + زر النسخ
              const ReferralCodeCard(),
              SizedBox(height: 20.h),

              // 🔹 النسبة + الشرح
              const ReferralInfoBox(),
              SizedBox(height: 25.h),

              // 🔹 لستة المستخدمين (ويدجت مستقلة)
              const ReferralListSection(),
            ],
          ),
        ),
      ),
    );
  }
}
