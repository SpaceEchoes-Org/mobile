import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';

class ProgressTile extends StatelessWidget {
  final String title;
  final String imagePath;
  final int completed;
  final int total;

  const ProgressTile({
    super.key,
    required this.title,
    required this.imagePath,
    required this.completed,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.surface.withValues(alpha: 0.7),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withValues(alpha: 0.06)),
      ),
      child: Row(
        children: [
          ClipOval(
            child: Image.asset(
              imagePath,
              width: 40,
              height: 40,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => const SizedBox(
                width: 40,
                height: 40,
                child: Icon(Icons.public, color: AppColors.secondarytext),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: AppColors.primarytext,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '$completed/$total',
                      style: const TextStyle(
                        color: AppColors.captiontext,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: total == 0 ? 0 : completed / total,
                    minHeight: 5,
                    backgroundColor: Colors.white.withValues(alpha: 0.08),
                    valueColor:
                    const AlwaysStoppedAnimation<Color>(AppColors.accent),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}