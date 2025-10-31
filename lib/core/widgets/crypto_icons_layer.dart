import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextrade/core/constants/images.dart';

class CryptoIconsLayer extends StatelessWidget {
  final double scale;

  const CryptoIconsLayer({
    super.key,
    this.scale = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 🟡 Bitcoin
        Positioned(
          bottom: 65.h,
          left: 40.w,
          child: Transform.scale(
            scale: scale,
            child: Opacity(
              opacity: 0.1,
              child: Image.asset(
               AppImage.btcIcon,
                width: 70.w,
                height: 70.w,
              ),
            ),
          ),
        ),

        Positioned(
          top: 195.h,
          right: 40.w,
          child: Transform.scale(
            scale: scale * 0.9,
            child: Opacity(
              opacity: 0.1,
              child: Image.asset(
                AppImage.usdtIcon,
                width: 65.w,
                height: 65.w,
              ),
            ),
          ),
        ),

        // Positioned(
        //   bottom: 60.h,
        //   left: 80.w,
        //   child: Transform.scale(
        //     scale: scale * 1.1,
        //     child: Opacity(
        //       opacity: 0.6,
        //       child: Image.asset(
        //        AppImage.tronIcon,
        //         width: 75.w,
        //         height: 75.w,
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
