import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_dashboard/bloc/app_theme_bloc/app_theme_bloc.dart';
import 'package:project_dashboard/bloc/color_chart_bloc/color_chart_bloc.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../theme/theme.dart';

class ColorChart extends StatelessWidget {
  const ColorChart({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorChartBloc, ColorChartState>(
      builder: (context, state) {
        if (state is ColorChartLoading) {
          return const Center(
            child: CupertinoActivityIndicator(
              radius: 16,
            ),
          );
        }
        if (state is ColorChartLoaded) {
          return colorChartData(context, state.getColorData);
        }
        return const Center(
          child: CupertinoActivityIndicator(),
        );
      },
    );
  }

  Widget colorChartData(
      BuildContext context, List<ColorSeries> getListColorData) {
    return BlocBuilder<AppThemeBloc, AppThemeState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.all(1.h),
          decoration: BoxDecoration(
              color: state.darkTheme?DarkModeColor().colorMax:LightModeColor().colorMax,
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
                        "Total Sale by Color",
                        style: TextStyle(
                            fontSize:
                                ResponsiveBreakpoints.of(context).isDesktop
                                    ? 2.sp
                                    : ResponsiveBreakpoints.of(context).isTablet
                                        ? 5.sp
                                        : 8.sp,
                            fontWeight: FontWeight.w600),
                      ),
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
                      BarSeries<ColorSeries, dynamic>(
                          dataSource: getListColorData,
                          onCreateRenderer:
                              (ChartSeries<ColorSeries, dynamic> series) =>
                                  _CustomColumnSeriesRenderer(getListColorData),
                          xValueMapper: (ColorSeries sales, _) =>
                              sales.colorName,
                          yValueMapper: (ColorSeries sales, _) => sales.qty,
                          // Sorting based on the specified field
                          sortingOrder: SortingOrder.ascending,
                          sortFieldValueMapper: (ColorSeries sales, _) =>
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

class _CustomColumnSeriesRenderer extends BarSeriesRenderer {
  List<ColorSeries> fetchListColorData;
  _CustomColumnSeriesRenderer(this.fetchListColorData);

  @override
  BarSegment createSegment() {
    return _ColumnCustomPainter();
  }
}

class _ColumnCustomPainter extends BarSegment {
  final colorList = [
    const Color.fromRGBO(100, 100, 100, 1),
    const Color.fromRGBO(255, 200, 0, 1),
    const Color.fromRGBO(255, 255, 150, 1),
    const Color.fromRGBO(0, 255, 0, 1),
    const Color.fromRGBO(255, 0, 0, 1),
    const Color.fromRGBO(0, 0, 0, 1),
    const Color.fromRGBO(245, 245, 245, 1)
  ];

  @override
  Paint getFillPaint() {
    final Paint customerFillPaint = Paint();
    customerFillPaint.isAntiAlias = false;
    customerFillPaint.color = colorList[currentSegmentIndex!];
    customerFillPaint.style = PaintingStyle.fill;
    return customerFillPaint;
  }
}

class ColorSeries {
  const ColorSeries(this.colorName, this.qty);
  final String colorName;
  final int qty;
}
