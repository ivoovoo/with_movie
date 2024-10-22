class Movie {
  final String title;
  final String description;
  final String poster;
  final String trailer;

  Movie({required this.title, required this.description, required this.poster, required this.trailer});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['name'],
      description: json['description'],
      poster: json['poster'],
      trailer: json['trailer'],
    );
  }
}

