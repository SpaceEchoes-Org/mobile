import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';
import '../../domain/entities/suggested_question_entity.dart';

class SuggestionChips extends StatelessWidget {
  final List<SuggestedQuestionEntity> questions;
  final ValueChanged<SuggestedQuestionEntity> onTap;

  const SuggestionChips({
    super.key,
    required this.questions,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 10,
      children: [
        for (final q in questions)
          InkWell(
            onTap: () => onTap(q),
            borderRadius: BorderRadius.circular(25),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  color: AppColors.accent.withOpacity(0.55),
                  width: 1,
                ),
              ),
              child: Text(
                q.text,
                style: const TextStyle(
                  color: AppColors.accent,
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
      ],
    );
  }
}