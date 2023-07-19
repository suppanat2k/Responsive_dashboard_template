import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_dashboard/bloc/comparison_chart_bloc/comparison_chart_bloc.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../theme/theme.dart';

class ComparisonChart extends StatefulWidget {
  const ComparisonChart({super.key});

  @override
  State<ComparisonChart> createState() => _ComparisonChartState();
}

class _ComparisonChartState extends State<ComparisonChart> {
  String crosshairText = '';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ComparisonChartBloc, ComparisonChartState>(
      builder: (context, state) {
        if (state is ComparisonChartLoading) {
          return const Center(
            child: CupertinoActivityIndicator(
              radius: 16,
            ),
          );
        }
        if (state is ComparisonChartLoaded) {
          return comparisonChartData(context, state.getComparisonMain,
              state.getComparisonSub!, crosshairText);
        }
        return const Center(
          child: CupertinoActivityIndicator(),
        );
      },
    );
  }

  Widget comparisonChartData(
      BuildContext context,
      List<ComparisonSeriesMain> getListDataSet1,
      List<ComparisonSeriesSub> getListDataSet2,
      String crosshairText) {
    return Container(
      padding: EdgeInsets.all(1.h),
      decoration: BoxDecoration(
          color: baseColor.colorMax,
          borderRadius: BorderRadius.circular(3),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: const Offset(0, 0),
                spreadRadius: 1,
                blurRadius: 6)
          ]),
      child: Column(
        children: [
          Expanded(
              flex: 1,
              child: Wrap(
                children: [
                  Text(
                    "Comparison Year/Year",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: ResponsiveBreakpoints.of(context).isDesktop
                            ? 2.sp
                            :ResponsiveBreakpoints.of(context).isTablet? 5.sp: 8.sp,
                        fontWeight: FontWeight.w600),
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                                color: mainThemeColor.mainColor,
                                borderRadius: BorderRadius.circular(100),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black26,
                                      offset: Offset(2, 2),
                                      blurRadius: 4)
                                ]),
                          ),
                          SizedBox(
                            width: 0.1.w,
                          ),
                          Text("Total Amount",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: ResponsiveBreakpoints.of(context)
                                          .isDesktop
                                      ? 2.sp
                                      :ResponsiveBreakpoints.of(context).isTablet? 5.sp: 8.sp)),
                        ],
                      ),
                      SizedBox(
                        width: 1.w,
                      ),
                      Row(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 10,
                                width: 10,
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(255, 255, 168, 162),
                                    borderRadius: BorderRadius.circular(100),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.black26,
                                          offset: Offset(2, 2),
                                          blurRadius: 4)
                                    ]),
                              ),
                              SizedBox(
                                width: 0.1.w,
                              ),
                              Text("Year comparison: ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize:
                                          ResponsiveBreakpoints.of(context)
                                                  .isDesktop
                                              ? 2.sp
                                              :ResponsiveBreakpoints.of(context).isTablet? 5.sp: 8.sp)),
                              Text("[Year comparison box]",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize:
                                          ResponsiveBreakpoints.of(context)
                                                  .isDesktop
                                              ? 2.sp
                                              :ResponsiveBreakpoints.of(context).isTablet? 5.sp: 8.sp)),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              )),
          Expanded(
              flex: 5,
              child: SfCartesianChart(
                trackballBehavior: TrackballBehavior(
                  lineColor: Colors.black12,
                  lineDashArray: const [5,5],
                  enable: true,
                  activationMode: ActivationMode.singleTap,
                  tooltipSettings:
                      const InteractiveTooltip(
                        canShowMarker: true,
                        format: 'point.x series.name\npoint.y milion'),
                ),
                // crosshairBehavior: CrosshairBehavior(
                //   enable: true,
                //   activationMode: ActivationMode.singleTap,
                //   lineColor: Color.fromARGB(255, 227, 227, 227),
                //   lineWidth: 2,
                //   shouldAlwaysShow: true,
                // ),
                plotAreaBorderWidth: 0,
                primaryXAxis: CategoryAxis(
                    majorTickLines: const MajorTickLines(width: 0),
                    majorGridLines: const MajorGridLines(width: 0)),
                primaryYAxis: NumericAxis(
                  majorTickLines: const MajorTickLines(width: 0),
                ),
                series: <ChartSeries>[
                  SplineSeries<ComparisonSeriesMain, dynamic>(
                      cardinalSplineTension: 1,
                      dataSource: getListDataSet1,
                      name: getListDataSet1[0].yearLabel,
                      color: mainThemeColor.mainColor,
                      enableTooltip: true,
                      xValueMapper: (ComparisonSeriesMain sales, _) =>
                          sales.monthLabel,
                      yValueMapper: (ComparisonSeriesMain sales, _) =>
                          sales.qtyMonth,
                      dataLabelSettings: const DataLabelSettings(isVisible: false)),
                  getListDataSet2.isEmpty
                      ? SplineSeries<ComparisonSeriesMain, dynamic>(
                          dataSource: getListDataSet1,
                          color: mainThemeColor.mainColor,
                          enableTooltip: false,
                          xValueMapper: (ComparisonSeriesMain sales, _) =>
                              sales.monthLabel,
                          yValueMapper: (ComparisonSeriesMain sales, _) =>
                              sales.qtyMonth,
                          dataLabelSettings:
                              const DataLabelSettings(isVisible: false))
                      : SplineSeries<ComparisonSeriesSub, dynamic>(
                          dataSource: getListDataSet2,
                          name: getListDataSet2[0].yearLabel,
                          dashArray: const <double>[5, 5],
                          enableTooltip: true,
                          color: const Color.fromARGB(255, 255, 168, 162),
                          xValueMapper: (ComparisonSeriesSub sales, _) =>
                              sales.monthLabel,
                          yValueMapper: (ComparisonSeriesSub sales, _) =>
                              sales.qtyMonth,
                          dataLabelSettings:
                              const DataLabelSettings(isVisible: false))
                ],
              )),
        ],
      ),
    );
  }
}

class ComparisonSeriesMain {
  const ComparisonSeriesMain(this.yearLabel, this.monthLabel, this.qtyMonth);
  final String yearLabel;
  final String monthLabel;
  final int qtyMonth;
}

class ComparisonSeriesSub {
  const ComparisonSeriesSub(this.yearLabel, this.monthLabel, this.qtyMonth);
  final String yearLabel;
  final String monthLabel;
  final int qtyMonth;
}
