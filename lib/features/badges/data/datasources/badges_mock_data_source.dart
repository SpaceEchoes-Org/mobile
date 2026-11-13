import '../models/badge_model.dart';


class BadgesMockDataSource {
  Future<List<BadgeModel>> getBadges() async {
    await Future.delayed(const Duration(milliseconds: 400));
    return _mockJson.map(BadgeModel.fromJson).toList();
  }

  static const List<Map<String, dynamic>> _mockJson = [
    // The Moon
    {'id': 'eagle', 'name': 'Eagle', 'category': 'moon', 'isCollected': true},
    {'id': 'lrv', 'name': 'Lunar Roving Vehicle', 'category': 'moon', 'isCollected': false},
    {'id': 'llrr', 'name': 'Lunar Laser Ranging Retroreflector', 'category': 'moon', 'isCollected': false},
    // Mars
    {'id': 'sojourner', 'name': 'Sojourner', 'category': 'mars', 'isCollected': false},
    {'id': 'spirit', 'name': 'Spirit', 'category': 'mars', 'isCollected': false},
    {'id': 'opportunity', 'name': 'Opportunity', 'category': 'mars', 'isCollected': false},
    // Deep Space
    {'id': 'pioneer10', 'name': 'Pioneer 10', 'category': 'deepSpace', 'isCollected': false},
    {'id': 'voyager1', 'name': 'Voyager 1', 'category': 'deepSpace', 'isCollected': false},
    {'id': 'newhorizons', 'name': 'New Horizons', 'category': 'deepSpace', 'isCollected': false},
  ];
}