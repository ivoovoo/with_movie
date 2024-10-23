import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Models/movie_model.dart';

class FilmsColumn extends StatelessWidget {
  const FilmsColumn({
    super.key,
    required this.film,
  });

  final Film? film;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          film!.poster,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        Positioned(
          bottom: 200,
          left: 100,
          right: 100,
          child: Center(
            child: Text(
              film!.name,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
        // Positioned(
        //   right: 5,
        //   bottom: 100,
        //   child: Column(
        //     children: [
        //       InkWell(
        //         onTap: () {},
        //         child: SvgPicture.asset('Assets/like.svg'),
        //       ),
        //       const SizedBox(
        //         height: 25,
        //       ),
        //       InkWell(
        //         onTap: () {},
        //         child: SvgPicture.asset('Assets/list.svg'),
        //       ),
        //       const SizedBox(
        //         height: 25,
        //       ),
        //       InkWell(
        //         onTap: () {},
        //         child: SvgPicture.asset('Assets/play.svg'),
        //       ),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}
