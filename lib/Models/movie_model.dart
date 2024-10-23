class Film {
  final String id;
  final String name;
  final String description;
  final String poster;

  Film({required this.id, required this.name, required this.description, required this.poster});

  factory Film.fromJson(Map<String, dynamic> json) {
    return Film(
      id: json['id'].toString(),
      name: json['name'],
      description: json['description'] ?? 'Описание отсутствует',
      poster: json['poster']['url'],
    );
  }
}


