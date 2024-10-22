import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:watch_movie/Movie_BLoC/movie_bloc.dart';
import 'package:watch_movie/Movie_BLoC/movie_event.dart';
import 'package:watch_movie/Movie_BLoC/movie_state.dart';
import 'package:watch_movie/Navigation_BLoC/navigation_bloc.dart';
import 'package:watch_movie/Navigation_BLoC/navigation_event.dart';
import 'package:watch_movie/Navigation_BLoC/navigation_state.dart';
import 'package:watch_movie/Ui/home.dart';

class CurrentStackWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MovieBloc, MovieState>(
        builder: (context, state) {
          if (state.movies.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          return NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification scrollInfo) {
              if (scrollInfo.metrics.pixels >=
                  scrollInfo.metrics.maxScrollExtent) {
                context.read<MovieBloc>().add(ChangeMovie(1)); // Прокрутка вниз
              } else if (scrollInfo.metrics.pixels <=
                  scrollInfo.metrics.minScrollExtent) {
                context
                    .read<MovieBloc>()
                    .add(ChangeMovie(-1)); // Прокрутка вверх
              }
              return true;
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Stack(
                  children: [
                    AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              state.movies[state.currentIndex].poster),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    // Текст названия фильма
                    Center(
                      child: Text(
                        state.movies[state.currentIndex].title,
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    // Описание фильма
                    Positioned(
                      bottom: 50,
                      left: 20,
                      right: 20,
                      child: Text(
                        state.movies[state.currentIndex].description,
                        style: TextStyle(fontSize: 16, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 100,
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: SvgPicture.asset('Assets/like.svg'),
                          ),
                          InkWell(
                            onTap: () {},
                            child: SvgPicture.asset('Assets/list.svg'),
                          ),
                          InkWell(
                            onTap: () {
                              context
                                  .read<NavigationBloc>()
                                  .add(NavigateToScreenC() as NavigationEvent);
                            },
                            child: SvgPicture.asset('Assets/play.svg'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  color: Colors.white,
                  height: 1,
                ),
                NavBarWidget(),
              ],
            ),
          );
        },
      ),
    );
  }
}
