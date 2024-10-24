import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:watch_movie/Widgets/watch_now_button.dart';

import 'movie_model.dart';

class FilmForGrid extends StatelessWidget {
  const FilmForGrid({
    super.key,
    required this.film,
  });

  final Film? film;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), // Закругление углов
            border: Border.all(
              color: Colors.white, // Цвет рамки
              width: 3, // Толщина рамки
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20), // Радиус закругления
            child: Image.network(
              film!.poster,
              fit: BoxFit.cover,
              width: 160,
              height: 160,
            ),
          ),
        ),
        Container(
          width: 130,
          height: 30.5,
          child: Center(
            child: Text(

              film!.name.toUpperCase(),
              textAlign: TextAlign.center,
              softWrap: true,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
