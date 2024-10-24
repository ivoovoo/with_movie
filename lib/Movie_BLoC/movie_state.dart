import '../Models/movie_model.dart';

class FilmState {
  final List<Film> films;
  final bool isLoading;

  FilmState({required this.films, this.isLoading = false});
}

