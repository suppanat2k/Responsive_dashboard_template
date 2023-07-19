// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:project_dashboard/screen/pages/page_screen/chart_components/model_chart.dart';

part 'model_chart_event.dart';
part 'model_chart_state.dart';

class ModelChartBloc extends Bloc<ModelChartEvent, ModelChartState> {
  ModelChartBloc() : super(ModelChartInitial()) {

    List<ModelSeries> modelData = <ModelSeries>[
      const ModelSeries("CITY",129),
      const ModelSeries("HR-V",80),
      const ModelSeries("JAZZ",75),
      const ModelSeries("CR-V",74),
      const ModelSeries("CIVIC",22),
      const ModelSeries("ACCORD",20),
      const ModelSeries("BLIO",5),
    ];

    //call when refresh model chart data
    on<ModelChartGetData>((event, emit) {
      emit(ModelChartLoading());
      try {
      emit(ModelChartLoaded(modelData));
        
      } catch (e) {
      emit(ModelChartFailed());
        
      }
    });
  }
}
