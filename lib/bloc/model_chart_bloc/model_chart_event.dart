part of 'model_chart_bloc.dart';

abstract class ModelChartEvent extends Equatable {
  const ModelChartEvent();

  @override
  List<Object> get props => [];
}


class ModelChartGetData extends ModelChartEvent {
  
}