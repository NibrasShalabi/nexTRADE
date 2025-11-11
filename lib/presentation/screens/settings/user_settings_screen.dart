import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import 'widgets/user_settings_body.dart';

class UserSettingsScreen extends StatelessWidget {
  const UserSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.background,
      body: UserSettingsBody(),
    );
  }
}
