import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:watch_movie/Models/movie_model.dart';
import 'dart:convert';

import 'package:watch_movie/Movie_BLoC/movie_event.dart';
import 'package:watch_movie/Movie_BLoC/movie_state.dart';



class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(MovieState(movies: [], currentIndex: 0)) {
    on<LoadMovies>((event, emit) async {
      final movies = await fetchMovies();
      emit(MovieState(movies: movies, currentIndex: 0));
    });

    on<ChangeMovie>((event, emit) {
      final newIndex = (state.currentIndex + event.direction) % state.movies.length;
      emit(MovieState(movies: state.movies, currentIndex: newIndex));
    });
  }

  Future<List<Movie>> fetchMovies() async {
    const String apiKey = 'E9R3QQD-6YG4VTP-NVEJHG7-NPZ96JK';
    const String url = 'https://kinopoisk.dev/api/v1.4/movie/search?apikey=$apiKey';
    // const String apiKey = 'E9R3QQD-6YG4VTP-NVEJHG7-NPZ96JK';
    // const String baseUrl = 'https://kinopoisk.dev/api/v2.2/films/search';
    // final String searchUrl = '$baseUrl?apikey=$apiKey&query=${Uri.encodeComponent(query)}';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List<dynamic> json = jsonDecode(response.body);
      return json.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
