import 'package:diploma_mobile/src/features/auth/sign/data/bloc/sign_bloc.dart';
import 'package:diploma_mobile/src/features/auth/sign/data/repo/repo_sign.dart';
import 'package:diploma_mobile/src/features/courses/course_unit_material/data/bloc/unit_material_bloc.dart';
import 'package:diploma_mobile/src/features/courses/courses_detailed/data/bloc/courses_units_bloc.dart';
import 'package:diploma_mobile/src/features/courses/courses_detailed/data/repo/repo_units.dart';
import 'package:diploma_mobile/src/features/gradebook/data/repo/repo_gradebook.dart';
import 'package:diploma_mobile/src/features/gradebook/gradebook_detailed/data/bloc/gradebook_detailed_bloc.dart';
import 'package:diploma_mobile/src/features/gradebook/gradebook_detailed/data/repo/repo_gradebook_detailed.dart';
import 'package:diploma_mobile/src/features/profile/data/repo/repo_profile.dart';
import 'package:diploma_mobile/src/features/profile/my_resume/create_resume/data/bloc/create_resume_bloc.dart';
import 'package:diploma_mobile/src/features/profile/my_resume/create_resume/data/repo/repo_create_resume.dart';
import 'package:diploma_mobile/src/features/profile/my_resume/create_resume/data/view_model/create_model.dart';
import 'package:diploma_mobile/src/features/profile/my_resume/data/bloc/resume_bloc.dart';
import 'package:diploma_mobile/src/features/profile/my_resume/data/repo/repo_resume.dart';
import 'package:diploma_mobile/src/features/schedule/data/bloc/schedule_bloc.dart';
import 'package:diploma_mobile/src/features/schedule/data/repo/repo_schedule.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../assignments/data/bloc/assignments_bloc.dart';
import '../../../assignments/data/repo/repo_assignment.dart';
import '../../../courses/course_unit_material/data/bloc_material/section_material_bloc.dart';
import '../../../courses/course_unit_material/data/repo/repo_unit_material.dart';
import '../../../courses/data/bloc/courses_bloc.dart';
import '../../../courses/data/repo/repo_courses.dart';
import '../../../gradebook/data/bloc/gradebook_bloc.dart';
import '../../../profile/data/bloc/profile_bloc.dart';

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
        BlocProvider<SignBloc>(
          create: (context) => SignBloc(
            repo: RepositoryProvider.of<RepoSign>(context),
          ),
        ),
        BlocProvider<GradebookBloc>(
          create: (context) => GradebookBloc(
            repo: RepositoryProvider.of<RepoGradeBook>(context),
          )..add(FetchCourseListGradebookEvent()),
        ),
        BlocProvider<GradebookDetailedBloc>(
          create: (context) => GradebookDetailedBloc(
            repo: RepositoryProvider.of<RepoGradeBookDetailed>(context),
          ),
        ),
        BlocProvider<UnitMaterialBloc>(
          create: (context) => UnitMaterialBloc(
            repo: RepositoryProvider.of<RepoUnitMaterial>(context),
          ),
        ),
        BlocProvider<ResumeBloc>(
          create: (context) => ResumeBloc(
            repo: RepositoryProvider.of<RepoResume>(context),
          )..add(FetchResumeEvent()),
        ),
        BlocProvider<CreateResumeBloc>(
          create: (context) => CreateResumeBloc(
            repo: RepositoryProvider.of<RepoCreateResume>(context),
          ),
        ),
        BlocProvider<SectionMaterialBloc>(
          create: (context) => SectionMaterialBloc(
            repo: RepositoryProvider.of<RepoUnitMaterial>(context),
          ),
        ),
        ChangeNotifierProvider<CreateModel>(
          create: (context) => CreateModel(),
        ),
        // ChangeNotifierProvider<ThemeManager>(
        //   create: (context) => ThemeManager(),
        // ),
        BlocProvider<ScheduleBloc>(
          create: (context) => ScheduleBloc(
            repo: RepositoryProvider.of<RepoSchedule>(context),
          ),
        ),
        BlocProvider<ProfileBloc>(
          create: (context) => ProfileBloc(
            repo: RepositoryProvider.of<RepoProfile>(context),
          )..add(FetchProfileEvent()),
        ),
      ],
      child: child,
    );
  }
}
