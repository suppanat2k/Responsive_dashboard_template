import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_dashboard/bloc/app_theme_bloc/app_theme_bloc.dart';
import 'package:project_dashboard/theme/theme.dart';
import 'package:sidebarx/sidebarx.dart';

import '../pages/pages.dart';
import 'home_components/asidebar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = SidebarXController(selectedIndex: 0, extended: true);
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 600;
    return BlocBuilder<AppThemeBloc, AppThemeState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: state.darkTheme? DarkModeColor().colorMax:LightModeColor().colorMax,
            key: _key,
            drawer: ASidebar(controller: _controller),
            body: Row(
              children: [
                if (!isSmallScreen) ASidebar(controller: _controller),
                Expanded(
                  child: Center(
                    child: PageScreen(
                      controller: _controller,
                    ),
                  ),
                ),
              ],
            ),
            floatingActionButton: isSmallScreen
                ? InkWell(
                    onTap: () {
                      _key.currentState?.openDrawer();
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: MainColorBlue().mainColor,
                            gradient: state.darkTheme? LinearGradient(
                colors: [MainColorRed().mainColor, MainColorRed().subMainColor]):LinearGradient(
                colors: [MainColorBlue().mainColor, MainColorBlue().subMainColor],
              ),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(2, 2),
                                  blurRadius: 4)
                            ]),
                        child: const Icon(
                          Icons.menu,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                : null,
            floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
          ),
        );
      },
    );
  }
}
