import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_dashboard/bloc/app_theme_bloc/app_theme_bloc.dart';
import 'package:project_dashboard/screen/home/home_components/theme_switch.dart';
import 'package:sidebarx/sidebarx.dart';

import '../../../theme/theme.dart';

class ASidebar extends StatelessWidget {
  const ASidebar({
    Key? key,
    required SidebarXController controller,
  })  : _controller = controller,
        super(key: key);

  final SidebarXController _controller;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeBloc, AppThemeState>(
      builder: (context, state) {
        return SidebarX(
          animationDuration: const Duration(milliseconds: 300),
          controller: _controller,
          theme: SidebarXTheme(
            width: 80,
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                // color: MainColor().mainColor,
                gradient: state.darkTheme
                    ? LinearGradient(colors: [
                        MainColorRed().mainColor,
                        MainColorRed().subMainColor
                      ])
                    : LinearGradient(
                        colors: [
                          MainColorBlue().mainColor,
                          MainColorBlue().subMainColor
                        ],
                      ),
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black26,
                      offset: Offset(4, 4),
                      blurRadius: 8)
                ]),
            hoverColor: Colors.white.withOpacity(0.1),
            hoverTextStyle: const TextStyle(color: Colors.white),
            textStyle: const TextStyle(color: Colors.white),
            selectedTextStyle: const TextStyle(color: Colors.white),
            itemTextPadding: const EdgeInsets.only(left: 30),
            selectedItemTextPadding: const EdgeInsets.only(left: 30),
            itemDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            selectedItemDecoration: BoxDecoration(
              border: Border.all(color: Colors.white.withOpacity(0.2)),
              borderRadius: BorderRadius.circular(10),
              color: Colors.white.withOpacity(0.2),
            ),
            iconTheme: const IconThemeData(
              color: Colors.white,
              size: 20,
            ),
            selectedIconTheme: const IconThemeData(
              color: Colors.white,
              size: 20,
            ),
          ),
          extendedTheme: SidebarXTheme(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(5),
            width: 240,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                // color: MainColor().mainColor
                gradient: state.darkTheme
                    ? LinearGradient(colors: [
                        MainColorRed().mainColor,
                        MainColorRed().subMainColor
                      ])
                    : LinearGradient(
                        colors: [
                          MainColorBlue().mainColor,
                          MainColorBlue().subMainColor
                        ],
                      ),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black26,
                      offset: Offset(4, 4),
                      blurRadius: 8)
                ]),
          ),
          footerDivider: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(5.0),
                child: ThemeSwitch(),
              ),
              const SizedBox(
                height: 10,
              ),
              Divider(color: Colors.white.withOpacity(0.3), height: 1),
            ],
          ),
          headerBuilder: (context, extended) {
            return SizedBox(
              height: 100,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset("assets/images/logo/SystemproLogo.png"),
              ),
            );
          },
          items: const [
            //controller.selectedIndex == 0
            SidebarXItem(
              icon: Icons.bar_chart,
              label: 'DashBoard',
            ),
            //controller.selectedIndex == 1
            SidebarXItem(
              icon: Icons.account_balance,
              label: 'Finance',
            ),
            //controller.selectedIndex == 2
            SidebarXItem(
              icon: Icons.layers,
              label: 'Report',
            ),
          ],
        );
      },
    );
  }
}
