//this a reusable container for the home screen, it will be used to display the different sections of the home screen,
// such as the moon, mars, and deep space sections.


import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';

class HomeContainer extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  final String progressText;
  final VoidCallback? onExplorePressed;

  const HomeContainer({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
    this.progressText = "0/3 missions",
    this.onExplorePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 235,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: Colors.white.withOpacity(0.1), width: 1),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(28),
        child: Stack(
          children: [
            Positioned(
               top: -20,
               right: -20,
               child: SizedBox(
               width: 200,
               height: 200,
               child: ClipOval(
      child: Image.asset(
        imagePath,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          debugPrint('Image error: $error');
          return const Icon(Icons.broken_image, color: Colors.white);
        },
      ),
    ),
  ),
),


            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: AppColors.primarytext,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      description,
                      style: TextStyle(
                        color: AppColors.primarytext.withOpacity(0.7),
                        fontSize: 16,
                        height: 1.3,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        progressText,
                        style: TextStyle(
                          color: AppColors.primarytext.withOpacity(0.5),
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      // زر Explore مع الـ Action المختلف لكل كارت
                      GestureDetector(
                        onTap: onExplorePressed,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 28,
                            vertical: 12,
                          ),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [AppColors.accent, AppColors.salmonpink],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.salmonpink.withOpacity(0.3),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: const Text(
                            "Explore",
                            style: TextStyle(
                              color: AppColors.primary,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
