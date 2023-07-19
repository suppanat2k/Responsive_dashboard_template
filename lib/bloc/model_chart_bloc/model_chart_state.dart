part of 'model_chart_bloc.dart';

abstract class ModelChartState extends Equatable {
  const ModelChartState();

  @override
  List<Object> get props => [];
}

class ModelChartInitial extends ModelChartState {}

class ModelChartLoading extends ModelChartState {}

class ModelChartLoaded extends ModelChartState {
  final List<ModelSeries> getModelData;
  const ModelChartLoaded(this.getModelData);
}

class ModelChartFailed extends ModelChartState {}
