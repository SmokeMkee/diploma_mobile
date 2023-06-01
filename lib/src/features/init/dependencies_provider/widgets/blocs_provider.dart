import 'package:diploma_mobile/src/features/courses/courses_detailed/data/bloc/courses_units_bloc.dart';
import 'package:diploma_mobile/src/features/courses/courses_detailed/data/repo/repo_units.dart';
import 'package:diploma_mobile/src/features/gradebook/data/repo/repo_gradebook.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../assignments/data/bloc/assignments_bloc.dart';
import '../../../assignments/data/repo/repo_assignment.dart';
import '../../../courses/data/bloc/courses_bloc.dart';
import '../../../courses/data/repo/repo_courses.dart';
import '../../../gradebook/data/bloc/gradebook_bloc.dart';

class BlocsProvider extends StatelessWidget {
  const BlocsProvider({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // BlocProvider(
        //   create: (context) => ProfileBloc(
        //     repo: RepositoryProvider.of<RepoProfile>(context),
        //   )..add(
        //       FetchInfoProfile(),
        //     ),
        // ),
        // BlocProvider(
        //   create: (context) => GroupBloc(
        //     repo: RepositoryProvider.of<RepoGroup>(context),
        //   )..add(FetchGroupEvent()),
        // ),
        // BlocProvider(
        //   create: (context) => GroupDetailedBloc(
        //     repo: RepositoryProvider.of<RepoGroupDetailed>(context),
        //   ),
        // ),
        BlocProvider<CoursesBloc>(
          create: (context) => CoursesBloc(
            repo: RepositoryProvider.of<RepoCourses>(context),
          )..add(FetchCoursesEvent()),
        ),
        BlocProvider<CoursesUnitsBloc>(
          create: (context) => CoursesUnitsBloc(
            repo: RepositoryProvider.of<RepoUnits>(context),
          ),
        ),
        BlocProvider<AssignmentsBloc>(
          create: (context) => AssignmentsBloc(
            repo: RepositoryProvider.of<RepoAssignment>(context),
          )..add(FetchAssignmentsEvent()),
        ),
        BlocProvider<GradebookBloc>(
          create: (context) => GradebookBloc(
            repo: RepositoryProvider.of<RepoGradeBook>(context),
          )..add(FetchGradebookEvent()),
        ),
        // ChangeNotifierProvider<ThemeManager>(
        //   create: (context) => ThemeManager(),
        // ),
      ],
      child: child,
    );
  }
}
