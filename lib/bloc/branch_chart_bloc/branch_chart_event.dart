part of 'branch_chart_bloc.dart';

abstract class BranchChartEvent extends Equatable {
  const BranchChartEvent();

  @override
  List<Object> get props => [];
}


class BranchChartGet extends BranchChartEvent {}