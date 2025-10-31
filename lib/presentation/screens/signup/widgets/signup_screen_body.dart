import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextrade/core/constants/text_style.dart';
import 'package:nextrade/presentation/screens/signup/widgets/signup_form_section.dart';

import '../../../../core/widgets/crypto_icons_layer.dart';
import '../../../../core/widgets/custom_button.dart';

class SignupScreenBody extends StatelessWidget {
  const SignupScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          const CryptoIconsLayer(scale: 4.0),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 100.h),

                Text('Welcome', style: AppTextStyle.textStyle30),
                Text(
                  'You can make your account here ',
                  style: AppTextStyle.textStyle18,
                ),
                Text(
                  'Please complete the form below ',
                  style: AppTextStyle.textStyle18,
                ),
                const SignupFormSection(),
                CustomButton(
                  text: 'Sing Up',
                  onPressed: () {},
                  height: 60.h,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
