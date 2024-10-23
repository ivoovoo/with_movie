import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:watch_movie/Widgets/watch_now_button.dart';

import '../Models/movie_model.dart';

class FilmRow extends StatelessWidget {
  const FilmRow({
    super.key,
    required this.film,
  });

  final Film? film;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          // right: 0,
          left: 45,
          bottom: 0,
          child: Container(
            width: 298,
            height: 518,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30), // Закругление углов
              border: Border.all(
                color: Colors.white, // Цвет рамки
                width: 3, // Толщина рамки
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30), // Радиус закругления
              child: Image.network(
                film!.poster,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 100,
          child: Center(
            child: Text(
              film!.name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const Positioned(
          left: 100,
          bottom: 30,
          child: WatchNowButton(),
        ),
      ],
    );
  }
}

