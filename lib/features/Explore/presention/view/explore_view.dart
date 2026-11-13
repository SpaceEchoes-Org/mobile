
import 'package:flutter/material.dart';
import 'package:mobile/core/helper/mynavigator.dart';
import 'package:mobile/core/utils/app_assets.dart';
import 'package:mobile/features/home/presention/view/appolo_view.dart';
import 'package:mobile/features/home/presention/view/sojourner.dart';

class ExploreView extends StatefulWidget {
  const ExploreView({super.key});

  @override
  State<ExploreView> createState() => _ExploreViewState();
}

class _ExploreViewState extends State<ExploreView> {
  int _selectedIndex = 1;

  final List<MissionItem> _missions = [
    MissionItem(
      category: 'THE MOON',
      title: 'Eagle (Apollo 11 Lunar Module)',
      imagePath: AppImages.homemoon,
    ),
    MissionItem(
      category: 'MARS',
      title: 'Opportunity',
      imagePath: AppImages.homemars,
    ),
    MissionItem(
      category: 'DEEP SPACE',
      title: 'Voyager 1',
      imagePath: AppImages.homedeepspace,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A162D),
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(0.0, -0.3),
            radius: 1.2,
            colors: [
              Color(0xFF2B224B),
              Color(0xFF1C1732),
              Color(0xFF141024),
            ],
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(20, 24, 20, 120),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Your Missions',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.3,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      'Your next stop in each destination.',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.65),
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                    const SizedBox(height: 28),

                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _missions.length,
                      separatorBuilder: (_, __) =>
                          const SizedBox(height: 16),
                      itemBuilder: (context, index) {
                        final mission = _missions[index];

                        return _MissionCard(
                          mission: mission,
                          onTap: () {
                            MyNavigator.goTo(
                              context,
                              toPage: index == 0
                                  ? const EagleScreen()
                                  : index == 1
                                      ? const OpportunityScreen()
                                      : const OpportunityScreen(),
                              type: NavigatorType.push,
                            );

                            debugPrint('Tapped on: ${mission.title}');
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Mission Card Widget
class _MissionCard extends StatelessWidget {
  final MissionItem mission;
  final VoidCallback onTap;

  const _MissionCard({
    required this.mission,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(22),
        splashColor: Colors.white.withOpacity(0.08),
        highlightColor: Colors.white.withOpacity(0.04),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          decoration: BoxDecoration(
            color: const Color(0xFF282144).withOpacity(0.75),
            borderRadius: BorderRadius.circular(22),
            border: Border.all(
              color: Colors.white.withOpacity(0.1),
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white.withOpacity(0.12),
                    width: 1,
                  ),
                ),
                child: ClipOval(
                  child: Image.asset(
                    mission.imagePath,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: const Color(0xFF1A162D),
                        child: const Icon(
                          Icons.public,
                          color: Colors.white54,
                        ),
                      );
                    },
                  ),
                ),
              ),

              const SizedBox(width: 16),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      mission.category,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.55),
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2,
                      ),
                    ),

                    const SizedBox(height: 6),

                    Text(
                      mission.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 12),

              Container(
                width: 44,
                height: 44,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFFF6D5A9),
                      Color(0xFFE8B49A),
                    ],
                  ),
                ),
                child: const Icon(
                  Icons.play_arrow_outlined,
                  color: Color(0xFF1A162D),
                  size: 24,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Mission Model
class MissionItem {
  final String category;
  final String title;
  final String imagePath;

  MissionItem({
    required this.category,
    required this.title,
    required this.imagePath,
  });
}
