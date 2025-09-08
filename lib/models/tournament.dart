class Tournament {
  final int id;
  final String name;
  final String date;
  final String location;
  final String prizePool;
  final String winner;
  final int participants;
  final String highlights;
  final String finalScore;
  final String category;
  final String description;

  Tournament({
    required this.id,
    required this.name,
    required this.date,
    required this.location,
    required this.prizePool,
    required this.winner,
    required this.participants,
    this.highlights = '',
    this.finalScore = '',
    this.category = '',
    this.description = '',
  });

  factory Tournament.fromJson(Map<String, dynamic> json) {
    return Tournament(
      id: json['id'],
      name: json['name'],
      date: json['date'],
      location: json['location'],
      prizePool: json['prize_pool'],
      winner: json['winner'],
      participants: json['participants'],
      highlights: json['highlights'] ?? '',
      finalScore: json['final_score'] ?? '',
      category: json['category'] ?? '',
      description: json['description'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'date': date,
      'location': location,
      'prize_pool': prizePool,
      'winner': winner,
      'participants': participants,
      'highlights': highlights,
      'final_score': finalScore,
      'category': category,
      'description': description,
    };
  }

  Tournament copyWith({
    int? id,
    String? name,
    String? date,
    String? location,
    String? prizePool,
    String? winner,
    int? participants,
    String? highlights,
    String? finalScore,
    String? category,
    String? description,
  }) {
    return Tournament(
      id: id ?? this.id,
      name: name ?? this.name,
      date: date ?? this.date,
      location: location ?? this.location,
      prizePool: prizePool ?? this.prizePool,
      winner: winner ?? this.winner,
      participants: participants ?? this.participants,
      highlights: highlights ?? this.highlights,
      finalScore: finalScore ?? this.finalScore,
      category: category ?? this.category,
      description: description ?? this.description,
    );
  }

  @override
  String toString() {
    return 'Tournament(id: $id, name: $name, date: $date, winner: $winner)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Tournament && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
