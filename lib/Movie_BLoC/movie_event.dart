class MovieEvent {}

class LoadMovies extends MovieEvent {}

class ChangeMovie extends MovieEvent {
  final int direction;

  ChangeMovie(this.direction);
}
