import 'package:flutter/material.dart';
import '../../../../core/helper/mynavigator.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import 'onboarding_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 1), () {
  Navigator.pushReplacement(
    context,
    PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 700),
      pageBuilder: (context, animation, secondaryAnimation) =>
          const OnboardingView(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final tween = Tween<Offset>(
          begin: const Offset(0, 0.08),
          end: Offset.zero,
        ).chain(
          CurveTween(curve: Curves.easeOutCubic),
        );

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    ),
  );
});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  body: SizedBox.expand(
    child: Image.asset(
      AppImages.splash,
      fit: BoxFit.cover,
    ),
  ),
);
  }
}