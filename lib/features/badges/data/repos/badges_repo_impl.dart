import '../../domain/entities/badge_entity.dart';
import '../../domain/repos/badges_repo.dart';
import '../datasources/badges_mock_data_source.dart';

class BadgesRepoImpl implements BadgesRepo {
  final BadgesMockDataSource _dataSource;

  const BadgesRepoImpl(this._dataSource);

  @override
  Future<List<BadgeEntity>> getBadges() => _dataSource.getBadges();
}