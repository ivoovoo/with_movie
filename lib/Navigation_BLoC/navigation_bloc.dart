import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_movie/Navigation_BLoC/navigation_event.dart';
import 'package:watch_movie/Navigation_BLoC/navigation_state.dart';


class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigateToScreenA()) {
    on<GoToScreenB>((event, emit) {
      emit(NavigateToScreenB());
    });
    on<GoToScreenA>((event, emit) {
      emit(NavigateToScreenA());
    });
    on<GoToScreenC>((event, emit) {
      emit(NavigateToScreenC());
    });
  }
}