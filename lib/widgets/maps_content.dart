import 'package:flutter/material.dart';

class MapsContent extends StatefulWidget {
  const MapsContent({super.key});

  @override
  State<MapsContent> createState() => _MapsContentState();
}

class _MapsContentState extends State<MapsContent>
    with TickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _fadeAnimation;

  final List<Map<String, dynamic>> _maps = [
    {
      'name': 'de_dust2',
      'displayName': 'Dust II',
      'image': 'assets/images/maps/dust2.png',
      'description': 'Eng mashhur xarita',
      'wallbangs': 12,
      'difficulty': 'Easy',
      'type': 'Bomb Defusal',
      'color': Color(0xFFE67E22),
    },
    {
      'name': 'de_inferno',
      'displayName': 'Inferno',
      'image': 'assets/images/maps/inferno.png',
      'description': 'Tactic xarita',
      'wallbangs': 8,
      'difficulty': 'Medium',
      'type': 'Bomb Defusal',
      'color': Color(0xFFE74C3C),
    },
    {
      'name': 'de_mirage',
      'displayName': 'Mirage',
      'image': 'assets/images/maps/mirage.png',
      'description': 'Balanced xarita',
      'wallbangs': 10,
      'difficulty': 'Medium',
      'type': 'Bomb Defusal',
      'color': Color(0xFF3498DB),
    },
    {
      'name': 'de_train',
      'displayName': 'Train',
      'image': 'assets/images/maps/train.png',
      'description': 'CT sided xarita',
      'wallbangs': 6,
      'difficulty': 'Hard',
      'type': 'Bomb Defusal',
      'color': Color(0xFF9B59B6),
    },
    {
      'name': 'de_cache',
      'displayName': 'Cache',
      'image': 'assets/images/maps/cache.png',
      'description': 'Modern xarita',
      'wallbangs': 9,
      'difficulty': 'Medium',
      'type': 'Bomb Defusal',
      'color': Color(0xFF1ABC9C),
    },
    {
      'name': 'cs_office',
      'displayName': 'Office',
      'image': 'assets/images/maps/office.png',
      'description': 'Hostage xarita',
      'wallbangs': 5,
      'difficulty': 'Easy',
      'type': 'Hostage Rescue',
      'color': Color(0xFFF39C12),
    },
  ];

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
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 24),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: _maps.length,
                itemBuilder: (context, index) {
                  final map = _maps[index];
                  return _buildModernMapCard(map, index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFFFF6B35).withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: const Color(0xFFFF6B35).withOpacity(0.3),
                ),
              ),
              child: const Icon(
                Icons.map_outlined,
                color: Color(0xFFFF6B35),
                size: 24,
              ),
            ),
            const SizedBox(width: 12),
            const Expanded(
              child: Text(
                'Counter-Strike 1.6 Xaritalari',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        const Text(
          'Wallbang joylari, smoke pozitsiyalari va strategiyalar',
          style: TextStyle(color: Colors.grey, fontSize: 14, height: 1.4),
        ),
      ],
    );
  }

  Widget _buildModernMapCard(Map<String, dynamic> map, int index) {
    return TweenAnimationBuilder<double>(
      duration: Duration(milliseconds: 300 + (index * 100)),
      tween: Tween(begin: 0.0, end: 1.0),
      builder: (context, value, child) {
        return Transform.scale(
          scale: 0.8 + (0.2 * value),
          child: Opacity(
            opacity: value,
            child: GestureDetector(
              onTap: () => _onMapTap(map),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: (map['color'] as Color).withOpacity(0.3),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Stack(
                    children: [
                      // Background Image with Gradient Overlay
                      _buildMapBackground(map),
                      // Content Overlay
                      _buildMapOverlay(map),
                      // Difficulty Badge
                      _buildDifficultyBadge(map),
                      // Type Badge
                      _buildTypeBadge(map),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildMapBackground(Map<String, dynamic> map) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            (map['color'] as Color).withOpacity(0.8),
            (map['color'] as Color).withOpacity(0.6),
            Colors.black.withOpacity(0.7),
          ],
          stops: const [0.0, 0.5, 1.0],
        ),
      ),
      child: Stack(
        children: [
          // Pattern overlay
          Positioned.fill(
            child: CustomPaint(
              painter: PatternPainter(color: Colors.white.withOpacity(0.1)),
            ),
          ),
          // Map icon
          Center(
            child: Icon(
              Icons.map,
              size: 60,
              color: Colors.white.withOpacity(0.3),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMapOverlay(Map<String, dynamic> map) {
    return Positioned.fill(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.transparent,
              Colors.black.withOpacity(0.8),
            ],
            stops: const [0.0, 0.4, 1.0],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                map['displayName'],
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      color: Colors.black,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 4),
              Text(
                map['description'],
                style: TextStyle(
                  color: Colors.white.withOpacity(0.9),
                  fontSize: 12,
                  shadows: const [
                    Shadow(
                      color: Colors.black,
                      blurRadius: 2,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFF6B35).withOpacity(0.9),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: Colors.white,
                          size: 12,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${map['wallbangs']} wallbang',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
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

  Widget _buildDifficultyBadge(Map<String, dynamic> map) {
    Color difficultyColor;
    switch (map['difficulty']) {
      case 'Easy':
        difficultyColor = Colors.green;
        break;
      case 'Medium':
        difficultyColor = Colors.orange;
        break;
      case 'Hard':
        difficultyColor = Colors.red;
        break;
      default:
        difficultyColor = Colors.grey;
    }

    return Positioned(
      top: 12,
      right: 12,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: difficultyColor.withOpacity(0.9),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Text(
          map['difficulty'],
          style: const TextStyle(
            color: Colors.white,
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildTypeBadge(Map<String, dynamic> map) {
    return Positioned(
      top: 12,
      left: 12,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.7),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.white.withOpacity(0.3), width: 1),
        ),
        child: Text(
          map['type'],
          style: const TextStyle(
            color: Colors.white,
            fontSize: 9,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  void _onMapTap(Map<String, dynamic> map) {
    // Haptic feedback
    // HapticFeedback.lightImpact();

    // Show bottom sheet with map details
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => _buildMapDetailSheet(map),
    );
  }

  Widget _buildMapDetailSheet(Map<String, dynamic> map) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: const BoxDecoration(
        color: Color(0xFF1A1A1A),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Column(
        children: [
          // Handle bar
          Container(
            margin: const EdgeInsets.only(top: 12),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.5),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          // Content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: (map['color'] as Color).withOpacity(0.2),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: (map['color'] as Color).withOpacity(0.5),
                          ),
                        ),
                        child: Icon(Icons.map, color: map['color'], size: 32),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              map['displayName'],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              map['description'],
                              style: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  _buildDetailRow('Xarita turi', map['type'], Icons.category),
                  _buildDetailRow('Qiyinlik', map['difficulty'], Icons.speed),
                  _buildDetailRow(
                    'Wallbang joylari',
                    '${map['wallbangs']} ta',
                    Icons.location_on,
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              '${map['displayName']} xaritasini ochish...',
                            ),
                            backgroundColor: const Color(0xFFFF6B35),
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFF6B35),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Xaritani ochish',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
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
          Text(value, style: TextStyle(color: Colors.grey[400], fontSize: 16)),
        ],
      ),
    );
  }
}

class PatternPainter extends CustomPainter {
  final Color color;

  PatternPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;

    const spacing = 20.0;
    for (double x = 0; x < size.width; x += spacing) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (double y = 0; y < size.height; y += spacing) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
