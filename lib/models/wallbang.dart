class Wallbang {
  final int id;
  final int mapId;
  final String name;
  final double xCoordinate;
  final double yCoordinate;
  final List<String> weapons;
  final String damageLevel;
  final String difficulty;
  final String description;
  final String imagePath;

  Wallbang({
    required this.id,
    required this.mapId,
    required this.name,
    required this.xCoordinate,
    required this.yCoordinate,
    required this.weapons,
    required this.damageLevel,
    required this.difficulty,
    required this.description,
    this.imagePath = '',
  });

  factory Wallbang.fromJson(Map<String, dynamic> json) {
    return Wallbang(
      id: json['id'],
      mapId: json['map_id'],
      name: json['name'],
      xCoordinate: json['x_coordinate'].toDouble(),
      yCoordinate: json['y_coordinate'].toDouble(),
      weapons: List<String>.from(json['weapons'] ?? []),
      damageLevel: json['damage_level'],
      difficulty: json['difficulty'],
      description: json['description'],
      imagePath: json['image_path'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'map_id': mapId,
      'name': name,
      'x_coordinate': xCoordinate,
      'y_coordinate': yCoordinate,
      'weapons': weapons,
      'damage_level': damageLevel,
      'difficulty': difficulty,
      'description': description,
      'image_path': imagePath,
    };
  }

  Wallbang copyWith({
    int? id,
    int? mapId,
    String? name,
    double? xCoordinate,
    double? yCoordinate,
    List<String>? weapons,
    String? damageLevel,
    String? difficulty,
    String? description,
    String? imagePath,
  }) {
    return Wallbang(
      id: id ?? this.id,
      mapId: mapId ?? this.mapId,
      name: name ?? this.name,
      xCoordinate: xCoordinate ?? this.xCoordinate,
      yCoordinate: yCoordinate ?? this.yCoordinate,
      weapons: weapons ?? this.weapons,
      damageLevel: damageLevel ?? this.damageLevel,
      difficulty: difficulty ?? this.difficulty,
      description: description ?? this.description,
      imagePath: imagePath ?? this.imagePath,
    );
  }

  @override
  String toString() {
    return 'Wallbang(id: $id, name: $name, mapId: $mapId, difficulty: $difficulty)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Wallbang && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
