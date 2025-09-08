class MapModel {
  final int id;
  final String name;
  final String displayName;
  final String imagePath;
  final String description;
  final List<String> callouts;
  final List<String> rushRoutes;
  final List<String> campingSpots;

  MapModel({
    required this.id,
    required this.name,
    required this.displayName,
    required this.imagePath,
    this.description = '',
    this.callouts = const [],
    this.rushRoutes = const [],
    this.campingSpots = const [],
  });

  factory MapModel.fromJson(Map<String, dynamic> json) {
    return MapModel(
      id: json['id'],
      name: json['name'],
      displayName: json['display_name'],
      imagePath: json['image_path'],
      description: json['description'] ?? '',
      callouts: List<String>.from(json['callouts'] ?? []),
      rushRoutes: List<String>.from(json['rush_routes'] ?? []),
      campingSpots: List<String>.from(json['camping_spots'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'display_name': displayName,
      'image_path': imagePath,
      'description': description,
      'callouts': callouts,
      'rush_routes': rushRoutes,
      'camping_spots': campingSpots,
    };
  }

  MapModel copyWith({
    int? id,
    String? name,
    String? displayName,
    String? imagePath,
    String? description,
    List<String>? callouts,
    List<String>? rushRoutes,
    List<String>? campingSpots,
  }) {
    return MapModel(
      id: id ?? this.id,
      name: name ?? this.name,
      displayName: displayName ?? this.displayName,
      imagePath: imagePath ?? this.imagePath,
      description: description ?? this.description,
      callouts: callouts ?? this.callouts,
      rushRoutes: rushRoutes ?? this.rushRoutes,
      campingSpots: campingSpots ?? this.campingSpots,
    );
  }

  @override
  String toString() {
    return 'MapModel(id: $id, name: $name, displayName: $displayName)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MapModel && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
