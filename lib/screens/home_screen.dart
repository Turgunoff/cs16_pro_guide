import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../theme/app_theme.dart';
import '../widgets/console_codes_content.dart';
import '../widgets/home_content.dart';
import '../widgets/maps_content.dart';
import '../widgets/pro_players_content.dart';
import '../widgets/settings_content.dart';
// import '../widgets/console_codes_content.dart';
// import '../widgets/maps_content.dart';
// import '../widgets/settings_content.dart';
// import '../widgets/pro_players_content.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<String> _titles = [
    'CS 1.6 Pro Guide',
    'Konsol kodlari',
    'Xaritalar',
    'Sozlamalar',
    'Pro o\'yinchilar',
  ];

  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      const HomeContent(),
      const ConsoleCodesContent(),
      const MapsContent(),
      const SettingsContent(),
      const ProPlayersContent(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectedIndex], style: AppTextStyles.appBarTitle),
        backgroundColor: AppColors.secondary,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.textPrimary),
        centerTitle: true,
      ),

      drawer: _buildDrawer(context),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: _screens[_selectedIndex],
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.backgroundSecondary,
      child: Column(
        children: [
          // Compact Header - 180px dan 160px ga
          Container(
            height: 220,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: AppColors.primaryGradient,
              ),
              boxShadow: [AppTheme.subtleGlow],
              image: const DecorationImage(
                image: AssetImage(
                  'assets/images/cs16_background.png',
                ), // Rasmingizning yo'li
                fit: BoxFit.cover,
                opacity: 0.3, // Rasmni biroz shaffof qilish
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.backgroundPrimary.withOpacity(0.7),
                    AppColors.primary.withOpacity(0.8),
                  ],
                ),
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Compact logo
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: AppColors.whiteOpacity20,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: AppColors.whiteOpacity30,
                            width: 1,
                          ),
                        ),
                        child: const Icon(
                          Icons.sports_esports,
                          size: 28,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'CS 1.6 PRO',
                        style: AppTextStyles.displaySmall.copyWith(
                          fontSize: 18,
                          letterSpacing: 1.5,
                        ),
                      ),
                      Text(
                        'GUIDE',
                        style: AppTextStyles.cs16Subtitle.copyWith(
                          fontSize: 10,
                          letterSpacing: 2.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Compact Menu Items
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 8),
              children: [
                _buildCompactDrawerItem(
                  context,
                  icon: Icons.home_rounded,
                  title: 'Asosiy',
                  index: 0,
                ),
                _buildCompactDrawerItem(
                  context,
                  icon: Icons.terminal_rounded,
                  title: 'console_codes'.tr(),
                  index: 1,
                ),
                _buildCompactDrawerItem(
                  context,
                  icon: Icons.map_rounded,
                  title: 'maps'.tr(),
                  index: 2,
                ),
                _buildCompactDrawerItem(
                  context,
                  icon: Icons.tune_rounded,
                  title: 'settings'.tr(),
                  index: 3,
                ),
                _buildCompactDrawerItem(
                  context,
                  icon: Icons.people_rounded,
                  title: 'pro_players'.tr(),
                  index: 4,
                ),

                // Divider with style
                Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 16,
                  ),
                  height: 1,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        AppColors.primaryOpacity30,
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),

                // Compact Action Items
                _buildCompactActionItem(
                  context,
                  icon: Icons.info_outline_rounded,
                  title: 'about_app'.tr(),
                  onTap: () => _showAboutDialog(context),
                ),
                _buildCompactActionItem(
                  context,
                  icon: Icons.star_border_rounded,
                  title: 'rate_us'.tr(),
                  onTap: () => _showRateDialog(context),
                ),
                _buildCompactActionItem(
                  context,
                  icon: Icons.language_rounded,
                  title: 'change_language'.tr(),
                  onTap: () => _showLanguageDialog(context),
                ),
              ],
            ),
          ),

          // Bottom signature
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: AppColors.primaryOpacity20, width: 1),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.code_rounded,
                  color: AppColors.primaryOpacity70,
                  size: 16,
                ),
                const SizedBox(width: 8),
                Text(
                  'v1.0.0',
                  style: AppTextStyles.labelSmall.copyWith(
                    color: AppColors.textQuaternary,
                    letterSpacing: 1.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCompactDrawerItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required int index,
  }) {
    final isSelected = _selectedIndex == index;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: isSelected
            ? LinearGradient(
                colors: [
                  AppColors.primaryOpacity20,
                  AppColors.primaryOpacity10,
                ],
              )
            : null,
        border: isSelected
            ? Border.all(color: AppColors.primaryOpacity30, width: 1)
            : null,
      ),
      child: ListTile(
        leading: Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primary : AppColors.primaryOpacity10,
            borderRadius: BorderRadius.circular(8),
            boxShadow: isSelected ? [AppTheme.subtleGlow] : null,
          ),
          child: Icon(
            icon,
            color: isSelected ? Colors.white : AppColors.primary,
            size: 18,
          ),
        ),
        title: Text(
          title,
          style: AppTextStyles.menuItem.copyWith(
            fontSize: 15,
            color: isSelected ? AppColors.textPrimary : AppColors.textSecondary,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
          ),
        ),
        onTap: () {
          Navigator.of(context).pop();
          setState(() {
            _selectedIndex = index;
          });
        },
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
        dense: true,
      ),
    );
  }

  Widget _buildCompactActionItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 1),
      child: ListTile(
        leading: Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: AppColors.primaryOpacity10,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Icon(icon, color: AppColors.primaryOpacity70, size: 16),
        ),
        title: Text(
          title,
          style: AppTextStyles.labelLarge.copyWith(
            fontSize: 14,
            color: AppColors.textTertiary,
          ),
        ),
        onTap: () {
          Navigator.of(context).pop();
          onTap();
        },
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
        dense: true,
      ),
    );
  }

  void _showAboutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF2C3E50),
        title: Text(
          'about_app'.tr(),
          style: const TextStyle(color: Colors.white),
        ),
        content: const Text(
          'CS 1.6 Pro Guide v1.0.0\n\nThe ultimate guide for Counter-Strike 1.6 players.',
          style: TextStyle(color: Colors.white70),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'close'.tr(),
              style: const TextStyle(color: Color(0xFFFF6B35)),
            ),
          ),
        ],
      ),
    );
  }

  void _showRateDialog(BuildContext context) {
    // Rate us functionality
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Rate us functionality...'),
        backgroundColor: Color(0xFFFF6B35),
      ),
    );
  }

  void _showLanguageDialog(BuildContext context) {
    // Language change functionality
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Language change...'),
        backgroundColor: Color(0xFFFF6B35),
      ),
    );
  }
}
