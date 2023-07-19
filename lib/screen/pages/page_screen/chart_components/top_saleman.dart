import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:project_dashboard/bloc/top_saleman_bloc/top_saleman_bloc.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:sizer/sizer.dart';

import '../../../../theme/theme.dart';

class TopSaleManTable extends StatelessWidget {
  const TopSaleManTable({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopSalemanBloc, TopSalemanState>(
      builder: (context, state) {
        if (state is TopSalemanLoading) {
          return const Center(
            child: CupertinoActivityIndicator(
              radius: 16,
            ),
          );
        }
        if (state is TopSalemanLoaded) {
          return topSalemanData(context, state.getTopSalemanData);
        }
        return const Center(
          child: CupertinoActivityIndicator(),
        );
      },
    );
  }

  Widget topSalemanData(
      BuildContext context, List<TopSalemanModel> getListTopSaleman) {
    final curreny = NumberFormat("##,000.00", "en");

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
        child: Column(children: [
          Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Team's Sale Qty. vs Target",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: ResponsiveBreakpoints.of(context).isDesktop
                            ? 2.sp
                            :ResponsiveBreakpoints.of(context).isTablet? 6.sp: 8.sp,
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
                        color: mainThemeColor.mainColor,
                        borderRadius: BorderRadius.circular(3)),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 3,
                            child: Center(
                                child: Text(
                              "Saleman Name",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: ResponsiveBreakpoints.of(context)
                                          .isDesktop
                                      ? 2.sp
                                      :ResponsiveBreakpoints.of(context).isTablet? 5.sp: 9.sp),
                            ))),
                        const VerticalDivider(
                          color: Colors.white,
                        ),
                        Expanded(
                            flex: 2,
                            child: Center(
                                child: Text(
                              "Amount",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: ResponsiveBreakpoints.of(context)
                                          .isDesktop
                                      ? 2.sp
                                      :ResponsiveBreakpoints.of(context).isTablet? 5.sp: 9.sp),
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ))),
                        const VerticalDivider(color: Colors.white),
                        Expanded(
                            flex: 1,
                            child: Center(
                                child: Text("%Sale",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                            ResponsiveBreakpoints.of(context)
                                                    .isDesktop
                                                ? 2.sp
                                                :ResponsiveBreakpoints.of(context).isTablet? 5.sp: 9.sp),
                                    textAlign: TextAlign.center,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis))),
                        const VerticalDivider(color: Colors.white),
                        Expanded(
                            flex: 1,
                            child: Center(
                                child: Text("Qty.",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                            ResponsiveBreakpoints.of(context)
                                                    .isDesktop
                                                ? 2.sp
                                                :ResponsiveBreakpoints.of(context).isTablet? 5.sp: 9.sp),
                                    textAlign: TextAlign.center,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis))),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 8,
                  child: SingleChildScrollView(
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: getListTopSaleman.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Padding(
                              padding:  EdgeInsets.all(0.7.w),
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 3,
                                      child: Container(
                                          alignment: Alignment.centerLeft,
                                          child: Row(
                                            children: [
                                              index == 0
                                                  ? Image.asset(
                                                      "assets/images/icons/first.png",
                                                      width: ResponsiveBreakpoints
                                                                  .of(context)
                                                              .isDesktop
                                                          ? 3.sp
                                                          : ResponsiveBreakpoints
                                                                      .of(context)
                                                                  .isTablet
                                                              ? 6.sp
                                                              : 9.sp,
                                                    )
                                                  : index == 1
                                                      ? Image.asset(
                                                          "assets/images/icons/second.png",
                                                          width: ResponsiveBreakpoints
                                                                      .of(context)
                                                                  .isDesktop
                                                              ? 3.sp
                                                              : ResponsiveBreakpoints.of(context).isTablet? 6.sp:9.sp,
                                                        )
                                                      : index == 2
                                                          ? Image.asset(
                                                              "assets/images/icons/third.png",
                                                              width: ResponsiveBreakpoints.of(
                                                                          context)
                                                                      .isDesktop
                                                                  ? 3.sp
                                                                  :ResponsiveBreakpoints.of(context).isTablet? 6.sp: 9.sp,
                                                            )
                                                          : Container(),
                                              Text(
                                                getListTopSaleman[index].salemanName,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontSize:
                                                        ResponsiveBreakpoints
                                                                    .of(context)
                                                                .isDesktop
                                                            ? 2.2.sp
                                                            :ResponsiveBreakpoints.of(context).isTablet? 5.sp: 9.sp),
                                              ),
                                            ],
                                          ))),
                                  Expanded(
                                      flex: 2,
                                      child: Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                              curreny.format(getListTopSaleman[index].amount),
                                              style: TextStyle(
                                                  fontSize:
                                                      ResponsiveBreakpoints.of(
                                                                  context)
                                                              .isDesktop
                                                          ? 2.2.sp
                                                          :ResponsiveBreakpoints.of(context).isTablet? 5.sp: 9.sp),
                                              maxLines: 1,
                                              overflow:
                                                  TextOverflow.ellipsis))),
                                  Expanded(
                                      flex: 1,
                                      child: Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                              "${getListTopSaleman[index].percentSale}",
                                              style: TextStyle(
                                                  fontSize:
                                                      ResponsiveBreakpoints.of(
                                                                  context)
                                                              .isDesktop
                                                          ? 2.2.sp
                                                          :ResponsiveBreakpoints.of(context).isTablet? 5.sp: 9.sp,
                                                  color: Colors.black),
                                              maxLines: 1,
                                              overflow:
                                                  TextOverflow.ellipsis))),
                                  Expanded(
                                      flex: 1,
                                      child: Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                              "${getListTopSaleman[index].qtySale}",
                                              style: TextStyle(
                                                  fontSize:
                                                      ResponsiveBreakpoints.of(
                                                                  context)
                                                              .isDesktop
                                                          ? 2.2.sp
                                                          :ResponsiveBreakpoints.of(context).isTablet? 5.sp: 9.sp,
                                                  color: Colors.black),
                                              maxLines: 1,
                                              overflow:
                                                  TextOverflow.ellipsis))),
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
              ],
            ),
          )
        ]));
  }
}

class TopSalemanModel {
  TopSalemanModel(
      this.salemanName, this.amount, this.percentSale, this.qtySale);

  final String salemanName;
  final double amount;
  final double percentSale;
  final double qtySale;
}
