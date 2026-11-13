import '../../domain/entities/badge_entity.dart';

class BadgeModel extends BadgeEntity {
  const BadgeModel({
    required super.id,
    required super.name,
    required super.category,
    required super.isCollected,
  });

  factory BadgeModel.fromJson(Map<String, dynamic> json) {
    return BadgeModel(
      id: json['id'] as String,
      name: json['name'] as String,
      category: BadgeCategory.values.firstWhere(
            (c) => c.name == json['category'],
        orElse: () => BadgeCategory.moon,
      ),
      isCollected: json['isCollected'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'category': category.name,
    'isCollected': isCollected,
  };
}