import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:project_dashboard/screen/pages/page_screen/dashboard_screen.dart';
import 'package:sidebarx/sidebarx.dart';

class PageScreen extends StatelessWidget {
  const PageScreen({
    Key? key,
    required this.controller,
  }) : super(key: key);

  //controller route calling by controller.selectedIndex from sidebarX item index in asidebar.dart
  final SidebarXController controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        switch (controller.selectedIndex) {
          case 0:
            return const DashboardScreen();
          default: 
            return Center(child: Lottie.asset("assets/lotties/Loading.json",width: 400));
        }
      },
    );
  }
}