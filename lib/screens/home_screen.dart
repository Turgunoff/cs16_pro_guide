import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'console_codes_screen.dart';
import 'maps_screen.dart';
import 'settings_screen.dart';
import 'pro_players_screen.dart';
import 'tournaments_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('app_name'.tr()),
        backgroundColor: const Color(0xFF2C3E50),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: _buildDrawer(context),
      body: _buildHomeContent(context),
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
                colors: [
                  Color(0xFFFF6B35),
                  Color(0xFF2C3E50),
                ],
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
                  Text(
                    'CS 1.6',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'PRO GUIDE',
                    style: const TextStyle(
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
                  icon: Icons.terminal,
                  title: 'console_codes'.tr(),
                  subtitle: 'Cheat codes & commands',
                  onTap: () => _navigateToScreen(context, const ConsoleCodesScreen()),
                ),
                _buildDrawerItem(
                  context,
                  icon: Icons.map,
                  title: 'maps'.tr(),
                  subtitle: 'Wallbangs & strategies',
                  onTap: () => _navigateToScreen(context, const MapsScreen()),
                ),
                _buildDrawerItem(
                  context,
                  icon: Icons.settings,
                  title: 'settings'.tr(),
                  subtitle: 'Configs & crosshairs',
                  onTap: () => _navigateToScreen(context, const SettingsScreen()),
                ),
                _buildDrawerItem(
                  context,
                  icon: Icons.people,
                  title: 'pro_players'.tr(),
                  subtitle: 'Legends & their setups',
                  onTap: () => _navigateToScreen(context, const ProPlayersScreen()),
                ),
                _buildDrawerItem(
                  context,
                  icon: Icons.emoji_events,
                  title: 'tournaments'.tr(),
                  subtitle: 'Major championships',
                  onTap: () => _navigateToScreen(context, const TournamentsScreen()),
                ),
                
                const Divider(color: Color(0xFF2C3E50), thickness: 1),
                
                _buildDrawerItem(
                  context,
                  icon: Icons.info_outline,
                  title: 'about_app'.tr(),
                  subtitle: 'Version & credits',
                  onTap: () => _showAboutDialog(context),
                ),
                _buildDrawerItem(
                  context,
                  icon: Icons.star_border,
                  title: 'rate_us'.tr(),
                  subtitle: 'Support the app',
                  onTap: () => _showRateDialog(context),
                ),
                _buildDrawerItem(
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
          color: const Color(0xFFFF6B35),
          size: 20,
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(
          color: Colors.white54,
          fontSize: 12,
        ),
      ),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
    );
  }

  Widget _buildHomeContent(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF1A1A1A),
            Color(0xFF2C3E50),
          ],
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcome section
              Text(
                'welcome_back'.tr(),
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'ready_to_dominate'.tr(),
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                ),
              ),
              
              const SizedBox(height: 30),
              
              // Quick access cards
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  children: [
                    _buildQuickAccessCard(
                      context,
                      'Console Codes',
                      Icons.terminal,
                      '100+ commands',
                      () => _navigateToScreen(context, const ConsoleCodesScreen()),
                    ),
                    _buildQuickAccessCard(
                      context,
                      'Maps',
                      Icons.map,
                      '6 classic maps',
                      () => _navigateToScreen(context, const MapsScreen()),
                    ),
                    _buildQuickAccessCard(
                      context,
                      'Pro Players',
                      Icons.people,
                      '25+ legends',
                      () => _navigateToScreen(context, const ProPlayersScreen()),
                    ),
                    _buildQuickAccessCard(
                      context,
                      'Tournaments',
                      Icons.emoji_events,
                      '20+ majors',
                      () => _navigateToScreen(context, const TournamentsScreen()),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuickAccessCard(
    BuildContext context,
    String title,
    IconData icon,
    String subtitle,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF2C3E50).withOpacity(0.7),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: const Color(0xFFFF6B35).withOpacity(0.3),
            width: 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: const Color(0xFFFF6B35).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  color: const Color(0xFFFF6B35),
                  size: 24,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: const TextStyle(
                  color: Colors.white54,
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToScreen(BuildContext context, Widget screen) {
    Navigator.of(context).pop(); // Close drawer
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => screen),
    );
  }

  void _showAboutDialog(BuildContext context) {
    Navigator.of(context).pop();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF2C3E50),
        title: Text('about_app'.tr(), style: const TextStyle(color: Colors.white)),
        content: const Text(
          'CS 1.6 Pro Guide v1.0.0\n\nThe ultimate guide for Counter-Strike 1.6 players.',
          style: TextStyle(color: Colors.white70),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('close'.tr(), style: const TextStyle(color: Color(0xFFFF6B35))),
          ),
        ],
      ),
    );
  }

  void _showRateDialog(BuildContext context) {
    Navigator.of(context).pop();
    // Rate us functionality
  }

  void _showLanguageDialog(BuildContext context) {
    Navigator.of(context).pop();
    // Language change functionality
  }
}