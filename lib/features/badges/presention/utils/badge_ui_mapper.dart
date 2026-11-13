import 'package:flutter/material.dart';
import '../../domain/entities/badge_entity.dart';


abstract class BadgeUiMapper {
  static String categoryTitle(BadgeCategory c) {
    switch (c) {
      case BadgeCategory.moon:
        return 'THE MOON';
      case BadgeCategory.mars:
        return 'MARS';
      case BadgeCategory.deepSpace:
        return 'DEEP SPACE';
    }
  }

  static IconData icon(String badgeId) {
    switch (badgeId) {
      case 'eagle':
        return Icons.flight_land_rounded;
      case 'lrv':
        return Icons.directions_car_filled_outlined;
      case 'llrr':
        return Icons.diamond_outlined;
      case 'sojourner':
        return Icons.settings_suggest_outlined;
      case 'spirit':
        return Icons.biotech_outlined;
      case 'opportunity':
        return Icons.directions_run_rounded;
      case 'pioneer10':
        return Icons.rocket_outlined;
      case 'voyager1':
        return Icons.satellite_alt_outlined;
      case 'newhorizons':
        return Icons.ac_unit_rounded;
      default:
        return Icons.star_outline_rounded;
    }
  }
}