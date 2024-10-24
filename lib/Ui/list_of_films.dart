import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../Models/film_for_grid.dart';
import '../Movie_BLoC/movie_bloc.dart';
import '../Movie_BLoC/movie_state.dart';
import '../Widgets/nav_bar.dart';
import '../Models/row_films.dart';

class ListOfFilms extends StatefulWidget {
  const ListOfFilms({super.key});

  @override
  State<ListOfFilms> createState() => _ListOfFilmsState();
}

class _ListOfFilmsState extends State<ListOfFilms> {
  List<Color> _colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.purple,
    Colors.orange,
  ];

  late Color _color1;
  late Color _color2;

  @override
  void initState() {
    super.initState();
    _changeColors();
  }

  void _changeColors() {
    Random random = Random();
    _color1 = _colors[random.nextInt(_colors.length)];
    _color2 = _colors[random.nextInt(_colors.length)];
    while (_color1 == _color2) {
      _color2 = _colors[random.nextInt(_colors.length)];
    }

    // Запланировать изменение цветов через 2 секунды
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _changeColors();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilmBloc, FilmState>(builder: (context, state) {
      if (state.isLoading) {
        return const Center(child: CircularProgressIndicator());
      }

      final film = state.films;

      return Scaffold(
        body: Stack(
          children: [
            AnimatedContainer(
              duration: const Duration(seconds: 2),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [_color1, _color2],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            Column(
              children: [
                const SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('Assets/Ellipse 134.png'),
                      SvgPicture.asset('Assets/bell.svg'),
                    ],
                  ),
                ),
                Container(
                  height: 635,
                  child: Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 15.0,
                        crossAxisCount: 2,
                      ),
                      itemCount: film.length,
                      itemBuilder: (context, index) {
                        return FilmForGrid(film: film[index]);
                      },
                    ),
                  ),
                ),
                const NavBarWidget(),
              ],
            ),
          ],
        ),
      );
    });
  }
}
