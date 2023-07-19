// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:project_dashboard/screen/pages/page_screen/chart_components/color_chart.dart';

part 'color_chart_event.dart';
part 'color_chart_state.dart';

class ColorChartBloc extends Bloc<ColorChartEvent, ColorChartState> {
  ColorChartBloc() : super(ColorChartInitial()) {

    List<ColorSeries> modelData = <ColorSeries>[
      const ColorSeries("White",58),
      const ColorSeries("Black",50),
      const ColorSeries("Red",25),
      const ColorSeries("Green",22),
      const ColorSeries("Gold",15),
      const ColorSeries("Grey",5),
      const ColorSeries("Silver",3),
    ];

    //for refresh color chart
    on<ColorChartGetData>((event, emit) {
      emit(ColorChartLoading());
      try {
        emit(ColorChartLoaded(modelData));
      } catch (e) {
        emit(ColorChartFailed());
      }
    });
  }
}
