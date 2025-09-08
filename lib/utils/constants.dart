import 'package:flutter/material.dart';

class AppConstants {
  // App Info
  static const String appName = 'CS 1.6 Pro Guide';
  static const String version = '1.0.0';
  static const String description =
      'Counter-Strike 1.6 o\'yinchilari uchun offline mobil qo\'llanma';

  // Timing
  static const Duration splashDuration = Duration(seconds: 3);
  static const Duration animationDuration = Duration(milliseconds: 300);
  static const Duration quickAnimationDuration = Duration(milliseconds: 150);

  // Spacing
  static const double paddingSmall = 8.0;
  static const double paddingMedium = 16.0;
  static const double paddingLarge = 20.0;
  static const double paddingXLarge = 24.0;

  // Border Radius
  static const double radiusSmall = 8.0;
  static const double radiusMedium = 12.0;
  static const double radiusLarge = 16.0;
  static const double radiusXLarge = 20.0;

  // Icon Sizes
  static const double iconSmall = 16.0;
  static const double iconMedium = 20.0;
  static const double iconLarge = 24.0;
  static const double iconXLarge = 32.0;
  static const double iconXXLarge = 40.0;

  // Elevation
  static const double elevationLow = 2.0;
  static const double elevationMedium = 4.0;
  static const double elevationHigh = 8.0;

  // Opacity
  static const double opacityLight = 0.1;
  static const double opacityMedium = 0.2;
  static const double opacityDark = 0.3;
  static const double opacityStrong = 0.7;

  // Grid
  static const int gridCrossAxisCount = 2;
  static const double gridAspectRatio = 0.8;
  static const double gridSpacing = 16.0;

  // SharedPreferences Keys
  static const String languageSelectedKey = 'language_selected';
  static const String themeKey = 'theme_mode';
  static const String notificationsKey = 'notifications_enabled';
  static const String autoUpdateKey = 'auto_update';

  // Asset Paths
  static const String assetsImagesPath = 'assets/images/';
  static const String assetsMapsPath = 'assets/images/maps/';
  static const String assetsPlayersPath = 'assets/images/players/';
  static const String assetsTranslationsPath = 'assets/translations/';
}
