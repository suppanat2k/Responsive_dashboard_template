// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<OpenWindowHome>((event, emit) {
      emit(HomeLoaded());
      try {
        return emit(HomeLoading());
      } catch (e) {
        return emit(HomeFailed(e.toString()));
      }
    });
  }
}
