class ConsoleCode {
  final int id;
  final String title;
  final String code;
  final String description;
  final String category;
  final String usage;
  final String requirements;
  final bool isFavorite;

  ConsoleCode({
    required this.id,
    required this.title,
    required this.code,
    required this.description,
    required this.category,
    required this.usage,
    required this.requirements,
    this.isFavorite = false,
  });

  factory ConsoleCode.fromJson(Map<String, dynamic> json) {
    return ConsoleCode(
      id: json['id'],
      title: json['title'],
      code: json['code'],
      description: json['description'],
      category: json['category'],
      usage: json['usage'],
      requirements: json['requirements'],
      isFavorite: json['is_favorite'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'code': code,
      'description': description,
      'category': category,
      'usage': usage,
      'requirements': requirements,
      'is_favorite': isFavorite,
    };
  }

  ConsoleCode copyWith({
    int? id,
    String? title,
    String? code,
    String? description,
    String? category,
    String? usage,
    String? requirements,
    bool? isFavorite,
  }) {
    return ConsoleCode(
      id: id ?? this.id,
      title: title ?? this.title,
      code: code ?? this.code,
      description: description ?? this.description,
      category: category ?? this.category,
      usage: usage ?? this.usage,
      requirements: requirements ?? this.requirements,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  @override
  String toString() {
    return 'ConsoleCode(id: $id, title: $title, code: $code, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ConsoleCode && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
