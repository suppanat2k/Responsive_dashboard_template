import 'package:flutter/material.dart';
import 'package:project_dashboard/screen/home/home_screen.dart';

class AppRoute {
  static String home = "home";
  static String dashboard = "dashboard";

  final _route = <String,WidgetBuilder>{
    home:(context) => const HomeScreen()
  };

  get getAll => _route;
}