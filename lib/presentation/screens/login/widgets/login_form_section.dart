import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextrade/core/widgets/custom_text_field.dart';

class LoginFormSection extends StatefulWidget {
  const LoginFormSection({super.key});

  static _LoginFormSectionState? of(BuildContext context) =>
      context.findAncestorStateOfType<_LoginFormSectionState>();

  @override
  State<LoginFormSection> createState() => _LoginFormSectionState();
}

class _LoginFormSectionState extends State<LoginFormSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _drawerAnimation;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // ✅ يبدأ الأنيميشن في كل مرة يتم بناء الصفحة فيها (يعني عند كل دخول جديد)
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
    emailController.dispose();
    passwordController.dispose();
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
                  hintText: 'Email',
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  bottomLeft: 0,
                  bottomRight: 0,
                ),
              ),
              Transform.translate(
                offset: Offset(0, 10 * slide),
                child: CustomTextField(
                  hintText: 'Password',
                  isPassword: true,
                  controller: passwordController,
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
