import 'package:flutter/material.dart';

class TournamentsScreen extends StatefulWidget {
  const TournamentsScreen({super.key});

  @override
  State<TournamentsScreen> createState() => _TournamentsScreenState();
}

class _TournamentsScreenState extends State<TournamentsScreen> {
  final List<Map<String, dynamic>> _tournaments = [
    {
      'name': 'CPL World Tour 2005',
      'date': '2005',
      'location': 'USA',
      'prizePool': '\$150,000',
      'winner': 'SK Gaming',
      'participants': 16,
      'category': 'Major',
      'highlights': 'f0rest va HeatoN jamoasi g\'alaba qozondi',
      'finalScore': '16-14',
    },
    {
      'name': 'WCG 2006',
      'date': '2006',
      'location': 'Italy',
      'prizePool': '\$50,000',
      'winner': 'SK Gaming',
      'participants': 16,
      'category': 'Major',
      'highlights': 'f0rest eng yaxshi o\'yinchilaridan biri',
      'finalScore': '16-10',
    },
    {
      'name': 'ESWC 2008',
      'date': '2008',
      'location': 'France',
      'prizePool': '\$30,000',
      'winner': 'Virtus.pro',
      'participants': 16,
      'category': 'Major',
      'highlights': 'neo va jamoasi g\'alaba qozondi',
      'finalScore': '16-12',
    },
    {
      'name': 'WCG 2009',
      'date': '2009',
      'location': 'China',
      'prizePool': '\$25,000',
      'winner': 'Virtus.pro',
      'participants': 16,
      'category': 'Major',
      'highlights': 'neo ikkinchi marta chempion',
      'finalScore': '16-8',
    },
    {
      'name': 'CPL 2003',
      'date': '2003',
      'location': 'USA',
      'prizePool': '\$100,000',
      'winner': 'SK Gaming',
      'participants': 32,
      'category': 'Major',
      'highlights': 'HeatoN va Potti jamoasi',
      'finalScore': '16-13',
    },
    {
      'name': 'WCG 2001',
      'date': '2001',
      'location': 'South Korea',
      'prizePool': '\$20,000',
      'winner': 'SK Gaming',
      'participants': 16,
      'category': 'Major',
      'highlights': 'Birinchi WCG chempionati',
      'finalScore': '16-11',
    },
  ];

  String _selectedCategory = 'Barchasi';
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final filteredTournaments = _getFilteredTournaments();

    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      appBar: AppBar(
        title: const Text(
          'TURNIRLAR',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        backgroundColor: const Color(0xFF2C3E50),
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          _buildSearchAndFilter(),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: filteredTournaments.length,
              itemBuilder: (context, index) {
                return _buildTournamentCard(filteredTournaments[index]);
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
              hintText: 'Turnirni qidirish...',
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
                _buildFilterChip('Major', 'Major'),
                const SizedBox(width: 8),
                _buildFilterChip('WCG', 'WCG'),
                const SizedBox(width: 8),
                _buildFilterChip('CPL', 'CPL'),
                const SizedBox(width: 8),
                _buildFilterChip('ESWC', 'ESWC'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, String value) {
    final isSelected = _selectedCategory == value;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedCategory = value;
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

  Widget _buildTournamentCard(Map<String, dynamic> tournament) {
    return Card(
      color: const Color(0xFF2C3E50),
      margin: const EdgeInsets.only(bottom: 12.0),
      child: InkWell(
        onTap: () {
          _showTournamentDetails(tournament);
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFF6B35).withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0xFFFF6B35)),
                    ),
                    child: Text(
                      tournament['category'],
                      style: const TextStyle(
                        color: Color(0xFFFF6B35),
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    tournament['date'],
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                tournament['name'],
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: const Color(0xFFFF6B35),
                    size: 16,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    tournament['location'],
                    style: const TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  const SizedBox(width: 16),
                  Icon(Icons.attach_money, color: Colors.green, size: 16),
                  const SizedBox(width: 4),
                  Text(
                    tournament['prizePool'],
                    style: const TextStyle(
                      color: Colors.green,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Icon(Icons.emoji_events, color: Colors.amber, size: 16),
                  const SizedBox(width: 4),
                  Text(
                    'G\'olib: ',
                    style: const TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  Text(
                    tournament['winner'],
                    style: const TextStyle(
                      color: Colors.amber,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '${tournament['participants']} jamoa',
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.sports_esports, color: Colors.blue, size: 16),
                  const SizedBox(width: 4),
                  Text(
                    'Hisob: ',
                    style: const TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  Text(
                    tournament['finalScore'],
                    style: const TextStyle(
                      color: Colors.blue,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Map<String, dynamic>> _getFilteredTournaments() {
    return _tournaments.where((tournament) {
      final matchesSearch =
          tournament['name'].toLowerCase().contains(
            _searchQuery.toLowerCase(),
          ) ||
          tournament['winner'].toLowerCase().contains(
            _searchQuery.toLowerCase(),
          ) ||
          tournament['location'].toLowerCase().contains(
            _searchQuery.toLowerCase(),
          );

      final matchesCategory =
          _selectedCategory == 'Barchasi' ||
          tournament['category'] == _selectedCategory ||
          tournament['name'].toLowerCase().contains(
            _selectedCategory.toLowerCase(),
          );

      return matchesSearch && matchesCategory;
    }).toList();
  }

  void _showTournamentDetails(Map<String, dynamic> tournament) {
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
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFF6B35).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: const Color(0xFFFF6B35)),
                      ),
                      child: const Icon(
                        Icons.emoji_events,
                        color: Color(0xFFFF6B35),
                        size: 32,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tournament['name'],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            tournament['date'],
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
                _buildDetailRow(
                  'Joylashuv',
                  tournament['location'],
                  Icons.location_on,
                ),
                _buildDetailRow(
                  'Mukofot puli',
                  tournament['prizePool'],
                  Icons.attach_money,
                ),
                _buildDetailRow(
                  'Ishtirokchilar',
                  '${tournament['participants']} jamoa',
                  Icons.group,
                ),
                _buildDetailRow(
                  'G\'olib',
                  tournament['winner'],
                  Icons.emoji_events,
                ),
                _buildDetailRow(
                  'Hisob',
                  tournament['finalScore'],
                  Icons.sports_esports,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Tavsif',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  tournament['highlights'],
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            '${tournament['name']} haqida batafsil ma\'lumot...',
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
                      'Batafsil ma\'lumot',
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

  Widget _buildDetailRow(String label, String value, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFFFF6B35), size: 20),
          const SizedBox(width: 12),
          Text(
            '$label: ',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(color: Colors.grey, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
