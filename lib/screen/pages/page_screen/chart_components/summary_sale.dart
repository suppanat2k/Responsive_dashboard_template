import 'package:flutter/material.dart';
import 'package:project_dashboard/theme/theme.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:sizer/sizer.dart';

class TotalSale extends StatelessWidget {
  const TotalSale({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: baseColor.colorMax,
        borderRadius: BorderRadius.circular(3),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.2),offset: const Offset(0, 0),spreadRadius: 1,blurRadius: 6)
        ]
      ),
      child: Padding(
        padding:  EdgeInsets.all(ResponsiveBreakpoints.of(context).isDesktop?0.6.w:ResponsiveBreakpoints.of(context).isTablet? 1.w:2.w),
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
                        "Total Sale",
                        style: TextStyle(
                            color: mainThemeColor.mainColor,
                            fontSize: ResponsiveBreakpoints.of(context).isDesktop? 2.5.sp:ResponsiveBreakpoints.of(context).isTablet? 4.sp: 12.sp,
                            fontWeight: FontWeight.w600),
                      ),
                      Text("Total Sale on this month",
                          style: TextStyle(color: Colors.black38, fontSize: ResponsiveBreakpoints.of(context).isDesktop? 2.sp:ResponsiveBreakpoints.of(context).isTablet? 3.5.sp: 8.sp))
                    ],
                  ),
                )),
                 SizedBox(height:ResponsiveBreakpoints.of(context).isTablet? 0: 0.1.h,),
            Expanded(
                flex: 12,
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                              color: mainThemeColor.mainColor,
                              borderRadius: BorderRadius.circular(3)),
                          child: Padding(
                            padding:  EdgeInsets.all(0.6.h),
                            child: Column(
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: Container(
                                        alignment: Alignment.centerLeft,
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Image.asset("assets/images/icons/increasing.png",width:ResponsiveBreakpoints.of(context).isDesktop? 2.h:ResponsiveBreakpoints.of(context).isTablet? 8.sp: 20.sp),
                                             SizedBox(width:ResponsiveBreakpoints.of(context).isTablet? 0.5.h: 1.h,),
                                            Text("Sale Amount",
                                            maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    color: Colors.white, fontSize: ResponsiveBreakpoints.of(context).isDesktop? 2.5.sp:ResponsiveBreakpoints.of(context).isTablet? 4.sp: 12.sp)),
                                          ],
                                        ))),
                                Expanded(
                                    flex: 1,
                                    child: Container(
                                        alignment: Alignment.bottomRight,
                                        child:  Text("Growth +12%",
                                            style: TextStyle(
                                                color: Colors.greenAccent, fontSize: ResponsiveBreakpoints.of(context).isDesktop? 2.sp:ResponsiveBreakpoints.of(context).isTablet? 4.sp: 8.sp)))),
                                Expanded(
                                    flex: 2,
                                    child: Container(
                                        alignment: Alignment.topRight,
                                        child:  Text("273.5 M",
                                            style: TextStyle(
                                                color: Colors.white, fontSize: ResponsiveBreakpoints.of(context).isDesktop? 4.sp:ResponsiveBreakpoints.of(context).isTablet? 8.sp: 25.sp)))),
                              ],
                            ),
                          ),
                        )),
                        SizedBox(width: 0.5.w,),
                    Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                              color: mainThemeColor.mainColor,
                              borderRadius: BorderRadius.circular(3)),
                          child: Padding(
                            padding: EdgeInsets.all(0.5.h),
                            child: Column(
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: Container(
                                        alignment: Alignment.centerLeft,
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Image.asset("assets/images/icons/car.png",width:ResponsiveBreakpoints.of(context).isDesktop? 2.h:ResponsiveBreakpoints.of(context).isTablet? 8.sp: 20.sp),
                                             SizedBox(width: 1.h,),
                                             Text("Sale Qty.",
                                             maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    color: Colors.white, fontSize: ResponsiveBreakpoints.of(context).isDesktop? 2.5.sp:ResponsiveBreakpoints.of(context).isTablet? 4.sp: 12.sp)),
                                          ],
                                        ))),
                                Expanded(
                                    flex: 1,
                                    child: Container(
                                        alignment: Alignment.bottomRight,
                                        child: Text("Growth +2%",
                                            style: TextStyle(
                                                color: Colors.greenAccent, fontSize: ResponsiveBreakpoints.of(context).isDesktop? 2.sp:ResponsiveBreakpoints.of(context).isTablet? 4.sp: 8.sp)))),
                                Expanded(
                                    flex: 2,
                                    child: Container(
                                        alignment: Alignment.topRight,
                                        child:  Text("291",
                                            style: TextStyle(
                                                color: Colors.white, fontSize: ResponsiveBreakpoints.of(context).isDesktop? 4.sp:ResponsiveBreakpoints.of(context).isTablet? 8.sp: 25.sp)))),
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
  }
}