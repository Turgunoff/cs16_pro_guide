import 'package:flutter/material.dart';

class ProPlayersContent extends StatefulWidget {
  const ProPlayersContent({super.key});

  @override
  State<ProPlayersContent> createState() => _ProPlayersContentState();
}

class _ProPlayersContentState extends State<ProPlayersContent> {
  final List<Map<String, dynamic>> _players = [
    {
      'name': 'f0rest',
      'realName': 'Patrik Lindberg',
      'country': 'Sweden',
      'team': 'SK Gaming',
      'position': 'Rifler',
      'achievements': ['WCG 2006 Champion', 'CPL 2005 World Tour'],
      'photo': 'assets/images/players/forest.jpg',
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
  ];

  String _searchQuery = '';
  String _selectedCountry = 'Barchasi';

  @override
  Widget build(BuildContext context) {
    final filteredPlayers = _getFilteredPlayers();

    return Column(
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
                child: const Icon(
                  Icons.person,
                  color: Color(0xFFFF6B35),
                  size: 30,
                ),
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
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF2C3E50),
      isScrollControlled: true,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.7,
        maxChildSize: 0.9,
        minChildSize: 0.5,
        builder: (context, scrollController) => SingleChildScrollView(
          controller: scrollController,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 4,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: const Color(0xFFFF6B35).withOpacity(0.2),
                      child: const Icon(
                        Icons.person,
                        color: Color(0xFFFF6B35),
                        size: 40,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            player['name'],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            player['realName'],
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                _buildDetailSection('Mamlakat', player['country'], Icons.flag),
                _buildDetailSection('Jamoa', player['team'], Icons.group),
                _buildDetailSection(
                  'Pozitsiya',
                  player['position'],
                  Icons.sports_esports,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Yutuqlar',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                ...player['achievements']
                    .map<Widget>(
                      (achievement) => Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.emoji_events,
                              color: Colors.amber,
                              size: 16,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                achievement,
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            '${player['name']} sozlamalari ochilmoqda...',
                          ),
                          backgroundColor: const Color(0xFFFF6B35),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF6B35),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: const Text(
                      'Sozlamalarni ko\'rish',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailSection(String title, String value, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFFFF6B35), size: 20),
          const SizedBox(width: 12),
          Text(
            '$title: ',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(value, style: const TextStyle(color: Colors.grey, fontSize: 16)),
        ],
      ),
    );
  }
}
