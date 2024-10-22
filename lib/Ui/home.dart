import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:watch_movie/Models/card_of_movie.dart';
import 'package:watch_movie/Models/movie.dart';
import 'package:watch_movie/Theme/theme.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
              const SizedBox(
                height: 30,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'for you',
                      style: Style.txtStyle,
                    ),
                    Text(
                      ' trending',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 38,
                        fontFamily: 'Poppins',
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 580,
                child: Expanded(
                  child: PageView.builder(
                    itemCount: listOfMovies.length,
                    itemBuilder: (context, index) {
                      return CardOfMovie(
                          picPath: listOfMovies[index].picturePath,
                      );
                    },
                  ),
                ),
              ),
              NavBarWidget(),
            ],
          ),
        ],
      ),
    );
  }
}

class NavBarWidget extends StatelessWidget {
  const NavBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330,
      decoration: BoxDecoration(
        color: Colors.transparent
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () {},
            child: SvgPicture.asset('Assets/nav-icon.svg'),
          ),
          InkWell(
            onTap: () {},
            child: SvgPicture.asset('Assets/navbar.svg'),
          ),
          InkWell(
            onTap: () {},
            child: SvgPicture.asset('Assets/nav.svg'),
          ),
        ],
      ),
    );
  }
}
