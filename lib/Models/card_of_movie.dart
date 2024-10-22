import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardOfMovie extends StatelessWidget {
  String picPath;

  CardOfMovie({
    required this.picPath,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
          children: [
            Image.asset(picPath),
            Positioned(
              bottom: 213,
              left: 67,
              child: InkWell(
                onTap: () {},
                child: SvgPicture.asset('Assets/Button (1).svg'),
              ),
            ),
          ],
        ),
    );
  }
}
