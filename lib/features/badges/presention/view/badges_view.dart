import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';
import '../../data/datasources/badges_mock_data_source.dart';
import '../../data/repos/badges_repo_impl.dart';
import '../../domain/entities/badge_entity.dart';
import '../../domain/usecases/get_badges_usecase.dart';
import '../widget/badge_section.dart';

class BadgesView extends StatefulWidget {
  const BadgesView({super.key});

  @override
  State<BadgesView> createState() => _BadgesViewState();
}

class _BadgesViewState extends State<BadgesView> {
  // TODO: move to a DI container (get_it) when the project grows.
  late final GetBadgesUseCase _getBadges =
  GetBadgesUseCase(BadgesRepoImpl(BadgesMockDataSource()));

  late final Future<List<BadgeEntity>> _future = _getBadges();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(gradient: AppGradients.screenBackground),
        child: SafeArea(
          child: FutureBuilder<List<BadgeEntity>>(
            future: _future,
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return const Center(
                  child: CircularProgressIndicator(color: AppColors.accent),
                );
              }
              if (snapshot.hasError || !snapshot.hasData) {
                return const Center(
                  child: Text(
                    'Something went wrong',
                    style: TextStyle(color: AppColors.error),
                  ),
                );
              }
              return _BadgesContent(badges: snapshot.data!);
            },
          ),
        ),
      ),
    );
  }
}

class _BadgesContent extends StatelessWidget {
  final List<BadgeEntity> badges;

  const _BadgesContent({required this.badges});

  @override
  Widget build(BuildContext context) {
    final collected = badges.where((b) => b.isCollected).length;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Mission Badges',
            style: TextStyle(
              color: AppColors.primarytext,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            '$collected of ${badges.length} collected',
            style: const TextStyle(
              color: AppColors.secondarytext,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 24),
          for (final category in BadgeCategory.values) ...[
            BadgeSection(
              category: category,
              badges: badges.where((b) => b.category == category).toList(),
            ),
            const SizedBox(height: 24),
          ],
        ],
      ),
    );
  }
}