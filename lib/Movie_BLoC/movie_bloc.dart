import 'dart:convert';
import 'dart:math' as math;
import 'package:http/http.dart' as http;

import 'package:flutter_bloc/flutter_bloc.dart';

import '../Models/movie_model.dart';
import 'movie_event.dart';
import 'movie_state.dart';

class FilmBloc extends Bloc<FilmEvent, FilmState> {
  final String apiKey = '82JG65D-Q2H4N4Y-PRQM2CJ-DA862M7';

  FilmBloc() : super(FilmState(isLoading: true, films: [])) {
    on<FetchRandomFilm>(_onFetchRandomFilm);
    add(FetchRandomFilm());
  }

  Future<void> _onFetchRandomFilm(
      FetchRandomFilm event, Emitter<FilmState> emit) async {
    emit(FilmState(isLoading: true, films: []));
    try {
      final response = await http.get(
        Uri.parse('https://api.kinopoisk.dev/v1.4/movie'),
        headers: {'X-API-KEY': apiKey},
      );

      if (response.statusCode == 200) {
        List<Film> rots = <Film>[];
        final docs = json.decode(response.body) as Map<String, dynamic>;
        final films = docs["docs"];

        for (int i = 0; i < films.length; i++) {
          final name = films[i]["name"];
          final description =  films[i]["description"];
          final poster =  films[i]["poster"];
          if (name != null && description != null && poster != null) {
            rots.add(Film(
              id: films[i]['id'].toString(),
              name: films[i]['name'],
              description: films[i]['description'],
              poster: films[i]['poster']['url'],
            ),
            );
          }
        }
        // final randomFilm = rots[math.Random().nextInt(rots.length)];
        emit(FilmState(films: rots, isLoading: false));
      }
    } catch (e) {
      print(e);
      emit(FilmState(isLoading: false, films: []));
    }
  }
}
