import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/text_style.dart';


class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'NexTrade',
          style: AppTextStyle.textStyle20.copyWith(
            color: AppColors.golden,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Icon(Icons.settings, color: AppColors.golden),
      ],
    );
  }
}
