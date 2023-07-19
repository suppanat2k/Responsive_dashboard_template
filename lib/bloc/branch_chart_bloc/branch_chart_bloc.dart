// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../screen/pages/page_screen/chart_components/branch_chart.dart';

part 'branch_chart_event.dart';
part 'branch_chart_state.dart';

class BranchChartBloc extends Bloc<BranchChartEvent, BranchChartState> {
  BranchChartBloc() : super(BranchChartInitial()) {

      List<SalesData> data = <SalesData>[
    SalesData('Branch 1', 70,85),
    SalesData('Branch 2', 69,65),
    SalesData('Branch 3', 80,85),
    SalesData('Branch 4', 75,63),
    SalesData('Branch 5', 68,62)
  ];

    //call when refresh branch chart data
    on<BranchChartGet>((event, emit) {
      emit(BranchChartLoading());
      try {
        
        emit(BranchChartLoaded(data));
      } catch (e) {
        emit(BranchChartFailed());
      }
    });
  }
}
