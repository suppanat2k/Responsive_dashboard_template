import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:sizer/sizer.dart';

import '../../../../theme/theme.dart';

class TotalServices extends StatelessWidget {
  const TotalServices({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(ResponsiveBreakpoints.of(context).isTablet? 1.w:1.h),
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
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Total Services",
                      style: TextStyle(
                          color: subThemeColor.mainColor,
                          fontSize: ResponsiveBreakpoints.of(context).isDesktop
                              ? 2.5.sp
                              :ResponsiveBreakpoints.of(context).isTablet? 4.sp: 12.sp,
                          fontWeight: FontWeight.w600),
                    ),
                    Text("Total Services on this month",
                        style: TextStyle(
                            color: Colors.black38,
                            fontSize:
                                ResponsiveBreakpoints.of(context).isDesktop
                                    ? 2.sp
                                    :ResponsiveBreakpoints.of(context).isTablet? 4.sp: 8.sp))
                  ],
                ),
              )),
          Expanded(
              flex: 2,
              child: Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: Container(
                        decoration: BoxDecoration(
                            color: subThemeColor.mainColor,
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
                                            width: ResponsiveBreakpoints.of(
                                                        context)
                                                    .isDesktop
                                                ? 2.h
                                                :ResponsiveBreakpoints.of(context).isTablet? 8.sp: 20.sp,
                                          ),
                                          SizedBox(
                                            width: 1.h,
                                          ),
                                          Text("Sale Amount",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize:
                                                      ResponsiveBreakpoints.of(
                                                                  context)
                                                              .isDesktop
                                                          ? 2.5.sp
                                                          :ResponsiveBreakpoints.of(context).isTablet? 4.sp: 12.sp),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis),
                                        ],
                                      ))),
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                      alignment: Alignment.bottomRight,
                                      child: Text("Growth +1%",
                                          style: TextStyle(
                                              color: Colors.greenAccent,
                                              fontSize:
                                                  ResponsiveBreakpoints.of(
                                                              context)
                                                          .isDesktop
                                                      ? 2.sp
                                                      :ResponsiveBreakpoints.of(context).isTablet? 4.sp: 8.sp)))),
                              Expanded(
                                  flex: 2,
                                  child: Container(
                                    alignment: Alignment.topRight,
                                    child: Text("22.9 M",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: ResponsiveBreakpoints.of(
                                                        context)
                                                    .isDesktop
                                                ? 4.sp
                                                :ResponsiveBreakpoints.of(context).isTablet? 8.sp: 25.sp)),
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
                            color: subThemeColor.mainColor,
                            borderRadius: BorderRadius.circular(3)),
                        child: Padding(
                          padding: EdgeInsets.all(0.5.w),
                          child: Column(
                            children: [
                              Expanded(
                                  flex: 3,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "G/R JOB",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: ResponsiveBreakpoints.of(
                                                        context)
                                                    .isDesktop
                                                ? 2.sp
                                                :ResponsiveBreakpoints.of(context).isTablet? 4.sp: 12.sp),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  )),
                              Expanded(
                                  flex: 2,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("1051",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize:
                                                  ResponsiveBreakpoints.of(
                                                              context)
                                                          .isDesktop
                                                      ? 3.sp
                                                      :ResponsiveBreakpoints.of(context).isTablet? 8.sp: 25.sp)),
                                    ],
                                  )),
                            ],
                          ),
                        ),
                      )),
                  SizedBox(
                    width: 0.15.w,
                  ),
                  Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                            color: subThemeColor.mainColor,
                            borderRadius: BorderRadius.circular(3)),
                        child: Padding(
                          padding: EdgeInsets.all(0.6.w),
                          child: Column(
                            children: [
                              Expanded(
                                  flex: 3,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "B/P JOB",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: ResponsiveBreakpoints.of(
                                                        context)
                                                    .isDesktop
                                                ? 2.sp
                                                :ResponsiveBreakpoints.of(context).isTablet? 4.sp: 12.sp),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  )),
                              Expanded(
                                  flex: 2,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("957",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize:
                                                  ResponsiveBreakpoints.of(
                                                              context)
                                                          .isDesktop
                                                      ? 3.sp
                                                      :ResponsiveBreakpoints.of(context).isTablet? 8.sp: 25.sp)),
                                    ],
                                  )),
                            ],
                          ),
                        ),
                      )),
                ],
              )),
          SizedBox(
            height: 1.h,
          ),
          Expanded(
              flex: 2,
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                            color: subThemeColor.mainColor,
                            borderRadius: BorderRadius.circular(3)),
                        child: Padding(
                          padding: EdgeInsets.all(0.6.w),
                          child: Column(
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("PDI JOB",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize:
                                                  ResponsiveBreakpoints.of(
                                                              context)
                                                          .isDesktop
                                                      ? 2.5.sp
                                                      :ResponsiveBreakpoints.of(context).isTablet?4.sp: 12.sp),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis),
                                    ],
                                  )),
                              Expanded(
                                  flex: 2,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("387",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize:
                                                  ResponsiveBreakpoints.of(
                                                              context)
                                                          .isDesktop
                                                      ? 4.sp
                                                      :ResponsiveBreakpoints.of(context).isTablet? 8.sp: 25.sp)),
                                    ],
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
                            color: subThemeColor.mainColor,
                            borderRadius: BorderRadius.circular(3)),
                        child: Padding(
                          padding: EdgeInsets.all(0.6.w),
                          child: Column(
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Warranty",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: ResponsiveBreakpoints.of(
                                                        context)
                                                    .isDesktop
                                                ? 2.5.sp
                                                :ResponsiveBreakpoints.of(context).isTablet? 4.sp: 12.sp),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  )),
                              Expanded(
                                  flex: 2,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("254",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize:
                                                  ResponsiveBreakpoints.of(
                                                              context)
                                                          .isDesktop
                                                      ? 4.sp
                                                      :ResponsiveBreakpoints.of(context).isTablet? 8.sp: 25.sp)),
                                    ],
                                  )),
                            ],
                          ),
                        ),
                      )),
                ],
              )),
          SizedBox(
            height: 1.h,
          ),
          Expanded(
              flex: 1,
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Sale Amount by G/R and B/P",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize:
                                    ResponsiveBreakpoints.of(context).isDesktop
                                        ? 1.5.sp
                                        :ResponsiveBreakpoints.of(context).isTablet? 4.sp: 8.sp)),
                        Row(
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 10,
                                  width: 10,
                                  decoration: BoxDecoration(
                                      color: spreadColor.mainColor,
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
                                Text("G/R",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize:
                                            ResponsiveBreakpoints.of(context)
                                                    .isDesktop
                                                ? 1.5.sp
                                                :ResponsiveBreakpoints.of(context).isTablet? 4.sp: 8.sp)),
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
                                      color: spreadColor.subMainColor,
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
                                Text("B/P",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize:
                                            ResponsiveBreakpoints.of(context)
                                                    .isDesktop
                                                ? 1.5.sp
                                                :ResponsiveBreakpoints.of(context).isTablet? 4.sp: 8.sp)),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      clipBehavior: Clip.hardEdge,
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(3)),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 5,
                            child: Container(
                              alignment: Alignment.center,
                              decoration:
                                  BoxDecoration(color: spreadColor.mainColor),
                              child: Text("5.09M",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize:
                                          ResponsiveBreakpoints.of(context)
                                                  .isDesktop
                                              ? 2.sp
                                              :ResponsiveBreakpoints.of(context).isTablet? 5.sp: 8.sp)),
                            ),
                          ),
                          Expanded(
                            flex: 17,
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: spreadColor.subMainColor),
                              child: Text("17.1M",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize:
                                          ResponsiveBreakpoints.of(context)
                                                  .isDesktop
                                              ? 2.sp
                                              :ResponsiveBreakpoints.of(context).isTablet? 5.sp: 8.sp)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
