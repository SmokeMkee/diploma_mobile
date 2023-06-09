import 'package:diploma_mobile/constants/app_assets.dart';
import 'package:diploma_mobile/constants/app_colors.dart';
import 'package:diploma_mobile/constants/app_styles.dart';
import 'package:diploma_mobile/src/features/courses/courses_detailed/ui/courses_detailed_screen.dart';
import 'package:diploma_mobile/src/features/profile/data/bloc/profile_bloc.dart';
import 'package:diploma_mobile/src/widgets/empty_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../courses_detailed/data/bloc/courses_units_bloc.dart';
import '../data/bloc/courses_bloc.dart';
import '../notification/ui/notification_screen.dart';

class Courses {
  Courses({required this.coursesName, required this.teacherName});

  final String coursesName;
  final String teacherName;
}

class CoursesScreen extends StatefulWidget {
  const CoursesScreen({Key? key}) : super(key: key);

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  @override
  void initState() {
    context.read<CoursesBloc>().add(FetchCoursesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.symmetric(horizontal: 15),
        //     child: CircleAvatar(
        //       radius: 23,
        //       backgroundColor: AppColors.gray600.withOpacity(0.1),
        //       child: IconButton(
        //         onPressed: () {
        //           Navigator.push(
        //             context,
        //             MaterialPageRoute(
        //               builder: (context) => const NotificationScreen(),
        //             ),
        //           );
        //         },
        //         icon: SvgPicture.asset(AppAssets.svg.notification),
        //       ),
        //     ),
        //   )
        // ],
        title: const AppBarTitleWidget(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const SearchWidget(),
            const SizedBox(height: 30),
            const Text('Courses', style: AppStyles.s20w600),
            BlocBuilder<CoursesBloc, CoursesState>(
              builder: (context, state) {
                if (state is CoursesData) {
                  return state.listCourses.isEmpty
                      ? Expanded(
                          child: AppEmptyWidget(
                            header: 'You don’t have any courses yet',
                            svgPath: AppAssets.svg.emptyCourses,
                            subTitle:
                                'It looks like you don\'t have any courses yet, please wait until your teacher adds you',
                          ),
                        )
                      : Expanded(
                          child: ListView.builder(
                            itemCount: state.listCourses.length,
                            itemBuilder: (context, int index) {
                              return GestureDetector(
                                onTap: () {
                                  context.read<CoursesUnitsBloc>().add(
                                        FetchCoursesUnitsEvent(
                                            courseId: state.listCourses[index]
                                                    .courseId ??
                                                0),
                                      );
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          CoursesDetailedScreen(
                                        courseName: state.listCourses[index]
                                                .courseName ??
                                            'No Info',
                                        courseId:
                                            state.listCourses[index].courseId ??
                                                0,
                                        teacherName: state.listCourses[index]
                                                .teacherName ??
                                            'No Info',
                                      ),
                                    ),
                                  );
                                },
                                child: CoursesCard(
                                  courseName:
                                      state.listCourses[index].courseName ??
                                          'no info',
                                  teacherName:
                                      state.listCourses[index].teacherName ??
                                          'No Info',
                                ),
                              );
                            },
                          ),
                        );
                }
                if (state is CoursesLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is CoursesError) {
                  return Center(
                    child: Text(state.message),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('Center'),
      ),
    );
  }
}

class CoursesCard extends StatelessWidget {
  const CoursesCard(
      {Key? key, required this.courseName, required this.teacherName})
      : super(key: key);
  final String courseName;
  final String teacherName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 8,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
          child: Row(
            children: [
              Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  color: AppColors.accent,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Text(
                    courseName.split(' ')[0][0] + courseName.split(' ')[1][0],
                    style: AppStyles.s18w500.copyWith(color: AppColors.white),
                  ),
                ),
              ),
              const SizedBox(width: 13),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    courseName,
                    style: AppStyles.s18w500,
                  ),
                  Text(
                    teacherName,
                    style: AppStyles.s11w400.copyWith(
                      fontSize: 12,
                      color: AppColors.gray600,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SearchWidget extends StatelessWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: AppColors.gray200,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: AppColors.gray200,
          ),
        ),
        hintText: 'Search',
        prefixIcon: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: SvgPicture.asset(
            AppAssets.svg.search,
            color: AppColors.gray200,
          ),
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: SvgPicture.asset(
            AppAssets.svg.filter,
            color: AppColors.primary,
          ),
        ),
      ),
    );
  }
}

class AppBarTitleWidget extends StatelessWidget {
  const AppBarTitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          AppAssets.images.profile,
          height: 45,
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello',
              style: AppStyles.s14w500.copyWith(color: AppColors.gray600),
            ),
            Text(
              context.watch<ProfileBloc>().profileInfo?.fullName ?? 'no name',
              style: AppStyles.s18w500,
            ),
          ],
        ),
      ],
    );
  }
}
