import 'package:flutter/material.dart';

class ProPlayersContent extends StatefulWidget {
  const ProPlayersContent({super.key});

  @override
  State<ProPlayersContent> createState() => _ProPlayersContentState();
}

class _ProPlayersContentState extends State<ProPlayersContent>
    with TickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _fadeAnimation;
  final List<Map<String, dynamic>> _players = [
    {
      'name': 'f0rest',
      'realName': 'Patrik Lindberg',
      'country': 'Sweden',
      'team': 'SK Gaming',
      'position': 'Rifler',
      'achievements': ['WCG 2006 Champion', 'CPL 2005 World Tour'],
      'photo': 'assets/images/maps/nuke.png',
    },
    {
      'name': 'neo',
      'realName': 'Filip Kubski',
      'country': 'Poland',
      'team': 'Virtus.pro',
      'position': 'IGL',
      'achievements': ['WCG 2009 Champion', 'ESWC 2008'],
      'photo': 'assets/images/players/neo.jpg',
    },
    {
      'name': 'HeatoN',
      'realName': 'Emil Christensen',
      'country': 'Sweden',
      'team': 'SK Gaming',
      'position': 'AWP',
      'achievements': ['CPL 2003 Champion', 'WCG 2003'],
      'photo': 'assets/images/players/heaton.jpg',
    },
    {
      'name': 'Potti',
      'realName': 'Tommy Ingemarsson',
      'country': 'Sweden',
      'team': 'SK Gaming',
      'position': 'Rifler',
      'achievements': ['CPL 2001 Champion', 'WCG 2001'],
      'photo': 'assets/images/players/potti.jpg',
    },
    {
      'name': 'SpawN',
      'realName': 'Abdisamad Mohamed',
      'country': 'Sweden',
      'team': 'SK Gaming',
      'position': 'Rifler',
      'achievements': ['CPL 2004 Champion', 'ESWC 2004'],
      'photo': 'assets/images/players/spawn.jpg',
    },
    {
      'name': 'zet',
      'realName': 'Marcus Sundström',
      'country': 'Sweden',
      'team': 'NiP',
      'position': 'Rifler',
      'achievements': ['WCG 2005 Champion', 'CPL 2005'],
      'photo': 'assets/images/players/zet.jpg',
    },
    {
      'name': 'markeloff',
      'realName': 'Yegor Markelov',
      'country': 'Ukraine',
      'team': 'Natus Vincere',
      'position': 'AWP',
      'achievements': ['IEM IV World Champion', 'ESWC 2010 Champion'],
      'photo': 'assets/images/players/markeloff.jpg',
    },
    {
      'name': 'Edward',
      'realName': 'Ioann Sukhariev',
      'country': 'Ukraine',
      'team': 'Natus Vincere',
      'position': 'Rifler',
      'achievements': ['IEM IV World Champion', 'ESWC 2010 Champion'],
      'photo': 'assets/images/players/edward.jpg',
    },
    {
      'name': 'ceh9',
      'realName': 'Arseniy Trynozhenko',
      'country': 'Ukraine',
      'team': 'Natus Vincere',
      'position': 'Support',
      'achievements': ['IEM IV World Champion', 'ESWC 2010 Champion'],
      'photo': 'assets/images/players/ceh9.jpg',
    },
    {
      'name': 'starix',
      'realName': 'Sergey Ischuk',
      'country': 'Ukraine',
      'team': 'Natus Vincere',
      'position': 'Rifler',
      'achievements': ['IEM IV World Champion', 'ESWC 2010 Champion'],
      'photo': 'assets/images/players/starix.jpg',
    },
    {
      'name': 'Zeus',
      'realName': 'Danylo Teslenko',
      'country': 'Ukraine',
      'team': 'Natus Vincere',
      'position': 'IGL',
      'achievements': ['IEM IV World Champion', 'ESWC 2010 Champion'],
      'photo': 'assets/images/players/zeus.jpg',
    },
    {
      'name': 'kuben',
      'realName': 'Jakub Gurczyński',
      'country': 'Poland',
      'team': 'Virtus.pro',
      'position': 'Support',
      'achievements': ['WCG 2009 Champion', 'ESWC 2008'],
      'photo': 'assets/images/players/kuben.jpg',
    },
    {
      'name': 'TaZ',
      'realName': 'Wiktor Wojtas',
      'country': 'Poland',
      'team': 'Virtus.pro',
      'position': 'Rifler',
      'achievements': ['WCG 2009 Champion', 'ESWC 2008'],
      'photo': 'assets/images/players/taz.jpg',
    },
    {
      'name': 'Loord',
      'realName': 'Mariusz Cybulski',
      'country': 'Poland',
      'team': 'Virtus.pro',
      'position': 'Support',
      'achievements': ['WCG 2009 Champion', 'ESWC 2008'],
      'photo': 'assets/images/players/loord.jpg',
    },
    {
      'name': 'LUq',
      'realName': 'Łukasz Wnęk',
      'country': 'Poland',
      'team': 'Virtus.pro',
      'position': 'AWP',
      'achievements': ['WCG 2009 Champion', 'ESWC 2008'],
      'photo': 'assets/images/players/luq.jpg',
    },
    {
      'name': 'walle',
      'realName': 'Dennis Wallenberg',
      'country': 'Sweden',
      'team': 'SK Gaming',
      'position': 'AWP',
      'achievements': ['WCG 2006 Champion', 'CPL 2005 World Tour'],
      'photo': 'assets/images/players/walle.jpg',
    },
    {
      'name': 'RobbaN',
      'realName': 'Robert Dahlström',
      'country': 'Sweden',
      'team': 'SK Gaming',
      'position': 'IGL',
      'achievements': ['WCG 2006 Champion', 'CPL 2005 World Tour'],
      'photo': 'assets/images/players/robban.jpg',
    },
    {
      'name': 'dsn',
      'realName': 'Harley Örwall',
      'country': 'Sweden',
      'team': 'Fnatic',
      'position': 'AWP',
      'achievements': ['WCG 2009 Champion', 'IEM III Champion'],
      'photo': 'assets/images/players/dsn.jpg',
    },
    {
      'name': 'cArn',
      'realName': 'Patrik Sättermon',
      'country': 'Sweden',
      'team': 'Fnatic',
      'position': 'IGL',
      'achievements': ['WCG 2009 Champion', 'IEM III Champion'],
      'photo': 'assets/images/players/carn.jpg',
    },
    {
      'name': 'fisker',
      'realName': 'Michael Fisk',
      'country': 'Sweden',
      'team': 'SK Gaming',
      'position': 'Rifler',
      'achievements': ['CPL 2001 Champion', 'WCG 2001'],
      'photo': 'assets/images/players/fisker.jpg',
    },
    {
      'name': 'roman',
      'realName': 'Roman Ausserdorfer',
      'country': 'Germany',
      'team': 'mousesports',
      'position': 'Rifler',
      'achievements': ['IEM III European Champion'],
      'photo': 'assets/images/players/roman.jpg',
    },
    {
      'name': 'gob b',
      'realName': 'Fatih Dayik',
      'country': 'Germany',
      'team': 'mousesports',
      'position': 'IGL',
      'achievements': ['IEM III European Champion'],
      'photo': 'assets/images/players/gobb.jpg',
    },
    {
      'name': 'karrigan',
      'realName': 'Finn Andersen',
      'country': 'Denmark',
      'team': 'mousesports',
      'position': 'Rifler',
      'achievements': ['IEM III European Champion'],
      'photo': 'assets/images/players/karrigan.jpg',
    },
    {
      'name': 'trace',
      'realName': 'Martin Heldt',
      'country': 'Denmark',
      'team': 'mTw',
      'position': 'Rifler',
      'achievements': ['WCG 2008 Champion'],
      'photo': 'assets/images/players/trace.jpg',
    },
    {
      'name': 'zonic',
      'realName': 'Danny Sørensen',
      'country': 'Denmark',
      'team': 'mTw',
      'position': 'Rifler',
      'achievements': ['WCG 2008 Champion'],
      'photo': 'assets/images/players/zonic.jpg',
    },
    {
      'name': 'ave',
      'realName': 'Alexander Holdt',
      'country': 'Denmark',
      'team': 'mTw',
      'position': 'IGL',
      'achievements': ['WCG 2008 Champion'],
      'photo': 'assets/images/players/ave.jpg',
    },
  ];

  String _searchQuery = '';
  String _selectedCountry = 'Barchasi';

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

    final filteredPlayers = _getFilteredPlayers();

    return FadeTransition(
      opacity: _fadeAnimation!,
      child: Column(
        children: [
          _buildSearchAndFilter(),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: filteredPlayers.length,
              itemBuilder: (context, index) {
                return _buildPlayerCard(filteredPlayers[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchAndFilter() {
    return Container(
      color: const Color(0xFF2C3E50),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: 'O\'yinchini qidirish...',
              hintStyle: const TextStyle(color: Colors.grey),
              prefixIcon: const Icon(Icons.search, color: Color(0xFFFF6B35)),
              filled: true,
              fillColor: const Color(0xFF1A1A1A),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
            onChanged: (value) {
              setState(() {
                _searchQuery = value;
              });
            },
          ),
          const SizedBox(height: 12),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildFilterChip('Barchasi', 'Barchasi'),
                const SizedBox(width: 8),
                _buildFilterChip('Sweden', 'Sweden'),
                const SizedBox(width: 8),
                _buildFilterChip('Poland', 'Poland'),
                const SizedBox(width: 8),
                _buildFilterChip('USA', 'USA'),
                const SizedBox(width: 8),
                _buildFilterChip('Germany', 'Germany'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, String value) {
    final isSelected = _selectedCountry == value;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedCountry = value;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFFF6B35) : const Color(0xFF1A1A1A),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xFFFF6B35).withOpacity(0.3)),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : const Color(0xFFFF6B35),
            fontWeight: FontWeight.w500,
            fontSize: 12,
          ),
        ),
      ),
    );
  }

  Widget _buildPlayerCard(Map<String, dynamic> player) {
    return Card(
      color: const Color(0xFF2C3E50),
      margin: const EdgeInsets.only(bottom: 12.0),
      child: InkWell(
        onTap: () {
          _showPlayerDetails(player);
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: const Color(0xFFFF6B35).withOpacity(0.2),
                backgroundImage:
                    player['photo'] != null && player['photo'].isNotEmpty
                    ? AssetImage(player['photo'])
                    : null,
                onBackgroundImageError: (exception, stackTrace) {
                  // Handle image loading error - fallback to icon
                },
                child: player['photo'] == null || player['photo'].isEmpty
                    ? const Icon(
                        Icons.person,
                        color: Color(0xFFFF6B35),
                        size: 30,
                      )
                    : null,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      player['name'],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      player['realName'],
                      style: const TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        _buildInfoChip(
                          Icons.flag,
                          player['country'],
                          const Color(0xFFFF6B35),
                        ),
                        const SizedBox(width: 8),
                        _buildInfoChip(
                          Icons.group,
                          player['team'],
                          Colors.blue,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        _buildInfoChip(
                          Icons.sports_esports,
                          player['position'],
                          Colors.green,
                        ),
                        const SizedBox(width: 8),
                        _buildInfoChip(
                          Icons.emoji_events,
                          '${player['achievements'].length} yutuq',
                          Colors.amber,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoChip(IconData icon, String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.5)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 12),
          const SizedBox(width: 4),
          Text(
            text,
            style: TextStyle(
              color: color,
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  List<Map<String, dynamic>> _getFilteredPlayers() {
    return _players.where((player) {
      final matchesSearch =
          player['name'].toLowerCase().contains(_searchQuery.toLowerCase()) ||
          player['realName'].toLowerCase().contains(
            _searchQuery.toLowerCase(),
          ) ||
          player['team'].toLowerCase().contains(_searchQuery.toLowerCase());

      final matchesCountry =
          _selectedCountry == 'Barchasi' ||
          player['country'] == _selectedCountry;

      return matchesSearch && matchesCountry;
    }).toList();
  }

  void _showPlayerDetails(Map<String, dynamic> player) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF2C3E50),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Katta player rasmi yuqorida
                Container(
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        const Color(0xFFFF6B35).withOpacity(0.1),
                        const Color(0xFF2C3E50),
                      ],
                    ),
                  ),
                  child: Stack(
                    children: [
                      // Player rasmi
                      Center(
                        child: Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: const Color(0xFFFF6B35),
                              width: 4,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFFFF6B35).withOpacity(0.3),
                                blurRadius: 20,
                                spreadRadius: 5,
                              ),
                            ],
                          ),
                          child: ClipOval(
                            child:
                                player['photo'] != null &&
                                    player['photo'].isNotEmpty
                                ? Image.asset(
                                    player['photo'],
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        color: const Color(
                                          0xFFFF6B35,
                                        ).withOpacity(0.2),
                                        child: const Icon(
                                          Icons.person,
                                          color: Color(0xFFFF6B35),
                                          size: 80,
                                        ),
                                      );
                                    },
                                  )
                                : Container(
                                    color: const Color(
                                      0xFFFF6B35,
                                    ).withOpacity(0.2),
                                    child: const Icon(
                                      Icons.person,
                                      color: Color(0xFFFF6B35),
                                      size: 80,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                      // Yopish tugmasi
                      Positioned(
                        top: 16,
                        right: 16,
                        child: GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.5),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.close,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Player ma'lumotlari
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Ism va to'liq ism
                      Center(
                        child: Column(
                          children: [
                            Text(
                              player['name'],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.2,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              player['realName'],
                              style: const TextStyle(
                                color: Color(0xFFFF6B35),
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 24),

                      // Asosiy ma'lumotlar
                      _buildInfoCard(
                        'Mamlakat',
                        player['country'],
                        Icons.flag,
                        const Color(0xFF4CAF50),
                      ),
                      _buildInfoCard(
                        'Jamoa',
                        player['team'],
                        Icons.group,
                        const Color(0xFF2196F3),
                      ),
                      _buildInfoCard(
                        'Pozitsiya',
                        player['position'],
                        Icons.sports_esports,
                        const Color(0xFFFF9800),
                      ),

                      const SizedBox(height: 24),

                      // Yutuqlar bo'limi
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: const Color(0xFFFF6B35).withOpacity(0.3),
                            width: 1,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.emoji_events,
                                  color: Colors.amber,
                                  size: 24,
                                ),
                                const SizedBox(width: 8),
                                const Text(
                                  'Yutuqlar',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            ...player['achievements'].map<Widget>(
                              (achievement) => Padding(
                                padding: const EdgeInsets.only(bottom: 12.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 6,
                                      height: 6,
                                      margin: const EdgeInsets.only(
                                        top: 6,
                                        right: 12,
                                      ),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFFF6B35),
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        achievement,
                                        style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 16,
                                          height: 1.4,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard(
    String title,
    String value,
    IconData icon,
    Color iconColor,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: iconColor.withOpacity(0.3), width: 1),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
