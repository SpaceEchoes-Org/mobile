import 'package:flutter/material.dart';

class BadgesView extends StatelessWidget {
  const BadgesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text("badges Screen", style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}