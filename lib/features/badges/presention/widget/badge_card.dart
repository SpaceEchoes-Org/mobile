import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';
import '../../domain/entities/badge_entity.dart';
import '../utils/badge_ui_mapper.dart';

class BadgeCard extends StatelessWidget {
  final BadgeEntity badge;

  const BadgeCard({super.key, required this.badge});

  @override
  Widget build(BuildContext context) {
    final collected = badge.isCollected;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      decoration: BoxDecoration(
        color: collected
            ? AppColors.surface
            : Colors.white.withValues(alpha: 0.04),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: collected
              ? AppColors.accent.withValues(alpha: 0.7)
              : Colors.white.withValues(alpha: 0.06),
        ),
        boxShadow: collected
            ? [
          BoxShadow(
            color: AppColors.accent.withValues(alpha: 0.25),
            blurRadius: 12,
          ),
        ]
            : null,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: collected ? AppGradients.accent : null,
              color: collected ? null : Colors.white.withValues(alpha: 0.05),
            ),
            child: Icon(
              BadgeUiMapper.icon(badge.id),
              size: 22,
              color: collected
                  ? AppColors.primary
                  : AppColors.captiontext.withValues(alpha: 0.6),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            badge.name,
            textAlign: TextAlign.center,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 11,
              height: 1.2,
              fontWeight: FontWeight.w600,
              color: collected
                  ? AppColors.primarytext
                  : AppColors.captiontext.withValues(alpha: 0.8),
            ),
          ),
        ],
      ),
    );
  }
}