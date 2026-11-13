enum BadgeCategory { moon, mars, deepSpace }

class BadgeEntity {
  final String id;
  final String name;
  final BadgeCategory category;
  final bool isCollected;

  const BadgeEntity({
    required this.id,
    required this.name,
    required this.category,
    required this.isCollected,
  });
}