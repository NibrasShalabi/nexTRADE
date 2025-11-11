import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextrade/core/widgets/custom_text_field.dart';

class SignupFormSection extends StatefulWidget {
  const SignupFormSection({super.key});

  static _SignupFormSectionState? of(BuildContext context) =>
      context.findAncestorStateOfType<_SignupFormSectionState>();

  @override
  State<SignupFormSection> createState() => _SignupFormSectionState();
}

class _SignupFormSectionState extends State<SignupFormSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _drawerAnimation;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController codeController = TextEditingController();

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
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    codeController.dispose();
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
                child: CustomTextField(
                  hintText: 'User name',
                  bottomLeft: 0,
                  bottomRight: 0,
                  controller: nameController, // ✅ Controller مضاف
                ),
              ),
              Opacity(
                opacity: slide,
                child: Transform.scale(
                  scale: 0.9 + (0.1 * slide),
                  child: CustomTextField(
                    hintText: 'Email',
                    keyboardType: TextInputType.emailAddress,
                    topLeft: 0,
                    bottomRight: 0,
                    controller: emailController, // ✅ Controller مضاف
                  ),
                ),
              ),
              Opacity(
                opacity: slide,
                child: Transform.scale(
                  scale: 0.9 + (0.1 * slide),
                  child: CustomTextField(
                    hintText: 'Password',
                    isPassword: true,
                    topRight: 0,
                    bottomLeft: 0,
                    controller: passwordController, // ✅ Controller مضاف
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset(0, 10 * slide),
                child: CustomTextField(
                  hintText: 'Verification Code (optional)',
                  isCodeField: true,
                  keyboardType: TextInputType.number,
                  topLeft: 0,
                  topRight: 0,
                  controller: codeController, // ✅ Controller مضاف
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
