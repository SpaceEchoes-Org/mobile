import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../Explore/presention/view/explore_view.dart';
import '../../../badges/presention/view/badges_view.dart';
import '../../../chatbot/presention/view/chatbot_view.dart';
import 'home_view.dart';
import '../../../profile/presention/view/profile_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentIndex = 0;

  final List<Widget> pages = const [
    HomeView(),
    ExploreView(),
    BadgesView(),
    ChatbotView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,

        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home_outlined,color: AppColors.accent),
            label: 'Home', backgroundColor: AppColors.primary,
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.rocket_launch_outlined),
            activeIcon: Icon(Icons.rocket_launch_outlined,color: AppColors.accent),
            label: 'Explor',backgroundColor: AppColors.primary,
          ),

           BottomNavigationBarItem(
            icon: Icon(Icons.emoji_events_outlined),
            activeIcon: Icon(Icons.emoji_events_outlined,color: AppColors.accent),
            label: 'Badges',backgroundColor: AppColors.primary,
          ),

           BottomNavigationBarItem(
            icon: Icon(Icons.smart_toy_outlined),
            activeIcon: Icon(Icons.smart_toy_outlined,color: AppColors.accent),
            label: 'Chatbot',backgroundColor: AppColors.primary,
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person_outline,color: AppColors.accent),
            label: 'Profile', backgroundColor: AppColors.primary,
          ),
        ],
      ),
    );
  }
}