part of 'branch_chart_bloc.dart';

abstract class BranchChartState extends Equatable {
  const BranchChartState();
  
  @override
  List<Object> get props => [];
}

class BranchChartInitial extends BranchChartState {}

class BranchChartLoading extends BranchChartState {}

class BranchChartLoaded extends BranchChartState {
  final List<SalesData> getBranchData;
  const BranchChartLoaded(this.getBranchData);
}

class BranchChartFailed extends BranchChartState {}

