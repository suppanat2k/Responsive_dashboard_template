import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_dashboard/bloc/app_theme_bloc/app_theme_bloc.dart';
import 'package:project_dashboard/bloc/model_chart_bloc/model_chart_bloc.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../theme/theme.dart';

class ModelChart extends StatelessWidget {
  const ModelChart({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ModelChartBloc, ModelChartState>(
      builder: (context, state) {
        if (state is ModelChartLoading) {
          return const Center(
            child: CupertinoActivityIndicator(
              radius: 16,
            ),
          );
        }
        if (state is ModelChartLoaded) {
          return modelChartData(context, state.getModelData);
        }
        return const Center(
          child: CupertinoActivityIndicator(),
        );
      },
    );
  }

  Widget modelChartData(
      BuildContext context, List<ModelSeries> getListModelData) {
    return BlocBuilder<AppThemeBloc, AppThemeState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.all(1.h),
          decoration: BoxDecoration(
              color: state.darkTheme
                  ? DarkModeColor().colorMax
                  : LightModeColor().colorMax,
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Total Sale by Model",
                        style: TextStyle(
                            fontSize:
                                ResponsiveBreakpoints.of(context).isDesktop
                                    ? 2.sp
                                    : ResponsiveBreakpoints.of(context).isTablet
                                        ? 5.sp
                                        : 8.sp,
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
                                    // color: MainColor().mainColor,
                                     gradient: state.darkTheme? LinearGradient(
                colors: [MainColorRed().mainColor, MainColorRed().subMainColor]):LinearGradient(
                colors: [MainColorBlue().mainColor, MainColorBlue().subMainColor],
              ),
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
                              Text("Total Qty",
                                  style: TextStyle(
                                      fontSize: ResponsiveBreakpoints.of(
                                                  context)
                                              .isDesktop
                                          ? 2.sp
                                          : ResponsiveBreakpoints.of(context)
                                                  .isTablet
                                              ? 5.sp
                                              : 8.sp)),
                            ],
                          ),
                        ],
                      )
                    ],
                  )),
              Expanded(
                  flex: 5,
                  child: SfCartesianChart(
                    plotAreaBorderWidth: 0,
                    primaryXAxis: CategoryAxis(
                        axisLine: const AxisLine(width: 0),
                        majorTickLines: const MajorTickLines(width: 0),
                        majorGridLines: const MajorGridLines(width: 0)),
                    primaryYAxis: NumericAxis(
                      isVisible: false,
                    ),
                    series: <ChartSeries>[
                      BarSeries<ModelSeries, dynamic>(
                          dataSource: getListModelData,
                          // color: MainColor().mainColor,
                           gradient: state.darkTheme? LinearGradient(
                colors: [MainColorRed().mainColor, MainColorRed().subMainColor]):LinearGradient(
                colors: [MainColorBlue().mainColor, MainColorBlue().subMainColor],
              ),
                          xValueMapper: (ModelSeries sales, _) =>
                              sales.modelName,
                          yValueMapper: (ModelSeries sales, _) => sales.qty,
                          // Sorting based on the specified field
                          sortingOrder: SortingOrder.ascending,
                          sortFieldValueMapper: (ModelSeries sales, _) =>
                              sales.qty,
                          dataLabelSettings:
                              const DataLabelSettings(isVisible: true))
                    ],
                  )),
            ],
          ),
        );
      },
    );
  }
}

class ModelSeries {
  const ModelSeries(this.modelName, this.qty);
  final String modelName;
  final int qty;
}
