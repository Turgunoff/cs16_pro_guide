import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../theme/app_theme.dart';
import '../utils/constants.dart';

class ConsoleCodesContent extends StatefulWidget {
  const ConsoleCodesContent({super.key});

  @override
  State<ConsoleCodesContent> createState() => _ConsoleCodesContentState();
}

class _ConsoleCodesContentState extends State<ConsoleCodesContent> {
  String _searchQuery = '';
  String _selectedCategory = 'Barchasi';

  final List<Map<String, dynamic>> _consoleCodes = [
    // Basic Cheat Codes
    {
      'id': 1,
      'title': 'Cheatlarni yoqish',
      'code': 'sv_cheats 1',
      'description': 'Barcha cheat kodlarini faollashtiradi',
      'category': 'Cheat',
    },
    {
      'id': 2,
      'title': 'Barcha qurollar va pul',
      'code': 'impulse 101',
      'description': 'Barcha qurollar va 16,000\$ beradi',
      'category': 'Cheat',
    },
    {
      'id': 3,
      'title': 'God Mode',
      'code': 'god',
      'description': 'O\'yinchini o\'qqa chidamli qilish',
      'category': 'Cheat',
    },
    {
      'id': 4,
      'title': 'Noclip',
      'code': 'noclip',
      'description': 'Devordan o\'tish va uchish imkoniyati',
      'category': 'Cheat',
    },
    {
      'id': 5,
      'title': 'Botlar ko\'rmaydi',
      'code': 'notarget',
      'description': 'Botlar sizni ko\'rmaydi',
      'category': 'Cheat',
    },
    {
      'id': 6,
      'title': 'Gravity o\'zgartirish',
      'code': 'sv_gravity 400',
      'description': 'Tortish kuchini o\'zgartirish (800 - odatiy)',
      'category': 'Cheat',
    },
    {
      'id': 7,
      'title': 'Devordan o\'tadigan o\'q',
      'code': 'gl_zmax 0',
      'description': 'O\'qlar barcha devorlardan o\'tadi',
      'category': 'Cheat',
    },
    {
      'id': 8,
      'title': 'Qorong\'u joyni yoritish',
      'code': 'lambert -1.0001',
      'description': 'Barcha joylar yorug\' ko\'rinadi',
      'category': 'Cheat',
    },
    {
      'id': 9,
      'title': 'Tez yurish',
      'code': 'cl_forwardspeed 999',
      'description': 'Oldinga qarab tez yurish',
      'category': 'Cheat',
    },
    {
      'id': 10,
      'title': 'Orqaga tez yurish',
      'code': 'cl_backspeed 999',
      'description': 'Orqaga qarab tez yurish',
      'category': 'Cheat',
    },
    {
      'id': 11,
      'title': 'Yonga tez yurish',
      'code': 'cl_sidespeed 999',
      'description': 'Yon tomonga tez harakat',
      'category': 'Cheat',
    },
    {
      'id': 12,
      'title': 'Aniq nishonga olish',
      'code': 'sv_clienttrace 999999999',
      'description': 'Istagan o\'q aniq tegadi',
      'category': 'Cheat',
    },

    // Weapons
    {
      'id': 13,
      'title': 'AK-47',
      'code': 'give weapon_ak47',
      'description': 'AK-47 avtomati beradi',
      'category': 'Qurol',
    },
    {
      'id': 14,
      'title': 'M4A1 (Colt)',
      'code': 'give weapon_m4a1',
      'description': 'M4A1 avtomati beradi',
      'category': 'Qurol',
    },
    {
      'id': 15,
      'title': 'AWP Snayper',
      'code': 'give weapon_awp',
      'description': 'AWP snayper miltigini beradi',
      'category': 'Qurol',
    },
    {
      'id': 16,
      'title': 'Desert Eagle',
      'code': 'give weapon_deagle',
      'description': 'Desert Eagle to\'pponchasini beradi',
      'category': 'Qurol',
    },
    {
      'id': 17,
      'title': 'MP5',
      'code': 'give weapon_mp5navy',
      'description': 'MP5 submachine gun beradi',
      'category': 'Qurol',
    },
    {
      'id': 18,
      'title': 'P90',
      'code': 'give weapon_p90',
      'description': 'P90 submachine gun beradi',
      'category': 'Qurol',
    },
    {
      'id': 19,
      'title': 'M3 Shotgun',
      'code': 'give weapon_m3',
      'description': 'M3 to\'pponchasini beradi',
      'category': 'Qurol',
    },
    {
      'id': 20,
      'title': 'Avtomatik Shotgun',
      'code': 'give weapon_xm1014',
      'description': 'XM1014 avtomatik shotgun',
      'category': 'Qurol',
    },
    {
      'id': 21,
      'title': 'Glock-18',
      'code': 'give weapon_glock',
      'description': 'Glock-18 to\'pponchasini beradi',
      'category': 'Qurol',
    },
    {
      'id': 22,
      'title': 'USP',
      'code': 'give weapon_usp',
      'description': 'USP to\'pponchasini beradi',
      'category': 'Qurol',
    },
    {
      'id': 23,
      'title': 'Pichoq',
      'code': 'give weapon_knife',
      'description': 'Pichoq beradi',
      'category': 'Qurol',
    },

    // Bot Commands
    {
      'id': 24,
      'title': 'Terrorist bot qo\'shish',
      'code': 'bot_add_t',
      'description': 'Terrorist jamoasiga bot qo\'shadi',
      'category': 'Bot',
    },
    {
      'id': 25,
      'title': 'CT bot qo\'shish',
      'code': 'bot_add_ct',
      'description': 'Counter-Terrorist jamoasiga bot qo\'shadi',
      'category': 'Bot',
    },
    {
      'id': 26,
      'title': 'Botlarni o\'chirish',
      'code': 'bot_kick',
      'description': 'Barcha botlarni serverdan chiqaradi',
      'category': 'Bot',
    },
    {
      'id': 27,
      'title': 'Botlarni to\'xtatish',
      'code': 'bot_stop 1',
      'description': 'Botlarni harakatlantirmaslik',
      'category': 'Bot',
    },
    {
      'id': 28,
      'title': 'Botlarni qayta ishga tushirish',
      'code': 'bot_stop 0',
      'description': 'Botlarni yana harakatlantirish',
      'category': 'Bot',
    },
    {
      'id': 29,
      'title': 'Faqat pichoq',
      'code': 'bot_knives_only',
      'description': 'Botlarni faqat pichoq bilan jang qilishga majbur qilish',
      'category': 'Bot',
    },
    {
      'id': 30,
      'title': 'Faqat snayper',
      'code': 'bot_snipers_only',
      'description': 'Botlarga faqat snayper berish',
      'category': 'Bot',
    },
    {
      'id': 31,
      'title': 'Faqat pistolet',
      'code': 'bot_pistols_only',
      'description': 'Botlarga faqat pistolet berish',
      'category': 'Bot',
    },
    {
      'id': 32,
      'title': 'Bot qiyinchilik',
      'code': 'bot_difficulty 2',
      'description': 'Botlarning qiyinchilik darajasi (0-3)',
      'category': 'Bot',
    },

    // Server Settings
    {
      'id': 33,
      'title': 'C4 timer',
      'code': 'mp_c4timer 35',
      'description': 'C4 bombani portlash vaqtini o\'zgartirish',
      'category': 'Server',
    },
    {
      'id': 34,
      'title': 'Boshlang\'ich pul',
      'code': 'mp_startmoney 16000',
      'description': 'Raund boshida berilgan pul miqdori',
      'category': 'Server',
    },
    {
      'id': 35,
      'title': 'Server restart',
      'code': 'sv_restart 1',
      'description': 'Serverni qayta yuklash',
      'category': 'Server',
    },
    {
      'id': 36,
      'title': 'Friendly Fire',
      'code': 'mp_friendlyfire 1',
      'description': 'Sherikni o\'ldirish imkoniyati (1-yoq, 0-o\'chir)',
      'category': 'Server',
    },
    {
      'id': 37,
      'title': 'Raund vaqti',
      'code': 'mp_roundtime 5',
      'description': 'Raund davomiyligini belgilash (daqiqalarda)',
      'category': 'Server',
    },
    {
      'id': 38,
      'title': 'Freeze vaqti',
      'code': 'mp_freezetime 3',
      'description': 'Raund boshida muzlatish vaqti',
      'category': 'Server',
    },
    {
      'id': 39,
      'title': 'Oyun vaqti',
      'code': 'mp_timelimit 30',
      'description': 'Umumiy o\'yin vaqti chegarasi',
      'category': 'Server',
    },
    {
      'id': 40,
      'title': 'Qadamlar izi',
      'code': 'mp_footsteps 1',
      'description': 'Qadamlar izini yoqish/o\'chirish',
      'category': 'Server',
    },
    {
      'id': 41,
      'title': 'Xarita o\'zgartirish',
      'code': 'changelevel de_dust2',
      'description': 'Boshqa xaritaga o\'tish',
      'category': 'Server',
    },

    // Display Settings
    {
      'id': 42,
      'title': 'Chap qo\'l',
      'code': 'cl_righthand 0',
      'description': 'Qurolni chap qo\'lga olish',
      'category': 'Display',
    },
    {
      'id': 43,
      'title': 'O\'ng qo\'l',
      'code': 'cl_righthand 1',
      'description': 'Qurolni o\'ng qo\'lga olish',
      'category': 'Display',
    },
    {
      'id': 44,
      'title': 'Uchinchi shaxs',
      'code': 'thirdperson',
      'description': 'Uchinchi shaxs ko\'rinishi',
      'category': 'Display',
    },
    {
      'id': 45,
      'title': 'Crosshair o\'zgartirish',
      'code': 'adjust_crosshair',
      'description': 'Nishongah rangini o\'zgartirish',
      'category': 'Display',
    },
    {
      'id': 46,
      'title': 'Qolgan vaqt',
      'code': 'timeleft',
      'description': 'Raundda qolgan vaqtni ko\'rsatish',
      'category': 'Display',
    },
    {
      'id': 47,
      'title': 'Boshqa o\'yinchilarni ko\'rish',
      'code': 'cl_hidefrags 0',
      'description': 'Boshqa o\'yinchilarni ko\'rish',
      'category': 'Display',
    },
    {
      'id': 48,
      'title': 'Avtomatik qayta yuklash yoqish',
      'code': '+reload',
      'description': 'Avtomatik qayta yuklashni yoqish',
      'category': 'Display',
    },
    {
      'id': 49,
      'title': 'Avtomatik qayta yuklash o\'chirish',
      'code': '-reload',
      'description': 'Avtomatik qayta yuklashni o\'chirish',
      'category': 'Display',
    },
  ];
  List<Map<String, dynamic>> get _filteredCodes {
    return _consoleCodes.where((code) {
      final matchesSearch =
          code['title'].toString().toLowerCase().contains(
            _searchQuery.toLowerCase(),
          ) ||
          code['code'].toString().toLowerCase().contains(
            _searchQuery.toLowerCase(),
          );
      final matchesCategory =
          _selectedCategory == 'Barchasi' ||
          code['category'] == _selectedCategory;
      return matchesSearch && matchesCategory;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: AppColors.backgroundGradient,
        ),
      ),
      child: Column(
        children: [
          _buildSearchBar(),
          _buildCategoryTabs(),
          Expanded(child: _buildCodeList()),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.backgroundCard,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.primaryOpacity20),
      ),
      child: TextField(
        style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textPrimary),
        decoration: InputDecoration(
          hintText: 'Kod qidirish...',
          hintStyle: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.textQuaternary,
          ),
          prefixIcon: Icon(Icons.search, color: AppColors.primary, size: 20),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
        ),
        onChanged: (value) => setState(() => _searchQuery = value),
      ),
    );
  }

  Widget _buildCategoryTabs() {
    final categories = [
      'Barchasi',
      'Cheat',
      'Qurol',
      'Bot',
      'Server',
      'Display',
    ];

    return Container(
      height: 45,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          final isSelected = _selectedCategory == category;

          return GestureDetector(
            onTap: () => setState(() => _selectedCategory = category),
            child: Container(
              margin: const EdgeInsets.only(right: 8),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.primary
                    : AppColors.backgroundTertiary,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: isSelected
                      ? AppColors.primary
                      : AppColors.primaryOpacity30,
                ),
              ),
              child: Center(
                child: Text(
                  category,
                  style: AppTextStyles.labelMedium.copyWith(
                    color: isSelected ? Colors.white : AppColors.primary,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildCodeList() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _filteredCodes.length,
      itemBuilder: (context, index) =>
          _buildCompactCodeCard(_filteredCodes[index]),
    );
  }

  Widget _buildCompactCodeCard(Map<String, dynamic> code) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: AppColors.backgroundCard,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.primaryOpacity20),
      ),
      child: ListTile(
        dense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        leading: Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: _getCategoryColor(code['category']),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Center(
            child: Text(
              code['category'][0],
              style: AppTextStyles.labelSmall.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ),
        title: Text(
          code['title'],
          style: AppTextStyles.titleSmall.copyWith(fontSize: 14),
        ),
        subtitle: Container(
          margin: const EdgeInsets.only(top: 4),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: AppColors.backgroundPrimary,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: AppColors.primaryOpacity20),
          ),
          child: Text(
            code['code'],
            style: AppTextStyles.codeStyle.copyWith(fontSize: 12),
          ),
        ),
        trailing: GestureDetector(
          onTap: () => _copyToClipboard(code['code'], code['title']),
          child: Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: AppColors.primaryOpacity20,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(Icons.copy, color: AppColors.primary, size: 16),
          ),
        ),
      ),
    );
  }

  Color _getCategoryColor(String category) {
    switch (category) {
      case 'Cheat':
        return AppColors.error;
      case 'Qurol':
        return AppColors.warning;
      case 'Bot':
        return AppColors.info;
      case 'Server':
        return AppColors.success;
      case 'Display':
        return AppColors.accent;
      default:
        return AppColors.primary;
    }
  }

  void _copyToClipboard(String code, String title) {
    Clipboard.setData(ClipboardData(text: code));

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.check_circle, color: AppColors.success, size: 16),
            const SizedBox(width: 8),
            Text(
              '$title kodi nusxalandi!',
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
        backgroundColor: AppColors.backgroundCard,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 1),
        margin: const EdgeInsets.all(16),
      ),
    );
  }
}
