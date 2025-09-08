import 'package:flutter/material.dart';

class MapsScreen extends StatefulWidget {
  const MapsScreen({super.key});

  @override
  State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  final List<Map<String, dynamic>> _maps = [
    {
      'name': 'de_dust2',
      'displayName': 'Dust II',
      'image': 'assets/images/maps/dust2.png',
      'description': 'Eng mashhur xarita',
      'wallbangs': 12,
    },
    {
      'name': 'de_inferno',
      'displayName': 'Inferno',
      'image': 'assets/images/maps/inferno.png',
      'description': 'Tactic xarita',
      'wallbangs': 8,
    },
    {
      'name': 'de_mirage',
      'displayName': 'Mirage',
      'image': 'assets/images/maps/mirage.png',
      'description': 'Balanced xarita',
      'wallbangs': 10,
    },
    {
      'name': 'de_train',
      'displayName': 'Train',
      'image': 'assets/images/maps/train.png',
      'description': 'CT sided xarita',
      'wallbangs': 6,
    },
    {
      'name': 'de_cache',
      'displayName': 'Cache',
      'image': 'assets/images/maps/cache.png',
      'description': 'Modern xarita',
      'wallbangs': 9,
    },
    {
      'name': 'cs_office',
      'displayName': 'Office',
      'image': 'assets/images/maps/office.png',
      'description': 'Hostage xarita',
      'wallbangs': 5,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      appBar: AppBar(
        title: const Text(
          'XARITALAR',
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Counter-Strike 1.6 xaritalari',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Wallbang joylari, smoke pozitsiyalari va strategiyalar',
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: _maps.length,
                itemBuilder: (context, index) {
                  final map = _maps[index];
                  return _buildMapCard(map);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMapCard(Map<String, dynamic> map) {
    return GestureDetector(
      onTap: () {
        // TODO: Navigate to map detail screen
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${map['displayName']} xaritasini ochish...'),
            backgroundColor: const Color(0xFFFF6B35),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF2C3E50),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: const Color(0xFFFF6B35).withOpacity(0.3),
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                ),
                child: const Icon(
                  Icons.map,
                  color: Color(0xFFFF6B35),
                  size: 40,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      map['displayName'],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      map['description'],
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: Color(0xFFFF6B35),
                          size: 14,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${map['wallbangs']} wallbang',
                          style: const TextStyle(
                            color: Color(0xFFFF6B35),
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
