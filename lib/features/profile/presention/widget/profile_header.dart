import 'package:flutter/material.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';

class ProfileHeader extends StatelessWidget {
  final String username;
  final String level;

  const ProfileHeader({super.key, required this.username, required this.level});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.light.withValues(alpha: 0.6),
            boxShadow: [
              BoxShadow(
                color: AppColors.light.withValues(alpha: 0.4),
                blurRadius: 24,
              ),
            ],
          ),
          child: ClipOval(
            child: Image.asset(
              AppImages.astronaut,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => const Icon(
                Icons.rocket_launch_rounded,
                size: 56,
                color: AppColors.accent,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          username,
          style: const TextStyle(
            color: AppColors.primarytext,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          level,
          style: const TextStyle(color: AppColors.secondarytext, fontSize: 14),
        ),
      ],
    );
  }
}
