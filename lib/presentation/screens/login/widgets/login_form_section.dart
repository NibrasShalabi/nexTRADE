import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextrade/core/widgets/custom_text_field.dart';

class LoginFormSection extends StatefulWidget {
  const LoginFormSection({super.key});

  @override
  State<LoginFormSection> createState() => _LoginFormSectionState();
}

class _LoginFormSectionState extends State<LoginFormSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _drawerAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2600),
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
                  hintText: 'Email',
                  bottomLeft: 0,
                  bottomRight: 0,
                  keyboardType: TextInputType.emailAddress,

                ),
              ),
              Transform.translate(
                offset: Offset(0, 10 * slide),
                child: const CustomTextField(
                  hintText: 'Password',
                  isPassword: true,
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
