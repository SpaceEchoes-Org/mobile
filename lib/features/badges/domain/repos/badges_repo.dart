import '../entities/badge_entity.dart';

abstract class BadgesRepo {
  Future<List<BadgeEntity>> getBadges();
}