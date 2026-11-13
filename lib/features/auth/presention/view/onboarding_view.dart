import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/features/auth/presention/view/login_view.dart';
import '../../../../core/helper/mynavigator.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../home/presention/view/main_view.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final screenHeight = constraints.maxHeight;

          return Stack(
            children: [
              // Background Image
              Positioned.fill(
                child: Image.asset(
                  AppImages.splash,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),

              // Title
              Positioned(
                top: 450.h,
                left: 15.w,
                right: 32,
                child: const Text(
                  'Universe?',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    color: AppColors.accent,
                  ),
                ),
              ),

              // Description
              Positioned(
                top: 522.h,
                left: 32,
                right: 32,
                child: const Text(
                  "Discover forgotten missions, meet incredible "
                  "space explorers, and uncover the stories "
                  "behind NASA's legendary equipment.",
                  style: TextStyle(
                    fontSize: 18,
                    height: 1.2,
                    color: AppColors.secondarytext,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),

              // Start Journey Button
              Positioned(
                bottom: 50.h,
                left: 32,
                right: 32,
                height: 80.h,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    gradient: const LinearGradient(
                      colors: [
                       AppColors.salmonpink,
                        AppColors.accent,
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFFFFB6A6)
                            .withOpacity(0.18),
                        blurRadius: 25,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      MyNavigator.goTo(context, toPage: LoginScreen(), );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    child: const Text(
                      'Start Your Journey',
                      style: TextStyle(
                        fontSize: 22,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}