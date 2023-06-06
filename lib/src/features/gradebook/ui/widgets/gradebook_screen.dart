import 'package:diploma_mobile/constants/app_styles.dart';
import 'package:diploma_mobile/src/features/gradebook/gradebook_detailed/ui/gradebook_detailed_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constants/app_assets.dart';
import '../../../../../constants/app_colors.dart';
import '../../../../widgets/empty_widget.dart';
import '../../../courses/ui/courses_screen.dart';
import '../../data/bloc/gradebook_bloc.dart';

class GradeBookScreen extends StatelessWidget {
  const GradeBookScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
        title: const Text(
          'Gradebook',
          style: AppStyles.s15w600,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Semantics(
          explicitChildNodes: true,
          enabled: true,
          child: Column(
            children: [
              const SearchWidget(),
              BlocBuilder<GradebookBloc, GradebookState>(
                builder: (context, state) {
                  if (state is GradebookLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is GradebookError) {
                    return Center(
                      child: Text(state.message),
                    );
                  }
                  if (state is GradebookData) {
                    return state.listGradeBook.isEmpty
                        ? Expanded(
                            child: AppEmptyWidget(
                              header: 'You don\'t have any grades yet',
                              svgPath: AppAssets.svg.emptyGradebook,
                              subTitle:
                                  'Looks like you don\'t have any courses added yet, please wait while your teacher adds you',
                            ),
                          )
                        : Expanded(
                            child: Semantics(
                              explicitChildNodes: true,
                              enabled: true,
                              child: ListView.builder(
                                itemCount: state.listGradeBook.length,
                                itemBuilder: (context, int index) {
                                  return Semantics(
                                    button: true,
                                    label: 'Какая то страница',
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                GradeBookDetailedScreen(
                                              courseId: state
                                                      .listGradeBook[index]
                                                      .courseId ??
                                                  0,
                                              teacherName: state
                                                      .listGradeBook[index]
                                                      .teacherName ??
                                                  'no info',
                                              courseName: state
                                                      .listGradeBook[index]
                                                      .courseName ??
                                                  'no info',
                                            ),
                                          ),
                                        );
                                      },
                                      child: CoursesCard(
                                        courseName: state.listGradeBook[index]
                                                .courseName ??
                                            'no info',
                                        teacherName: state.listGradeBook[index]
                                                .teacherName ??
                                            'no info',
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
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
          child: Semantics(
            explicitChildNodes: true,
            enabled: true,
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
                Semantics(
                  explicitChildNodes: true,
                  enabled: true,
                  child: Column(
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
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
