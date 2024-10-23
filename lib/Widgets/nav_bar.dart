import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_movie/App.dart';
import 'package:watch_movie/Navigation_BLoC/navigation_bloc.dart';
import 'package:watch_movie/Navigation_BLoC/navigation_event.dart';

class NavBarWidget extends StatelessWidget {
  const NavBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330,
      decoration: const BoxDecoration(
          color: Colors.transparent
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () {
              context.read<NavigationBloc>().add(GoToScreenA());
            },
            child: SvgPicture.asset('Assets/nav-icon.svg'),
          ),
          InkWell(
            onTap: () {
              context.read<NavigationBloc>().add(GoToScreenB());
            },
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
