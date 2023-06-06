import 'package:diploma_mobile/src/features/assignments/data/repo/repo_assignment.dart';
import 'package:diploma_mobile/src/features/courses/course_unit_material/data/repo/repo_unit_material.dart';
import 'package:diploma_mobile/src/features/courses/courses_detailed/data/repo/repo_units.dart';
import 'package:diploma_mobile/src/features/gradebook/data/repo/repo_gradebook.dart';
import 'package:diploma_mobile/src/features/gradebook/gradebook_detailed/data/repo/repo_gradebook_detailed.dart';
import 'package:diploma_mobile/src/features/profile/data/repo/repo_profile.dart';
import 'package:diploma_mobile/src/features/profile/my_resume/create_resume/data/repo/repo_create_resume.dart';
import 'package:diploma_mobile/src/features/profile/my_resume/data/repo/repo_resume.dart';
import 'package:diploma_mobile/src/features/schedule/data/repo/repo_schedule.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../../../api/api.dart';
import '../../../auth/sign/data/repo/repo_sign.dart';
import '../../../courses/data/repo/repo_courses.dart';
import '../../../localization/locale_repo.dart';

class ReposProvider extends StatelessWidget {
  const ReposProvider({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        RepositoryProvider<ILocaleRepo>(
          create: (context) => LocaleRepo(),
        ),
        RepositoryProvider(
          create: (context) => Api(),
        ),
        Provider(
          create: (context) => RepoCourses(
            api: RepositoryProvider.of<Api>(context),
          ),
        ),
        Provider(
          create: (context) => RepoUnits(
            api: RepositoryProvider.of<Api>(context),
          ),
        ),
        Provider(
          create: (context) => RepoAssignment(
            api: RepositoryProvider.of<Api>(context),
          ),
        ),
        Provider(
          create: (context) => RepoGradeBook(
            api: RepositoryProvider.of<Api>(context),
          ),
        ),
        Provider(
          create: (context) => RepoSign(),
        ),
        Provider(
          create: (context) => RepoGradeBookDetailed(
            api: RepositoryProvider.of<Api>(context),
          ),
        ),
        Provider(
          create: (context) => RepoUnitMaterial(
            api: RepositoryProvider.of<Api>(context),
          ),
        ),
        Provider(
          create: (context) => RepoResume(
            api: RepositoryProvider.of<Api>(context),
          ),
        ),
        Provider(
          create: (context) => RepoCreateResume(
            api: RepositoryProvider.of<Api>(context),
          ),
        ),
        Provider(
          create: (context) => RepoSchedule(
            api: RepositoryProvider.of<Api>(context),
          ),
        ),Provider(
          create: (context) => RepoProfile(
            api: RepositoryProvider.of<Api>(context),
          ),
        ),
      ],
      child: child,
    );
  }
}
