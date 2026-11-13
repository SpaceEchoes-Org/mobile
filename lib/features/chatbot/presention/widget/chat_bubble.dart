import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';
import '../../domain/entities/chat_message_entity.dart';

class ChatBubble extends StatelessWidget {
  final ChatMessageEntity message;

  const ChatBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final isUser = message.isUser;

    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.78,
        ),
        decoration: BoxDecoration(
          gradient: isUser
              ? const LinearGradient(
            colors: [AppColors.accent, AppColors.salmonpink],
          )
              : null,
          color: isUser ? null : const Color(0xFF2B2459),
          borderRadius: BorderRadius.circular(22),
          border: isUser
              ? null
              : Border.all(color: Colors.white.withOpacity(0.1), width: 1),
        ),
        child: Text(
          message.text,
          style: TextStyle(
            color: isUser ? AppColors.primary : Colors.white,
            fontSize: 15,
            height: 1.4,
            fontWeight: isUser ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
      ),
    );
  }
}