import '../entities/badge_entity.dart';
import '../repos/badges_repo.dart';

class GetBadgesUseCase {
  final BadgesRepo _repo;

  const GetBadgesUseCase(this._repo);

  Future<List<BadgeEntity>> call() => _repo.getBadges();
}