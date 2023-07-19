import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:project_dashboard/bloc/branch_chart_bloc/branch_chart_bloc.dart';
import 'package:project_dashboard/bloc/color_chart_bloc/color_chart_bloc.dart';
import 'package:project_dashboard/bloc/home_bloc/home_bloc.dart';
import 'package:project_dashboard/bloc/model_chart_bloc/model_chart_bloc.dart';
import 'package:project_dashboard/bloc/team_table_bloc/team_table_bloc.dart';
import 'package:project_dashboard/bloc/top_saleman_bloc/top_saleman_bloc.dart';
import 'package:project_dashboard/routes/app_route.dart';
import 'package:project_dashboard/screen/home/home_screen.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:sizer/sizer.dart';

import 'bloc/comparison_chart_bloc/comparison_chart_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    //BlocProvider
    final homeBloc = BlocProvider<HomeBloc>(
      create: (context) => HomeBloc()..add(OpenWindowHome()),
    );

    final branchChartBloc = BlocProvider<BranchChartBloc>(create: (context) => BranchChartBloc()..add(BranchChartGet()));
    final modelChartBloc = BlocProvider<ModelChartBloc>(create: (context) => ModelChartBloc()..add(ModelChartGetData()));
    final colorChartBloc = BlocProvider<ColorChartBloc>(create: (context) => ColorChartBloc()..add(ColorChartGetData()));
    final comparisonChartBloc = BlocProvider<ComparisonChartBloc>(create: (context) => ComparisonChartBloc()..add(ComparisonMainChart()));
    final teamTableBloc = BlocProvider<TeamTableBloc>(create: (context) => TeamTableBloc()..add(TeamTableGetData()));
    final topSalemanBloc = BlocProvider<TopSalemanBloc>(create: (context) => TopSalemanBloc()..add(TopSalemanGetData()));

    return MultiBlocProvider(
        providers: [homeBloc,branchChartBloc,modelChartBloc,colorChartBloc,comparisonChartBloc,teamTableBloc,topSalemanBloc],
        child: Sizer(builder: (context, orientation, deviceType) {
          return MaterialApp(
            builder: (context, child) => ResponsiveBreakpoints.builder(
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state is HomeLoaded) {
                    return Center(
                        child: Lottie.asset("assets/lotties/Loading.json",
                            width: 400));
                  }
                  if (state is HomeLoading) {
                    return const HomeScreen();
                  }
                  return Center(
                      child: Lottie.asset("assets/lotties/Loading.json",
                          width: 400));
                },
              ),
              breakpoints: [
                const Breakpoint(start: 0, end: 450, name: MOBILE),
                const Breakpoint(start: 451, end: 800, name: TABLET),
                const Breakpoint(start: 801, end: 1920, name: DESKTOP),
                const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
              ],
            ),
            debugShowCheckedModeBanner: false,
            routes: AppRoute().getAll,
          );
        }));
  }
}
