// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'app_theme_event.dart';
part 'app_theme_state.dart';

class AppThemeBloc extends Bloc<AppThemeEvent, AppThemeState> {
  AppThemeBloc() : super(const AppThemeState(darkTheme: false)) {
    on<SwitchThemeChange>((event, emit) {
      if(!state.darkTheme){
        emit(const AppThemeState(darkTheme: true));
      }else{
        emit(const AppThemeState(darkTheme: false));
      }
    });
  }
}
