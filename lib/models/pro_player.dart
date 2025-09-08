class ProPlayer {
  final int id;
  final String name;
  final String realName;
  final String nickname;
  final String country;
  final String team;
  final String position;
  final List<String> achievements;
  final Map<String, dynamic> settings;
  final String biography;
  final String photoPath;

  ProPlayer({
    required this.id,
    required this.name,
    required this.realName,
    required this.nickname,
    required this.country,
    required this.team,
    required this.position,
    this.achievements = const [],
    this.settings = const {},
    this.biography = '',
    this.photoPath = '',
  });

  factory ProPlayer.fromJson(Map<String, dynamic> json) {
    return ProPlayer(
      id: json['id'],
      name: json['name'],
      realName: json['real_name'],
      nickname: json['nickname'],
      country: json['country'],
      team: json['team'],
      position: json['position'],
      achievements: List<String>.from(json['achievements'] ?? []),
      settings: Map<String, dynamic>.from(json['settings'] ?? {}),
      biography: json['biography'] ?? '',
      photoPath: json['photo_path'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'real_name': realName,
      'nickname': nickname,
      'country': country,
      'team': team,
      'position': position,
      'achievements': achievements,
      'settings': settings,
      'biography': biography,
      'photo_path': photoPath,
    };
  }

  ProPlayer copyWith({
    int? id,
    String? name,
    String? realName,
    String? nickname,
    String? country,
    String? team,
    String? position,
    List<String>? achievements,
    Map<String, dynamic>? settings,
    String? biography,
    String? photoPath,
  }) {
    return ProPlayer(
      id: id ?? this.id,
      name: name ?? this.name,
      realName: realName ?? this.realName,
      nickname: nickname ?? this.nickname,
      country: country ?? this.country,
      team: team ?? this.team,
      position: position ?? this.position,
      achievements: achievements ?? this.achievements,
      settings: settings ?? this.settings,
      biography: biography ?? this.biography,
      photoPath: photoPath ?? this.photoPath,
    );
  }

  @override
  String toString() {
    return 'ProPlayer(id: $id, name: $name, nickname: $nickname, team: $team)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ProPlayer && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
