import 'package:watch_movie/Models/movie_model.dart';

class MovieState {
  final List<Movie> movies;
  final int currentIndex;

  MovieState({required this.movies, required this.currentIndex});
}
