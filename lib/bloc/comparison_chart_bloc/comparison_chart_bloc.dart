// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:project_dashboard/screen/pages/page_screen/chart_components/comparison_chart.dart';

part 'comparison_chart_event.dart';
part 'comparison_chart_state.dart';

class ComparisonChartBloc extends Bloc<ComparisonChartEvent, ComparisonChartState> {
  ComparisonChartBloc() : super(ComparisonChartInitial()) {

    List<ComparisonSeriesMain> dataset1 = <ComparisonSeriesMain>[
      const ComparisonSeriesMain('2023','Jan',35),
      const ComparisonSeriesMain('2023','Feb',49),
      const ComparisonSeriesMain('2023','Mar',78),
      const ComparisonSeriesMain('2023','Apr',85),
      const ComparisonSeriesMain('2023','May',62),
      const ComparisonSeriesMain('2023','Jun',77),
      const ComparisonSeriesMain('2023','Jul',89),
      const ComparisonSeriesMain('2023','Sep',112),
      const ComparisonSeriesMain('2023','Aug',120),
      const ComparisonSeriesMain('2023','Oct',80),
      const ComparisonSeriesMain('2023','Nov',70),
      const ComparisonSeriesMain('2023','Dec',50),
    ];

        List<ComparisonSeriesSub> dataset2 = <ComparisonSeriesSub>[
      const ComparisonSeriesSub('2022','Jan',32),
      const ComparisonSeriesSub('2022','Feb',45),
      const ComparisonSeriesSub('2022','Mar',90),
      const ComparisonSeriesSub('2022','Apr',59),
      const ComparisonSeriesSub('2022','May',89),
      const ComparisonSeriesSub('2022','Jun',95),
      const ComparisonSeriesSub('2022','Jul',85),
      const ComparisonSeriesSub('2022','Sep',62),
      const ComparisonSeriesSub('2022','Aug',58),
      const ComparisonSeriesSub('2022','Oct',55),
      const ComparisonSeriesSub('2022','Nov',76),
      const ComparisonSeriesSub('2022','Dec',99),
    ];


    on<ComparisonMainChart>((event, emit) {
      emit(ComparisonChartLoading());
      try {
        emit(ComparisonChartLoaded(dataset1,dataset2));
      } catch (e) {
        emit(ComparisonChartFailed());
      }
    });
  }
}
