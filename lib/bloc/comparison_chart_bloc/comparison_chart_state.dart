// ignore_for_file: must_be_immutable

part of 'comparison_chart_bloc.dart';

abstract class ComparisonChartState extends Equatable {
  const ComparisonChartState();
  
  @override
  List<Object> get props => [];
}

class ComparisonChartInitial extends ComparisonChartState {}
class ComparisonChartLoading extends ComparisonChartState {}
class ComparisonChartLoaded extends ComparisonChartState {
  final List<ComparisonSeriesMain> getComparisonMain;
  List<ComparisonSeriesSub>? getComparisonSub;
  ComparisonChartLoaded(this.getComparisonMain,this.getComparisonSub);
} 
class ComparisonChartFailed extends ComparisonChartState {}
