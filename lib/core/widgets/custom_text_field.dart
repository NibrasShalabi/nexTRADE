import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final bool isPassword;
  final bool isCodeField;
  final TextInputType keyboardType;

  // 🔹 زوايا الحواف
  final double topLeft;
  final double topRight;
  final double bottomLeft;
  final double bottomRight;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.isPassword = false,
    this.isCodeField = false,
    this.keyboardType = TextInputType.text,
    this.topLeft = 18,
    this.topRight = 18,
    this.bottomLeft = 18,
    this.bottomRight = 18,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFFDcb42c);
    const accentColor = Color(0xFF44B48C);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: TextField(
        obscureText: widget.isPassword ? _obscure : false,
        keyboardType: widget.keyboardType,
        textAlign: TextAlign.start,
        style: TextStyle(
          fontSize: 16.sp,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(fontSize: 15.sp, color: Colors.white70),
          filled: true,
          fillColor: accentColor.withOpacity(0.1),
          contentPadding:
          EdgeInsets.symmetric(vertical: 18.h, horizontal: 20.w),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(widget.topLeft.r),
              topRight: Radius.circular(widget.topRight.r),
              bottomLeft: Radius.circular(widget.bottomLeft.r),
              bottomRight: Radius.circular(widget.bottomRight.r),
            ),
            borderSide: BorderSide(width: 1.5.w, color: primaryColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(widget.topLeft.r),
              topRight: Radius.circular(widget.topRight.r),
              bottomLeft: Radius.circular(widget.bottomLeft.r),
              bottomRight: Radius.circular(widget.bottomRight.r),
            ),
            borderSide: BorderSide(width: 2.w, color: accentColor),
          ),

          suffixIcon: widget.isPassword
              ? IconButton(
            icon: Icon(
              _obscure ? Icons.visibility_off : Icons.visibility,
              color: _obscure ? primaryColor : accentColor,
              size: 22.sp,
            ),
            onPressed: () {
              setState(() {
                _obscure = !_obscure;
              });
            },
          )
              : widget.isCodeField
              ? Icon(Icons.verified,
              color: primaryColor, size: 22.sp)
              : null,
        ),
      ),
    );
  }
}
