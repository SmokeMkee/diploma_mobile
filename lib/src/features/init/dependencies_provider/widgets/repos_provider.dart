import 'package:diploma_mobile/src/features/courses/courses_detailed/data/repo/repo_units.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../../../api/api.dart';
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
        )
      ],
      child: child,
    );
  }
}
