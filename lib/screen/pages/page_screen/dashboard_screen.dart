import 'package:flutter/material.dart';
import 'package:project_dashboard/screen/pages/page_screen/chart_components/branch_chart.dart';
import 'package:project_dashboard/screen/pages/page_screen/chart_components/color_chart.dart';
import 'package:project_dashboard/screen/pages/page_screen/chart_components/comparison_chart.dart';
import 'package:project_dashboard/screen/pages/page_screen/chart_components/model_chart.dart';
import 'package:project_dashboard/screen/pages/page_screen/chart_components/summary_services.dart';
import 'package:project_dashboard/screen/pages/page_screen/chart_components/summary_tool.dart';
import 'package:project_dashboard/screen/pages/page_screen/chart_components/teams_sale.dart';
import 'package:project_dashboard/screen/pages/page_screen/chart_components/top_saleman.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:sizer/sizer.dart';

import 'chart_components/summary_sale.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(1.w),
      child: ResponsiveBreakpoints.of(context).screenWidth > 920
          ? Row(
              children: [
                //Left side
                Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        //Summary group
                        Expanded(
                            flex: 5,
                            child: Row(
                              children: [
                                //Totalsale and Totaltools
                                Expanded(
                                    flex: 1,
                                    child: Column(
                                      children: [
                                        //Totalsale
                                        const Expanded(
                                            flex: 1, child: TotalSale()),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        //Totaltools
                                        const Expanded(
                                            flex: 1, child: TotalTool())
                                      ],
                                    )),
                                SizedBox(
                                  width: 1.h,
                                ),
                                //total services
                                const Expanded(flex: 1, child: TotalServices()),
                              ],
                            )),

                        //summary branch
                        Expanded(
                            flex: 4,
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 1.h),
                              child: const BranchChart(),
                            )),

                        //summary sale by model and color
                        Expanded(
                            flex: 5,
                            child: Row(
                              children: [
                                //total by model
                                const Expanded(flex: 1, child: ModelChart()),
                                SizedBox(
                                  width: 1.h,
                                ),
                                //total by color
                                const Expanded(flex: 1, child: ColorChart()),
                              ],
                            )),
                      ],
                    )),
                SizedBox(
                  width: 1.h,
                ),
                //Right side
                Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        //filter
                        Expanded(flex: 1, child: Container(color: Colors.grey)),
                        SizedBox(
                          height: 1.h,
                        ),
                        //comparison chart
                        const Expanded(flex: 4, child: ComparisonChart()),
                        SizedBox(
                          height: 1.h,
                        ),
                        //sum team sale and top saleman
                        Expanded(
                            flex: 5,
                            child: Row(
                              children: [
                                //team sale
                                const Expanded(flex: 8, child: TeamTable()),
                                SizedBox(
                                  width: 1.h,
                                ),
                                //top 10 saleman
                                const Expanded(
                                    flex: 11, child: TopSaleManTable()),
                              ],
                            )),
                      ],
                    )),
              ],
            )
          : ResponsiveBreakpoints.of(context).largerThan(MOBILE) 
              ? SingleChildScrollView(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 2.5,
                    child: Column(
                      children: [
                        //Tablet template
                        Expanded(
                          flex: 2,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Column(
                                  children: [
                                    //Totalsale
                                    const Expanded(flex: 3, child: TotalSale()),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    //Totaltools
                                    const Expanded(flex: 3, child: TotalTool()),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 1.w,
                              ),
                              //total services
                              const Expanded(flex: 1, child: TotalServices()),
                            ],
                          ),
                        ),
                        Expanded(
                            flex: 16,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 1.h,
                                ),
                                //total by branch
                                const Expanded(flex: 4, child: BranchChart()),
                                SizedBox(
                                  height: 1.h,
                                ),
                                const Expanded(flex: 4, child: ModelChart()),
                                SizedBox(
                                  height: 1.h,
                                ),
                                //total by color
                                const Expanded(flex: 4, child: ColorChart()),
                                SizedBox(
                                  height: 1.h,
                                ),
                                //comparison chart
                                const Expanded(
                                    flex: 4, child: ComparisonChart()),
                              ],
                            )),
                        SizedBox(
                          height: 1.w,
                        ),
                        //team sale
                        const Expanded(flex: 2, child: TeamTable()),
                        //top 10 saleman
                        const Expanded(flex: 2, child: TopSaleManTable()),
                      ],
                    ),
                  ),
                )
              : SingleChildScrollView(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 3,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          //Mobile template
                          //Totalsale
                          const Expanded(flex: 3, child: TotalSale()),
                          SizedBox(
                            height: 1.h,
                          ),
                          //Totaltools
                          const Expanded(flex: 3, child: TotalTool()),
                          SizedBox(
                            height: 1.h,
                          ),
                          //total services
                          const Expanded(flex: 5, child: TotalServices()),
                          SizedBox(
                            height: 1.h,
                          ),
                          //total by branch
                          const Expanded(flex: 4, child: BranchChart()),
                          SizedBox(
                            height: 1.h,
                          ),
                          const Expanded(flex: 4, child: ModelChart()),
                          SizedBox(
                            height: 1.h,
                          ),
                          //total by color
                          const Expanded(flex: 4, child: ColorChart()),
                          SizedBox(
                            height: 1.h,
                          ),
                          //comparison chart
                          const Expanded(flex: 4, child: ComparisonChart()),
                          SizedBox(
                            height: 1.h,
                          ),
                          //team sale
                          const Expanded(flex: 6, child: TeamTable()),
                          SizedBox(
                            height: 1.h,
                          ),
                          //top 10 saleman
                          const Expanded(flex: 6, child: TopSaleManTable()),
                        ],
                      ),
                    ),
                  ),
                ),
    );
  }
}
