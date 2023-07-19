import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:project_dashboard/bloc/app_theme_bloc/app_theme_bloc.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:sizer/sizer.dart';

class ThemeSwitch extends StatefulWidget {
  const ThemeSwitch({super.key});

  @override
  State<ThemeSwitch> createState() => _ThemeSwitchState();
}

class _ThemeSwitchState extends State<ThemeSwitch> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeBloc, AppThemeState>(
      builder: (context, state) {
        return FlutterSwitch(
            activeColor: Colors.white30,
            inactiveColor: Colors.white30,
            activeIcon: Image.asset("assets/images/icons/half-moon.png"),
            inactiveIcon: Image.asset("assets/images/icons/sun.png"),
            width: ResponsiveBreakpoints.of(context).screenWidth > 920
                ? 10.sp
                    : ResponsiveBreakpoints.of(context).isMobile
                    ? 40.sp:20.sp,
            height: ResponsiveBreakpoints.of(context).screenWidth > 920
                ? 6.sp
                    : ResponsiveBreakpoints.of(context).isMobile
                    ? 24.sp:12.sp,
            valueFontSize: 1.sp,
            toggleSize: ResponsiveBreakpoints.of(context).screenWidth > 920
                ? 4.sp
                    : ResponsiveBreakpoints.of(context).isMobile
                    ? 20.sp:10.sp,
            value: state.darkTheme,
            borderRadius: 100,
            padding: 1.sp,
            onToggle: (val) {
              context.read<AppThemeBloc>().add(SwitchThemeChange());
            });
      },
    );
  }
}
