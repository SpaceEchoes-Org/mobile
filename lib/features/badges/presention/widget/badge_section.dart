import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';
import '../../domain/entities/badge_entity.dart';
import '../utils/badge_ui_mapper.dart';
import 'badge_card.dart';

class BadgeSection extends StatelessWidget {
  final BadgeCategory category;
  final List<BadgeEntity> badges;

  const BadgeSection({super.key, required this.category, required this.badges});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          BadgeUiMapper.categoryTitle(category),
          style: const TextStyle(
            fontSize: 12,
            letterSpacing: 1.5,
            fontWeight: FontWeight.w700,
            color: AppColors.captiontext,
          ),
        ),
        const SizedBox(height: 12),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: badges.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.82,
          ),
          itemBuilder: (_, i) => BadgeCard(badge: badges[i]),
        ),
      ],
    );
  }
}