iimport 'package:flutter/material.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../widget/profile_header.dart';
import '../widget/profile_stat_card.dart';
import '../widget/progress_tile.dart';


class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(gradient: AppGradients.screenBackground),
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: ProfileHeader(
                    username: 'ea0115417',
                    level: 'Junior Space Explorer',
                  ),
                ),
                const SizedBox(height: 24),

                // Stats
                const Row(
                  children: [
                    ProfileStatCard(value: '0', label: 'Points'),
                    SizedBox(width: 12),
                    ProfileStatCard(value: '0', label: 'Missions'),
                    SizedBox(width: 12),
                    ProfileStatCard(value: '0', label: 'Badges'),
                  ],
                ),
                const SizedBox(height: 28),

                // Progress
                const _SectionTitle('Progress'),
                const SizedBox(height: 12),
                ProgressTile(
                  title: 'The Moon',
                  imagePath: AppImages.homemoon,
                  completed: 0,
                  total: 3,
                ),
                const SizedBox(height: 12),
                ProgressTile(
                  title: 'Mars',
                  imagePath: AppImages.homemars,
                  completed: 0,
                  total: 3,
                ),
                const SizedBox(height: 12),
                ProgressTile(
                  title: 'Deep Space',
                  imagePath: AppImages.homedeepspace,
                  completed: 0,
                  total: 3,
                ),
                const SizedBox(height: 28),

                // Recently explored
                const _SectionTitle('Recently Explored'),
                const SizedBox(height: 8),
                const Text(
                  'Nothing yet — start your first mission!',
                  style: TextStyle(color: AppColors.captiontext, fontSize: 14),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String text;

  const _SectionTitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: AppColors.primarytext,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}