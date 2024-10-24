import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_movie/Movie_BLoC/movie_bloc.dart';
import 'package:watch_movie/Movie_BLoC/movie_event.dart';
import 'package:watch_movie/Navigation_BLoC/navigation_bloc.dart';
import 'package:watch_movie/Ui/home.dart';
import 'package:watch_movie/Ui/project.dart';
import 'package:watch_movie/Ui/stack.dart';

import 'Models/film_for_grid.dart';
import 'Ui/list_of_films.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => NavigationBloc()),
          BlocProvider(create: (context) => FilmBloc()
              // .add(LoadMovies())
          ),
        ],
        child: ListOfFilms(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
