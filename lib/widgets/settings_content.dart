import 'package:flutter/material.dart';

class SettingsContent extends StatefulWidget {
  const SettingsContent({super.key});

  @override
  State<SettingsContent> createState() => _SettingsContentState();
}

class _SettingsContentState extends State<SettingsContent>
    with TickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _fadeAnimation;
  bool _autoUpdate = false;
  String _selectedLanguage = 'O\'zbek';

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController!, curve: Curves.easeInOut),
    );
    _animationController!.forward();
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_fadeAnimation == null) {
      return const Center(
        child: CircularProgressIndicator(color: Color(0xFFFF6B35)),
      );
    }

    return FadeTransition(
      opacity: _fadeAnimation!,
      child: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildSectionTitle('Umumiy'),
          _buildLanguageSetting(),
          _buildAutoUpdateSetting(),

          const SizedBox(height: 20),
          _buildSectionTitle('Ilova haqida'),
          _buildAboutSettings(),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Text(
        title,
        style: const TextStyle(
          color: Color(0xFFFF6B35),
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildLanguageSetting() {
    return _buildSettingTile(
      icon: Icons.language,
      title: 'Til',
      subtitle: _selectedLanguage,
      onTap: () {
        _showLanguageDialog();
      },
    );
  }

  Widget _buildAutoUpdateSetting() {
    return _buildSwitchTile(
      icon: Icons.update,
      title: 'Avtomatik yangilash',
      subtitle: 'Yangi versiyalarni avtomatik yuklash',
      value: _autoUpdate,
      onChanged: (value) {
        setState(() {
          _autoUpdate = value;
        });
      },
    );
  }

  Widget _buildAboutSettings() {
    return Column(
      children: [
        _buildSettingTile(
          icon: Icons.info,
          title: 'Ilova haqida',
          subtitle: 'Versiya 1.0.0',
          onTap: () {
            _showAboutDialog();
          },
        ),
        _buildSettingTile(
          icon: Icons.help,
          title: 'Yordam',
          subtitle: 'Foydalanish qo\'llanmasi',
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Yordam ochilmoqda...'),
                backgroundColor: Color(0xFFFF6B35),
              ),
            );
          },
        ),
        _buildSettingTile(
          icon: Icons.share,
          title: 'Ilovani ulashish',
          subtitle: 'Do\'stlaringiz bilan ulashing',
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Ulashish funksiyasi...'),
                backgroundColor: Color(0xFFFF6B35),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildSettingTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Card(
      color: const Color(0xFF2C3E50),
      margin: const EdgeInsets.only(bottom: 8.0),
      child: ListTile(
        leading: Icon(icon, color: const Color(0xFFFF6B35)),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(color: Colors.grey, fontSize: 12),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: Colors.grey,
          size: 16,
        ),
        onTap: onTap,
      ),
    );
  }

  Widget _buildSwitchTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Card(
      color: const Color(0xFF2C3E50),
      margin: const EdgeInsets.only(bottom: 8.0),
      child: SwitchListTile(
        secondary: Icon(icon, color: const Color(0xFFFF6B35)),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(color: Colors.grey, fontSize: 12),
        ),
        value: value,
        onChanged: onChanged,
        activeThumbColor: const Color(0xFFFF6B35),
      ),
    );
  }

  void _showLanguageDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF2C3E50),
        title: const Text('Til tanlash', style: TextStyle(color: Colors.white)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildLanguageOption('O\'zbek', 'uz'),
            _buildLanguageOption('English', 'en'),
            _buildLanguageOption('Русский', 'ru'),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageOption(String name, String code) {
    return ListTile(
      title: Text(name, style: const TextStyle(color: Colors.white)),
      trailing: _selectedLanguage == name
          ? const Icon(Icons.check, color: Color(0xFFFF6B35))
          : null,
      onTap: () {
        setState(() {
          _selectedLanguage = name;
        });
        Navigator.pop(context);
      },
    );
  }

  void _showAboutDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF2C3E50),
        title: const Text(
          'CS 1.6 Pro Guide',
          style: TextStyle(color: Colors.white),
        ),
        content: const Text(
          'Counter-Strike 1.6 o\'yinchilari uchun offline mobil qo\'llanma.\n\n'
          'Versiya: 1.0.0\n'
          'Yaratilgan: 2024\n\n'
          'Barcha ma\'lumotlar offline saqlanadi.',
          style: TextStyle(color: Colors.grey),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Yopish',
              style: TextStyle(color: Color(0xFFFF6B35)),
            ),
          ),
        ],
      ),
    );
  }
}
