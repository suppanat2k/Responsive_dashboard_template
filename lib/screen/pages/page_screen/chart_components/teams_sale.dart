import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_dashboard/bloc/app_theme_bloc/app_theme_bloc.dart';
import 'package:project_dashboard/bloc/team_table_bloc/team_table_bloc.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:sizer/sizer.dart';

import '../../../../theme/theme.dart';

class TeamTable extends StatelessWidget {
  const TeamTable({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TeamTableBloc, TeamTableState>(
      builder: (context, state) {
        if (state is TeamTableLoading) {
          return const Center(
            child: CupertinoActivityIndicator(
              radius: 16,
            ),
          );
        }
        if (state is TeamTableLoaded) {
          return teamTableData(context, state.getTeamTableData);
        }
        return const Center(
          child: CupertinoActivityIndicator(),
        );
      },
    );
  }

  Widget teamTableData(
      BuildContext context, List<TeamTableModel> getListTeamData) {
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Team's Sale Qty. vs Target",
                        style: TextStyle(
                            fontSize:
                                ResponsiveBreakpoints.of(context).isDesktop
                                    ? 2.sp
                                    : ResponsiveBreakpoints.of(context).isTablet
                                        ? 6.sp
                                        : 8.sp,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  )),
              Expanded(
                  flex: 9,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: EdgeInsets.all(1.sp),
                          decoration: BoxDecoration(
                              // color: MainColor().mainColor,
                               gradient: state.darkTheme? LinearGradient(
                colors: [MainColorRed().mainColor, MainColorRed().subMainColor]):LinearGradient(
                colors: [MainColorBlue().mainColor, MainColorBlue().subMainColor],
              ),
                              borderRadius: BorderRadius.circular(3)),
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 3,
                                  child: Center(
                                      child: Text(
                                    "Mgr. Name",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: ResponsiveBreakpoints.of(
                                                    context)
                                                .isDesktop
                                            ? 2.sp
                                            : ResponsiveBreakpoints.of(context)
                                                    .isTablet
                                                ? 5.sp
                                                : 9.sp),
                                  ))),
                              const VerticalDivider(
                                color: Colors.white,
                              ),
                              Expanded(
                                  flex: 2,
                                  child: Center(
                                      child: Text(
                                    "Target's Qty.",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: ResponsiveBreakpoints.of(
                                                    context)
                                                .isDesktop
                                            ? 2.sp
                                            : ResponsiveBreakpoints.of(context)
                                                    .isTablet
                                                ? 5.sp
                                                : 9.sp),
                                    textAlign: TextAlign.center,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ))),
                              const VerticalDivider(color: Colors.white),
                              Expanded(
                                  flex: 2,
                                  child: Center(
                                      child: Text("Actual Qty.",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: ResponsiveBreakpoints
                                                          .of(context)
                                                      .isDesktop
                                                  ? 2.sp
                                                  : ResponsiveBreakpoints.of(
                                                              context)
                                                          .isTablet
                                                      ? 5.sp
                                                      : 9.sp),
                                          textAlign: TextAlign.center,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis))),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 7,
                        child: SingleChildScrollView(
                          child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: getListTeamData.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            flex: 3,
                                            child: Container(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  getListTeamData[index]
                                                      .teamName,
                                                  style: TextStyle(
                                                      fontSize: ResponsiveBreakpoints
                                                                  .of(context)
                                                              .isDesktop
                                                          ? 2.2.sp
                                                          : ResponsiveBreakpoints
                                                                      .of(context)
                                                                  .isTablet
                                                              ? 5.sp
                                                              : 9.sp),
                                                ))),
                                        Expanded(
                                            flex: 2,
                                            child: Center(
                                                child: Text(
                                                    "${getListTeamData[index].targetQty}",
                                                    style: TextStyle(
                                                        fontSize: ResponsiveBreakpoints
                                                                    .of(context)
                                                                .isDesktop
                                                            ? 2.2.sp
                                                            : ResponsiveBreakpoints.of(
                                                                        context)
                                                                    .isTablet
                                                                ? 5.sp
                                                                : 9.sp)))),
                                        Expanded(
                                            flex: 2,
                                            child: Center(
                                                child: Text(
                                              "${getListTeamData[index].actaulQty}",
                                              style: TextStyle(
                                                  fontSize: ResponsiveBreakpoints
                                                              .of(context)
                                                          .isDesktop
                                                      ? 2.2.sp
                                                      : ResponsiveBreakpoints
                                                                  .of(context)
                                                              .isTablet
                                                          ? 5.sp
                                                          : 9.sp,
                                                  color: getListTeamData[index]
                                                              .targetQty <
                                                          getListTeamData[index]
                                                              .actaulQty
                                                      ? Colors.green
                                                      : Colors.red),
                                            ))),
                                      ],
                                    ),
                                  ),
                                  const Divider(height: 1)
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Container(
                                    padding: const EdgeInsets.all(5),
                                    alignment: Alignment.centerRight,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text("Total Target:",
                                            style: TextStyle(
                                                fontSize: ResponsiveBreakpoints
                                                            .of(context)
                                                        .isDesktop
                                                    ? 2.5.sp
                                                    : ResponsiveBreakpoints.of(
                                                                context)
                                                            .isTablet
                                                        ? 4.sp
                                                        : 10.sp)),
                                        Text("${1000}",
                                            style: TextStyle(
                                                fontSize: ResponsiveBreakpoints
                                                            .of(context)
                                                        .isDesktop
                                                    ? 2.5.sp
                                                    : ResponsiveBreakpoints.of(
                                                                context)
                                                            .isTablet
                                                        ? 4.sp
                                                        : 10.sp)),
                                      ],
                                    ))),
                            Expanded(
                                flex: 1,
                                child: Container(
                                    padding: const EdgeInsets.all(5),
                                    alignment: Alignment.centerRight,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text("Total actual:",
                                            style: TextStyle(
                                                fontSize: ResponsiveBreakpoints
                                                            .of(context)
                                                        .isDesktop
                                                    ? 2.5.sp
                                                    : ResponsiveBreakpoints.of(
                                                                context)
                                                            .isTablet
                                                        ? 4.5.sp
                                                        : 10.sp)),
                                        Text("${2857}",
                                            style: TextStyle(
                                                fontSize: ResponsiveBreakpoints
                                                            .of(context)
                                                        .isDesktop
                                                    ? 2.5.sp
                                                    : ResponsiveBreakpoints.of(
                                                                context)
                                                            .isTablet
                                                        ? 4.5.sp
                                                        : 10.sp)),
                                      ],
                                    ))),
                          ],
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        );
      },
    );
  }
}

class TeamTableModel {
  TeamTableModel(this.teamName, this.targetQty, this.actaulQty);

  final String teamName;
  final double targetQty;
  final double actaulQty;
}
