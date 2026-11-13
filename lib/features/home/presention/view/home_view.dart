import 'package:flutter/material.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../widget/container.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.primary, AppColors.secondary],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Greeting + points
                Row(
                  children: const [
                    Text(
                      'Hi Explorer 👋',
                      style: TextStyle(color: Colors.white54, fontSize: 18),
                    ),
                    SizedBox(width: 8),
                    Text(
                      '· 150 pts',
                      style: TextStyle(
                        color: AppColors.accent,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Title
                const Text(
                  'Where Will Your\nJourney Take You?',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    height: 1.25,
                  ),
                ),
                const SizedBox(height: 32),

                // Cards
                HomeContainer(
                  title: 'The Moon',
                  description: 'Explore the missions that changed our understanding\nof the Moon.',
                  imagePath: AppImages.homemoon,
                  onExplorePressed: () {},
                ),
                const SizedBox(height: 24),
                HomeContainer(
                  title: 'Mars',
                  description: 'Discover the robotic\nexplorers searching for clues\nabout the Red Planet.',
                  imagePath: AppImages.homemars,
                  onExplorePressed: () {},
                ),
                const SizedBox(height: 24),
                HomeContainer(
                  title: 'Deep Space',
                  description: 'Follow spacecraft traveling\nfar beyond Earth.',
                  imagePath: AppImages.homedeepspace,
                  onExplorePressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
