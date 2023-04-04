import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';


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
        // BlocProvider(
        //   create: (context) => CoursesBloc(
        //     repo: RepositoryProvider.of<RepoCourses>(context),
        //   )..add(FetchCoursesEvent()),
        // ),
        // ChangeNotifierProvider<ThemeManager>(
        //   create: (context) => ThemeManager(),
        // ),
      ],
      child: child,
    );
  }
}
