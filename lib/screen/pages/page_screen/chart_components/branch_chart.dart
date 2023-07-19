import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_dashboard/bloc/app_theme_bloc/app_theme_bloc.dart';
import 'package:project_dashboard/bloc/branch_chart_bloc/branch_chart_bloc.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../theme/theme.dart';

class BranchChart extends StatelessWidget {
  const BranchChart({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BranchChartBloc, BranchChartState>(
      builder: (context, state) {
        if (state is BranchChartLoading) {
          return const Center(
            child: CupertinoActivityIndicator(
              radius: 16,
            ),
          );
        }
        if (state is BranchChartLoaded) {
          return branchChartData(context, state.getBranchData);
        }
        return const Center(
          child: CupertinoActivityIndicator(),
        );
      },
    );
  }

  Widget branchChartData(
      BuildContext context, List<SalesData> getListSaleData) {
    return BlocBuilder<AppThemeBloc, AppThemeState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.all(1.h),
          decoration: BoxDecoration(
              color: state.darkTheme? DarkModeColor().colorMax:LightModeColor().colorMax,
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
                        "Total Sale by Branch",
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
                              Text("Total Sale",
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
                          const SizedBox(
                            width: 5,
                          ),
                          Row(
                            children: [
                              Container(
                                height: 10,
                                width: 10,
                                decoration: BoxDecoration(
                                    color: MainColorBlue().subMainColor,
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
                              Text("Total Qty.",
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
                          )
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
                      ColumnSeries<SalesData, dynamic>(
                          dataSource: getListSaleData,
                          color: state.darkTheme?MainColorBlue().subMainColor.withOpacity(0.8):MainColorRed().subMainColor.withOpacity(0.8),
                          xValueMapper: (SalesData sales, _) => sales.branch,
                          yValueMapper: (SalesData sales, _) => sales.sales,
                          dataLabelSettings:
                              const DataLabelSettings(isVisible: true)),
                      ColumnSeries<SalesData, dynamic>(
                          dataSource: getListSaleData,
                          color:state.darkTheme?MainColorRed().mainColor.withOpacity(0.8):MainColorBlue().mainColor.withOpacity(0.8),
                          xValueMapper: (SalesData sales, _) => sales.branch,
                          yValueMapper: (SalesData sales, _) => sales.qty,
                          dataLabelMapper: (SalesData sales, _) =>
                              "${sales.qty} M",
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

class SalesData {
  SalesData(this.branch, this.sales, this.qty);

  final String branch;
  final double sales;
  final double qty;
}
