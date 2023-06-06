import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:diploma_mobile/src/features/assignments/ui/assignments_screen.dart';
import 'package:diploma_mobile/src/features/auth/sign/ui/auth_screen.dart';
import 'package:diploma_mobile/src/features/courses/ui/courses_screen.dart';
import 'package:diploma_mobile/src/features/gradebook/ui/widgets/gradebook_screen.dart';
import 'package:diploma_mobile/src/features/profile/ui/profile_screen.dart';
import 'package:diploma_mobile/src/features/schedule/ui/schedule_screen.dart';

import 'package:flutter/material.dart';

import '../primary_screen/primary_screen.dart';

export 'package:auto_route/auto_route.dart';

part 'app_router.gr.dart';

@AdaptiveAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(
      page: AuthScreen,
      initial: true,
    ),
    CustomRoute(
      page: PrimaryScreen,

      durationInMilliseconds: 500,
      children: [
        AutoRoute(
          page: EmptyRouterPage,
          name: 'CoursesRouter',
          children: [
            AutoRoute(page: CoursesScreen, initial: true),
          ],
        ),
        AutoRoute(
          page: EmptyRouterPage,
          name: 'AssignmentsRouter',
          children: [
            AutoRoute(page: AssignmentsScreen, initial: true),
          ],
        ),
        AutoRoute(
          page: EmptyRouterPage,
          name: 'GradeBookRouter',
          children: [
            AutoRoute(page: GradeBookScreen, initial: true),
          ],
        ),
        AutoRoute(
          page: EmptyRouterPage,
          name: 'ScheduleRouter',
          children: [
            AutoRoute(page: ScheduleScreen, initial: true),
          ],
        ),
        AutoRoute(
          page: EmptyRouterPage,
          name: 'ProfileRouter',
          children: [
            AutoRoute(page: ProfileScreen, initial: true),
          ],
        ),
      ],
    ),
  ],
)
class AppRouter extends _$AppRouter {
  AppRouter([
    super.navigatorKey,
  ]) {
    rootKey = super.navigatorKey;
  }

  static late final GlobalKey<NavigatorState> rootKey;
}
