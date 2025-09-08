import 'package:flutter/material.dart';

class AppColors {
  // CS 1.6 themed colors - Gaming palette
  static const Color primary = Color(0xFFFF6B35); // Counter-Strike orange
  static const Color primaryDark = Color(0xFFE85A2B); // Darker orange
  static const Color primaryLight = Color(0xFFFF8A5C); // Lighter orange

  static const Color secondary = Color(0xFF2C3E50); // Steel blue
  static const Color secondaryDark = Color(0xFF1A252F); // Darker steel
  static const Color secondaryLight = Color(0xFF34495E); // Lighter steel

  static const Color accent = Color(0xFF00D4FF); // Cyber blue
  static const Color accentDark = Color(0xFF00A8CC); // Darker cyber
  static const Color accentLight = Color(0xFF33DDFF); // Lighter cyber

  // Background colors - Gaming dark theme
  static const Color backgroundPrimary = Color(0xFF0A0A0A); // Pure black base
  static const Color backgroundSecondary = Color(0xFF1A1A1A); // Dark grey
  static const Color backgroundTertiary = Color(0xFF2D2D2D); // Medium grey
  static const Color backgroundCard = Color(0xFF1E1E1E); // Card background

  // Surface colors with neon glow effect
  static const Color surfaceDark = Color(0xFF181818);
  static const Color surfaceMedium = Color(0xFF252525);
  static const Color surfaceLight = Color(0xFF323232);

  // Text colors - High contrast for gaming
  static const Color textPrimary = Color(0xFFFFFFFF); // Pure white
  static const Color textSecondary = Color(0xFFE0E0E0); // Light grey
  static const Color textTertiary = Color(0xFFB0B0B0); // Medium grey
  static const Color textQuaternary = Color(0xFF808080); // Dark grey
  static const Color textDisabled = Color(0xFF404040); // Very dark grey

  // Status colors - Gaming inspired
  static const Color success = Color(0xFF00FF88); // Neon green
  static const Color successDark = Color(0xFF00CC6A); // Darker green
  static const Color error = Color(0xFFFF3366); // Neon red
  static const Color errorDark = Color(0xFFCC1A4D); // Darker red
  static const Color warning = Color(0xFFFFCC00); // Gaming yellow
  static const Color warningDark = Color(0xFFCC9900); // Darker yellow
  static const Color info = Color(0xFF3399FF); // Gaming blue
  static const Color infoDark = Color(0xFF1A7ACC); // Darker blue

  // Special gaming colors
  static const Color neonPink = Color(0xFFFF10F0); // Neon pink
  static const Color neonPurple = Color(0xFF8A2BE2); // Blue violet
  static const Color neonGreen = Color(0xFF39FF14); // Electric green
  static const Color neonYellow = Color(0xFFFFFF00); // Electric yellow

  // Weapon rarity colors (CS inspired)
  static const Color rarityCommon = Color(0xFF9DA1A9); // Grey
  static const Color rarityUncommon = Color(0xFF5E98D9); // Blue
  static const Color rarityRare = Color(0xFF4B69FF); // Purple
  static const Color rarityMythical = Color(0xFF8847FF); // Pink
  static const Color rarityLegendary = Color(0xFFEB4B4B); // Red
  static const Color rarityAncient = Color(0xFFE4AE39); // Gold

  // Gradient colors for effects
  static const List<Color> primaryGradient = [
    Color(0xFFFF6B35),
    Color(0xFFFF8A5C),
  ];

  static const List<Color> backgroundGradient = [
    Color(0xFF0A0A0A),
    Color(0xFF1A1A1A),
    Color(0xFF2C3E50),
  ];

  static const List<Color> neonGradient = [
    Color(0xFF00D4FF),
    Color(0xFFFF6B35),
    Color(0xFFFF10F0),
  ];

  // Pre-defined opacity variants (const uchun)
  static const Color primaryOpacity10 = Color(0x1AFF6B35); // 10% opacity
  static const Color primaryOpacity20 = Color(0x33FF6B35); // 20% opacity
  static const Color primaryOpacity30 = Color(0x4DFF6B35); // 30% opacity
  static const Color primaryOpacity70 = Color(0xB3FF6B35); // 70% opacity

  static const Color secondaryOpacity10 = Color(0x1A2C3E50);
  static const Color secondaryOpacity20 = Color(0x332C3E50);
  static const Color secondaryOpacity30 = Color(0x4D2C3E50);
  static const Color secondaryOpacity70 = Color(0xB32C3E50);

  static const Color accentOpacity10 = Color(0x1A00D4FF);
  static const Color accentOpacity20 = Color(0x3300D4FF);
  static const Color accentOpacity30 = Color(0x4D00D4FF);
  static const Color accentOpacity70 = Color(0xB300D4FF);

  static const Color whiteOpacity10 = Color(0x1AFFFFFF);
  static const Color whiteOpacity20 = Color(0x33FFFFFF);
  static const Color whiteOpacity30 = Color(0x4DFFFFFF);
  static const Color whiteOpacity70 = Color(0xB3FFFFFF);

  static const Color blackOpacity10 = Color(0x1A000000);
  static const Color blackOpacity20 = Color(0x33000000);
  static const Color blackOpacity30 = Color(0x4D000000);
  static const Color blackOpacity70 = Color(0xB3000000);

  // Transparency variants (runtime uchun)
  static Color primaryWithOpacity(double opacity) =>
      primary.withOpacity(opacity);
  static Color secondaryWithOpacity(double opacity) =>
      secondary.withOpacity(opacity);
  static Color accentWithOpacity(double opacity) => accent.withOpacity(opacity);
  static Color whiteWithOpacity(double opacity) =>
      Colors.white.withOpacity(opacity);
  static Color blackWithOpacity(double opacity) =>
      Colors.black.withOpacity(opacity);
}
