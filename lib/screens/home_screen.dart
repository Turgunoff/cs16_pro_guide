import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../widgets/console_codes_content.dart';
import '../widgets/home_content.dart';
import '../widgets/maps_content.dart';
import '../widgets/pro_players_content.dart';
import '../widgets/settings_content.dart';
import '../widgets/tournaments_content.dart';
// import '../widgets/console_codes_content.dart';
// import '../widgets/maps_content.dart';
// import '../widgets/settings_content.dart';
// import '../widgets/pro_players_content.dart';
// import '../widgets/tournaments_content.dart';

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
    'Turnirlar',
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
      const TournamentsContent(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _titles[_selectedIndex],
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        backgroundColor: const Color(0xFF2C3E50),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
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
      backgroundColor: const Color(0xFF1A1A1A),
      child: Column(
        children: [
          // Drawer Header
          Container(
            height: 200,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFFFF6B35), Color(0xFF2C3E50)],
              ),
            ),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Icon(
                      Icons.sports_esports,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'CS 1.6',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    'PRO GUIDE',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                      letterSpacing: 2,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Menu Items
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildDrawerItem(
                  context,
                  icon: Icons.home,
                  title: 'Asosiy sahifa',
                  subtitle: 'Bosh sahifa',
                  index: 0,
                ),
                _buildDrawerItem(
                  context,
                  icon: Icons.terminal,
                  title: 'console_codes'.tr(),
                  subtitle: 'Cheat codes & commands',
                  index: 1,
                ),
                _buildDrawerItem(
                  context,
                  icon: Icons.map,
                  title: 'maps'.tr(),
                  subtitle: 'Wallbangs & strategies',
                  index: 2,
                ),
                _buildDrawerItem(
                  context,
                  icon: Icons.settings,
                  title: 'settings'.tr(),
                  subtitle: 'Configs & crosshairs',
                  index: 3,
                ),
                _buildDrawerItem(
                  context,
                  icon: Icons.people,
                  title: 'pro_players'.tr(),
                  subtitle: 'Legends & their setups',
                  index: 4,
                ),
                _buildDrawerItem(
                  context,
                  icon: Icons.emoji_events,
                  title: 'tournaments'.tr(),
                  subtitle: 'Major championships',
                  index: 5,
                ),

                const Divider(color: Color(0xFF2C3E50), thickness: 1),

                _buildActionItem(
                  context,
                  icon: Icons.info_outline,
                  title: 'about_app'.tr(),
                  subtitle: 'Version & credits',
                  onTap: () => _showAboutDialog(context),
                ),
                _buildActionItem(
                  context,
                  icon: Icons.star_border,
                  title: 'rate_us'.tr(),
                  subtitle: 'Support the app',
                  onTap: () => _showRateDialog(context),
                ),
                _buildActionItem(
                  context,
                  icon: Icons.language,
                  title: 'change_language'.tr(),
                  subtitle: 'Switch language',
                  onTap: () => _showLanguageDialog(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required int index,
  }) {
    final isSelected = _selectedIndex == index;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: isSelected
            ? const Color(0xFFFF6B35).withOpacity(0.2)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: isSelected
                ? const Color(0xFFFF6B35).withOpacity(0.3)
                : const Color(0xFFFF6B35).withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            color: isSelected
                ? const Color(0xFFFF6B35)
                : const Color(0xFFFF6B35).withOpacity(0.7),
            size: 20,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.white70,
            fontSize: 16,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            color: isSelected ? Colors.white70 : Colors.white54,
            fontSize: 12,
          ),
        ),
        onTap: () {
          // Drawer ni yopish
          Navigator.of(context).pop();

          // Content o'zgartirish
          setState(() {
            _selectedIndex = index;
          });
        },
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      ),
    );
  }

  Widget _buildActionItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: const Color(0xFFFF6B35).withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          icon,
          color: const Color(0xFFFF6B35).withOpacity(0.7),
          size: 20,
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white70,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(color: Colors.white54, fontSize: 12),
      ),
      onTap: () {
        Navigator.of(context).pop(); // Faqat action lar uchun drawer ni yopamiz
        onTap();
      },
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
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
