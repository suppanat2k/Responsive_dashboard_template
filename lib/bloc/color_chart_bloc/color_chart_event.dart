part of 'color_chart_bloc.dart';

abstract class ColorChartEvent extends Equatable {
  const ColorChartEvent();

  @override
  List<Object> get props => [];
}

class ColorChartGetData extends ColorChartEvent {
  
}