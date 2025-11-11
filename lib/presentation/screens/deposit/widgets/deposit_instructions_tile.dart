import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/text_style.dart';
import '../../../../core/widgets/glass_card.dart' show GlassCard;

class DepositInstructionsTile extends StatefulWidget {
  const DepositInstructionsTile({super.key});

  @override
  State<DepositInstructionsTile> createState() =>
      _DepositInstructionsTileState();
}

class _DepositInstructionsTileState extends State<DepositInstructionsTile>
    with SingleTickerProviderStateMixin {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      radius: 18.r,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔽 العنوان الرئيسي القابل للضغط
          GestureDetector(
            onTap: () => setState(() => _expanded = !_expanded),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'How to deposit your funds?',
                  style: AppTextStyle.textStyle16.copyWith(
                    color: AppColors.golden,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Icon(
                  _expanded
                      ? Icons.keyboard_arrow_up_rounded
                      : Icons.keyboard_arrow_down_rounded,
                  color: Colors.white70,
                ),
              ],
            ),
          ),
          SizedBox(height: 5.h),

          // ⚡ أنيميشن الفتح والإغلاق
          AnimatedSize(
            duration: const Duration(milliseconds: 350),
            curve: Curves.easeInOut,
            clipBehavior: Clip.hardEdge,
            child: _expanded
                ? AnimatedOpacity(
              duration: const Duration(milliseconds: 400),
              opacity: _expanded ? 1 : 0,
              child: Padding(
                padding: EdgeInsets.only(top: 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _step('1️. Copy your wallet address.'),
                    _step('2️. Send USDT to this address.'),
                    _step('3️. Wait for admin confirmation.'),
                  ],
                ),
              ),
            )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }

  Widget _step(String text) => Padding(
    padding: EdgeInsets.only(bottom: 6.h),
    child: Text(
      text,
      style: AppTextStyle.textStyle14.copyWith(
        color: Colors.white.withOpacity(0.85),
        height: 1.4,
      ),
    ),
  );
}
