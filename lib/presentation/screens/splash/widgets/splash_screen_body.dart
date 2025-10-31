import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nextrade/core/constants/images.dart';
import 'package:nextrade/presentation/screens/splash/widgets/sliding_text.dart';

import '../../../../core/widgets/crypto_icons_layer.dart';

class SplashScreenBody extends StatefulWidget {
  const SplashScreenBody({super.key});

  @override
  State<SplashScreenBody> createState() => _SplashScreenBodyState();
}

class _SplashScreenBodyState extends State<SplashScreenBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    navigateToHome();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        alignment: Alignment(0, 0),
        children: [
          const CryptoIconsLayer(scale: 4.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
               AppImage.logo,
                width: 200,
                height: 200,
                fit: BoxFit.contain,
              ),
              SlidingText(slidingAnimation: slidingAnimation),

            ],
          ),
        ],
      ),
    );
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 4), () {
      GoRouter.of(context).push('/login');
    });
  }

  void initSlidingAnimation() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    slidingAnimation = Tween<Offset>(
      begin: const Offset(0, 2),
      end: Offset.zero,
    ).animate(animationController);
    animationController.forward();
  }
}
