import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextrade/core/constants/text_style.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final double width;
  final double height;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width = double.infinity,
    this.height = 60,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    const golden = Color(0xFFDcb42c);
    const green = Color(0xFF44B48C);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GestureDetector(
        onTapDown: (_) => setState(() => _isPressed = true),
        onTapUp: (_) {
          setState(() => _isPressed = false);
          widget.onPressed();
        },
        onTapCancel: () => setState(() => _isPressed = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          width: widget.width.w,
          height: widget.height.h,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: _isPressed
                  ? [green.withOpacity(0.9), golden.withOpacity(0.9)]
                  : [golden, green],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(18.r),
            boxShadow: [
              BoxShadow(
                color: _isPressed
                    ? Colors.transparent
                    : green.withOpacity(0.4),
                blurRadius: 12,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Center(
            child: AnimatedScale(
              scale: _isPressed ? 0.95 : 1.0,
              duration: const Duration(milliseconds: 200),
              child: Text(
                widget.text,
                style: AppTextStyle.textStyle18.copyWith(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
