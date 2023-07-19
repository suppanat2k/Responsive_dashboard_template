part of 'color_chart_bloc.dart';

abstract class ColorChartState extends Equatable {
  const ColorChartState();
  
  @override
  List<Object> get props => [];
}

class ColorChartInitial extends ColorChartState {}
class ColorChartLoading extends ColorChartState {}
class ColorChartLoaded extends ColorChartState {
  final List<ColorSeries> getColorData;
  const ColorChartLoaded(this.getColorData);
}
class ColorChartFailed extends ColorChartState {}
