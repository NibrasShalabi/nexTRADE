import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTextStyle {
  static final textStyle30 = GoogleFonts.poppins(
    fontSize: 30.sp,
    fontWeight: FontWeight.bold,
  );

  static final textStyle20 = GoogleFonts.poppins(
    fontSize: 20.sp,
    fontWeight: FontWeight.w500,
  );

  static final textStyle18 = GoogleFonts.poppins(
    fontSize: 18.sp,
    color: Colors.grey,
    letterSpacing: 1.2
  );
}
