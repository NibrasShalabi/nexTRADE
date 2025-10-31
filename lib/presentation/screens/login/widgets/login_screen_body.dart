import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextrade/core/constants/text_style.dart';
import '../../../../core/widgets/crypto_icons_layer.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../splash/widgets/button_part.dart';
import 'login_form_section.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          RepaintBoundary(child: const CryptoIconsLayer(scale: 4.0)),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 140.h),
                Text(
                  'Welcome to nexTRADE',
                  style: AppTextStyle.textStyle30
                ),
                SizedBox(height: 60.h),
                const LoginFormSection(),
                CustomButton(
                  text: 'Log In',
                  onPressed: () {},
                  height: 60.h,
                ),
                ButtonPart(),
                SizedBox(height: 50.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
