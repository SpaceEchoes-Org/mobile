import 'package:flutter/material.dart';

class ChatbotView extends StatelessWidget {
  const ChatbotView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text("chatbot Screen", style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}