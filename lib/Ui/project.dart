import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_movie/Navigation_BLoC/navigation_bloc.dart';
import 'package:watch_movie/Navigation_BLoC/navigation_state.dart';
import 'package:watch_movie/Ui/home.dart';
import 'package:watch_movie/Ui/stack.dart';

class Project extends StatelessWidget {
  const Project({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        if (state is NavigateToScreenA) {
          return const HomeWidget();
        } else if (state is NavigateToScreenB) {
          return  FilmScreen();
        }
        // else if (state is NavigateToScreenC) {
        //   return const Subscription();
        // }
        return const Center(
          child: Text('error'),
        );
      },
    );
  }
}