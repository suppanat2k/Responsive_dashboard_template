import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_dashboard/bloc/app_theme_bloc/app_theme_bloc.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:sizer/sizer.dart';

import '../../../../theme/theme.dart';

class TotalTool extends StatelessWidget {
  const TotalTool({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeBloc, AppThemeState>(
      builder: (context, state) {
        return Container(
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
          child: Padding(
            padding: EdgeInsets.all(ResponsiveBreakpoints.of(context).isDesktop
                ? 0.6.w
                : ResponsiveBreakpoints.of(context).isTablet
                    ? 1.w
                    : 2.w),
            child: Column(
              children: [
                Expanded(
                    flex: 5,
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total tools Sale",
                            style: TextStyle(
                                color: state.darkTheme?MainColorRed().subMainColor: MainColorBlue().subMainColor,
                                fontSize: ResponsiveBreakpoints.of(context)
                                        .isDesktop
                                    ? 2.5.sp
                                    : ResponsiveBreakpoints.of(context).isTablet
                                        ? 4.sp
                                        : 12.sp,
                                fontWeight: FontWeight.w600),
                          ),
                          Text("Total tools Sale on this month",
                              style: TextStyle(
                                  fontSize: ResponsiveBreakpoints.of(context)
                                          .isDesktop
                                      ? 2.sp
                                      : ResponsiveBreakpoints.of(context)
                                              .isTablet
                                          ? 3.5.sp
                                          : 8.sp))
                        ],
                      ),
                    )),
                SizedBox(
                  height:
                      ResponsiveBreakpoints.of(context).isTablet ? 0 : 0.1.h,
                ),
                Expanded(
                    flex: 12,
                    child: Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                  // color: MainColorBlue().subMainColor,
                                  gradient: state.darkTheme? LinearGradient(
                colors: [MainColorRed().subMainColor, MainColorRed().subMainColor2]):LinearGradient(
                colors: [MainColorBlue().subMainColor, MainColorBlue().subMainColor2],
              ),
                                  borderRadius: BorderRadius.circular(3)),
                              child: Padding(
                                padding: EdgeInsets.all(0.6.w),
                                child: Column(
                                  children: [
                                    Expanded(
                                        flex: 2,
                                        child: Container(
                                            alignment: Alignment.centerLeft,
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                  "assets/images/icons/increasing.png",
                                                  width: ResponsiveBreakpoints
                                                              .of(context)
                                                          .isDesktop
                                                      ? 2.h
                                                      : ResponsiveBreakpoints
                                                                  .of(context)
                                                              .isTablet
                                                          ? 8.sp
                                                          : 20.sp,
                                                ),
                                                SizedBox(
                                                  width: 1.h,
                                                ),
                                                Text("Sale Amount",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: ResponsiveBreakpoints
                                                                    .of(context)
                                                                .isDesktop
                                                            ? 2.5.sp
                                                            : ResponsiveBreakpoints.of(
                                                                        context)
                                                                    .isTablet
                                                                ? 4.sp
                                                                : 12.sp),
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis),
                                              ],
                                            ))),
                                    Expanded(
                                        flex: 1,
                                        child: Container(
                                            alignment: Alignment.bottomRight,
                                            child: Text("Growth +1%",
                                                style: TextStyle(
                                                    color: Colors.greenAccent,
                                                    fontSize: ResponsiveBreakpoints
                                                                .of(context)
                                                            .isDesktop
                                                        ? 2.sp
                                                        : ResponsiveBreakpoints
                                                                    .of(context)
                                                                .isTablet
                                                            ? 4.sp
                                                            : 8.sp)))),
                                    Expanded(
                                        flex: 2,
                                        child: Container(
                                          alignment: Alignment.topRight,
                                          child: Text("5.72 M",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: ResponsiveBreakpoints
                                                              .of(context)
                                                          .isDesktop
                                                      ? 4.sp
                                                      : ResponsiveBreakpoints
                                                                  .of(context)
                                                              .isTablet
                                                          ? 8.sp
                                                          : 25.sp)),
                                        ))
                                  ],
                                ),
                              ),
                            )),
                        SizedBox(
                          width: 0.5.w,
                        ),
                        Expanded(
                            flex: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                  // color: MainColorBlue().subMainColor,
                                  gradient: state.darkTheme? LinearGradient(
                colors: [MainColorRed().subMainColor, MainColorRed().subMainColor2]):LinearGradient(
                colors: [MainColorBlue().subMainColor, MainColorBlue().subMainColor2],
              ),
                                  borderRadius: BorderRadius.circular(3)),
                              child: Padding(
                                padding: EdgeInsets.all(0.6.w),
                                child: Column(
                                  children: [
                                    Expanded(
                                        flex: 2,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                                "assets/images/icons/increase.png",
                                                width: ResponsiveBreakpoints.of(
                                                            context)
                                                        .isDesktop
                                                    ? 2.h
                                                    : ResponsiveBreakpoints.of(
                                                                context)
                                                            .isTablet
                                                        ? 8.sp
                                                        : 20.sp),
                                            SizedBox(
                                              width: 1.h,
                                            ),
                                            Text(
                                              "Gross Margin",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: ResponsiveBreakpoints
                                                              .of(context)
                                                          .isDesktop
                                                      ? 2.5.sp
                                                      : ResponsiveBreakpoints
                                                                  .of(context)
                                                              .isTablet
                                                          ? 4.sp
                                                          : 12.sp),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        )),
                                    Expanded(flex: 1, child: Container()),
                                    Expanded(
                                        flex: 2,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("583.75 K",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: ResponsiveBreakpoints
                                                                .of(context)
                                                            .isDesktop
                                                        ? 4.sp
                                                        : ResponsiveBreakpoints
                                                                    .of(context)
                                                                .isTablet
                                                            ? 8.sp
                                                            : 25.sp)),
                                          ],
                                        )),
                                  ],
                                ),
                              ),
                            )),
                      ],
                    )),
              ],
            ),
          ),
        );
      },
    );
  }
}
