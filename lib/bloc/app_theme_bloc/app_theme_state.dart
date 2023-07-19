part of 'app_theme_bloc.dart';

class AppThemeState extends Equatable {
  final bool darkTheme;
  const AppThemeState({required this.darkTheme});
  
  @override
  List<Object> get props => [darkTheme];
}

