// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    AuthScreenRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const AuthScreen(),
      );
    },
    PrimaryScreenRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const PrimaryScreen(),
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false,
      );
    },
    CoursesRouter.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const EmptyRouterPage(),
      );
    },
    AssignmentsRouter.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const EmptyRouterPage(),
      );
    },
    GradeBookRouter.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const EmptyRouterPage(),
      );
    },
    ScheduleRouter.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const EmptyRouterPage(),
      );
    },
    ProfileRouter.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const EmptyRouterPage(),
      );
    },
    CoursesScreenRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const CoursesScreen(),
      );
    },
    AssignmentsScreenRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const AssignmentsScreen(),
      );
    },
    GradeBookScreenRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const GradeBookScreen(),
      );
    },
    ScheduleScreenRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const ScheduleScreen(),
      );
    },
    ProfileScreenRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const ProfileScreen(),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          AuthScreenRoute.name,
          path: '/auth-screen',
        ),
        RouteConfig(
          PrimaryScreenRoute.name,
          path: '/',
          children: [
            RouteConfig(
              CoursesRouter.name,
              path: 'empty-router-page',
              parent: PrimaryScreenRoute.name,
              children: [
                RouteConfig(
                  CoursesScreenRoute.name,
                  path: '',
                  parent: CoursesRouter.name,
                )
              ],
            ),
            RouteConfig(
              AssignmentsRouter.name,
              path: 'empty-router-page',
              parent: PrimaryScreenRoute.name,
              children: [
                RouteConfig(
                  AssignmentsScreenRoute.name,
                  path: '',
                  parent: AssignmentsRouter.name,
                )
              ],
            ),
            RouteConfig(
              GradeBookRouter.name,
              path: 'empty-router-page',
              parent: PrimaryScreenRoute.name,
              children: [
                RouteConfig(
                  GradeBookScreenRoute.name,
                  path: '',
                  parent: GradeBookRouter.name,
                )
              ],
            ),
            RouteConfig(
              ScheduleRouter.name,
              path: 'empty-router-page',
              parent: PrimaryScreenRoute.name,
              children: [
                RouteConfig(
                  ScheduleScreenRoute.name,
                  path: '',
                  parent: ScheduleRouter.name,
                )
              ],
            ),
            RouteConfig(
              ProfileRouter.name,
              path: 'empty-router-page',
              parent: PrimaryScreenRoute.name,
              children: [
                RouteConfig(
                  ProfileScreenRoute.name,
                  path: '',
                  parent: ProfileRouter.name,
                )
              ],
            ),
          ],
        ),
      ];
}

/// generated route for
/// [AuthScreen]
class AuthScreenRoute extends PageRouteInfo<void> {
  const AuthScreenRoute()
      : super(
          AuthScreenRoute.name,
          path: '/auth-screen',
        );

  static const String name = 'AuthScreenRoute';
}

/// generated route for
/// [PrimaryScreen]
class PrimaryScreenRoute extends PageRouteInfo<void> {
  const PrimaryScreenRoute({List<PageRouteInfo>? children})
      : super(
          PrimaryScreenRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'PrimaryScreenRoute';
}

/// generated route for
/// [EmptyRouterPage]
class CoursesRouter extends PageRouteInfo<void> {
  const CoursesRouter({List<PageRouteInfo>? children})
      : super(
          CoursesRouter.name,
          path: 'empty-router-page',
          initialChildren: children,
        );

  static const String name = 'CoursesRouter';
}

/// generated route for
/// [EmptyRouterPage]
class AssignmentsRouter extends PageRouteInfo<void> {
  const AssignmentsRouter({List<PageRouteInfo>? children})
      : super(
          AssignmentsRouter.name,
          path: 'empty-router-page',
          initialChildren: children,
        );

  static const String name = 'AssignmentsRouter';
}

/// generated route for
/// [EmptyRouterPage]
class GradeBookRouter extends PageRouteInfo<void> {
  const GradeBookRouter({List<PageRouteInfo>? children})
      : super(
          GradeBookRouter.name,
          path: 'empty-router-page',
          initialChildren: children,
        );

  static const String name = 'GradeBookRouter';
}

/// generated route for
/// [EmptyRouterPage]
class ScheduleRouter extends PageRouteInfo<void> {
  const ScheduleRouter({List<PageRouteInfo>? children})
      : super(
          ScheduleRouter.name,
          path: 'empty-router-page',
          initialChildren: children,
        );

  static const String name = 'ScheduleRouter';
}

/// generated route for
/// [EmptyRouterPage]
class ProfileRouter extends PageRouteInfo<void> {
  const ProfileRouter({List<PageRouteInfo>? children})
      : super(
          ProfileRouter.name,
          path: 'empty-router-page',
          initialChildren: children,
        );

  static const String name = 'ProfileRouter';
}

/// generated route for
/// [CoursesScreen]
class CoursesScreenRoute extends PageRouteInfo<void> {
  const CoursesScreenRoute()
      : super(
          CoursesScreenRoute.name,
          path: '',
        );

  static const String name = 'CoursesScreenRoute';
}

/// generated route for
/// [AssignmentsScreen]
class AssignmentsScreenRoute extends PageRouteInfo<void> {
  const AssignmentsScreenRoute()
      : super(
          AssignmentsScreenRoute.name,
          path: '',
        );

  static const String name = 'AssignmentsScreenRoute';
}

/// generated route for
/// [GradeBookScreen]
class GradeBookScreenRoute extends PageRouteInfo<void> {
  const GradeBookScreenRoute()
      : super(
          GradeBookScreenRoute.name,
          path: '',
        );

  static const String name = 'GradeBookScreenRoute';
}

/// generated route for
/// [ScheduleScreen]
class ScheduleScreenRoute extends PageRouteInfo<void> {
  const ScheduleScreenRoute()
      : super(
          ScheduleScreenRoute.name,
          path: '',
        );

  static const String name = 'ScheduleScreenRoute';
}

/// generated route for
/// [ProfileScreen]
class ProfileScreenRoute extends PageRouteInfo<void> {
  const ProfileScreenRoute()
      : super(
          ProfileScreenRoute.name,
          path: '',
        );

  static const String name = 'ProfileScreenRoute';
}
