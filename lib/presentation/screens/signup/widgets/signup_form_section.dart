import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextrade/core/widgets/custom_text_field.dart';

class  SignupFormSection extends StatefulWidget {
  const SignupFormSection ({super.key});

  @override
  State<SignupFormSection> createState() => _LoginFormSectionState();
}

class _LoginFormSectionState extends State<SignupFormSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _drawerAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    )..forward();

    _drawerAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _drawerAnimation,
      builder: (context, child) {
        final slide = _drawerAnimation.value;

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 80.h),
          child: Column(
            children: [
              Transform.translate(
                offset: Offset(0, -10 * slide),
                child: const CustomTextField(
                  hintText: 'User name',
                  bottomLeft: 0,
                  bottomRight: 0,
                ),
              ),
              Opacity(
                opacity: slide,
                child: Transform.scale(
                  scale: 0.9 + (0.1 * slide),
                  child: const CustomTextField(
                    hintText: 'Email',
                    keyboardType: TextInputType.emailAddress,
                    topLeft: 0,
                    bottomRight: 0,
                  ),
                ),
              ),
              Opacity(
                opacity: slide,
                child: Transform.scale(
                  scale: 0.9 + (0.1 * slide),
                  child: const CustomTextField(
                    hintText: 'Password',
                    isPassword: true,
                    topRight: 0,
                    bottomLeft: 0,
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset(0, 10 * slide),
                child: const CustomTextField(
                  hintText: 'Verification Code (optional)',
                  isCodeField: true,
                  keyboardType: TextInputType.number,
                  topLeft: 0,
                  topRight: 0,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
