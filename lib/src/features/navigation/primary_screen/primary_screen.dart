import 'package:flutter/material.dart';

import '../app_router/app_router.dart';
import '../navigation.dart';

class PrimaryScreen extends StatelessWidget {
  const PrimaryScreen({super.key,});


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: SafeArea(
        child: AutoTabsScaffold(
          // backgroundColor: AppColors.white,
          builder: (context, child, animation) => child,
          routes: const [
            CoursesRouter(children: [CoursesScreenRoute()]),
            AssignmentsRouter(children: [AssignmentsScreenRoute()]),
            GradeBookRouter(children: [GradeBookScreenRoute()]),
            ScheduleRouter(children: [ScheduleScreenRoute()]),
            ProfileRouter(children: [ProfileScreenRoute()])
          ],

        bottomNavigationBuilder: (context, tabsRouter){
            return NavBar(
              current: tabsRouter.activeIndex,
              switchTo: tabsRouter.setActiveIndex,
            );
        },
        ),
      ),
    );
  }
}
