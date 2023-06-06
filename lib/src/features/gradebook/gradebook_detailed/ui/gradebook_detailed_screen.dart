import 'package:diploma_mobile/constants/app_assets.dart';
import 'package:diploma_mobile/constants/app_styles.dart';
import 'package:diploma_mobile/src/features/gradebook/gradebook_detailed/data/bloc/gradebook_detailed_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constants/app_colors.dart';
import '../../../../widgets/empty_widget.dart';

class GradeBookDetailedScreen extends StatefulWidget {
  const GradeBookDetailedScreen(
      {Key? key,
      required this.courseId,
      required this.teacherName,
      required this.courseName})
      : super(key: key);
  final int courseId;
  final String teacherName;
  final String courseName;

  @override
  State<GradeBookDetailedScreen> createState() =>
      _GradeBookDetailedScreenState();
}

class _GradeBookDetailedScreenState extends State<GradeBookDetailedScreen> {
  @override
  void initState() {
    context
        .read<GradebookDetailedBloc>()
        .add(FetchGradebookEvent(courseId: widget.courseId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: AppColors.white,
        centerTitle: true,
        title: Semantics(
          explicitChildNodes: true,
          enabled: true,
          child: Column(
            children: [
              Text(
                widget.courseName,
                style: AppStyles.s15w600,
              ),
              Text(
                widget.teacherName,
                style: AppStyles.s11w400,
              )
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Semantics(
          explicitChildNodes: true,
          enabled: true,
          child: Column(
            children: [
              const Divider(
                color: AppColors.primary,
                height: 2,
              ),
              const SizedBox(height: 20),
              BlocBuilder<GradebookDetailedBloc, GradebookDetailedState>(
                builder: (context, state) {
                  if (state is GradebookDetailedLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is GradebookDetailedData) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 40),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xFFC3DDF5),
                      ),
                      child: Semantics(
                        explicitChildNodes: true,
                        enabled: true,
                        child: Column(
                          children: [
                            Text(
                              'Total score:',
                              style: AppStyles.s15w500
                                  .copyWith(color: AppColors.gray600),
                            ),
                            Text(
                              '${state.listGradeBook.total} %',
                              style: AppStyles.s20w600
                                  .copyWith(color: AppColors.gray600),
                            )
                          ],
                        ),
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
              const SizedBox(height: 20),
              Semantics(
                explicitChildNodes: true,
                enabled: true,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Assignments',
                      style:
                          AppStyles.s14w500.copyWith(color: AppColors.gray600),
                    ),
                    Text(
                      'Mark',
                      style:
                          AppStyles.s14w500.copyWith(color: AppColors.gray600),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: Semantics(
                  explicitChildNodes: true,
                  enabled: true,
                  child: BlocBuilder<GradebookDetailedBloc,
                      GradebookDetailedState>(
                    builder: (context, state) {
                      if (state is GradebookDetailedLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (state is GradebookDetailedData) {
                        var list = state.listGradeBook.studentGradeBookDtoList;
                        return state.listGradeBook.studentGradeBookDtoList ==
                                    null ||
                                state.listGradeBook.studentGradeBookDtoList!
                                    .isEmpty
                            ? Expanded(
                                child: AppEmptyWidget(
                                  header: 'It\'s empty here',
                                  svgPath: AppAssets.svg.emptyGrades,
                                  subTitle:
                                      'When your grades and attendance are posted, it will appear here!',
                                ),
                              )
                            : ListView.builder(
                                itemCount: list?.length ?? 0,
                                itemBuilder: (context, int index) {
                                  return GradeCard(
                                    grade: list?[index].grade ?? 'no info',
                                    assignmentName:
                                        list?[index].sectionName ?? 'no info',
                                    status: list?[index].status ?? 'no info',
                                  );
                                },
                              );
                      }
                      if (state is GradebookDetailedInitial) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (state is GradebookDetailedError) {
                        return Center(
                          child: Text(state.message),
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

void showFeedbackSheet(BuildContext context) {
  showModalBottomSheet(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(12),
        topRight: Radius.circular(12),
      ),
    ),
    context: context,
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Semantics(
          explicitChildNodes: true,
          enabled: true,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 11),
              Container(
                height: 4,
                width: 40,
                decoration: BoxDecoration(
                    color: AppColors.gray600,
                    borderRadius: BorderRadius.circular(5)),
              ),
              const SizedBox(
                height: 30,
              ),
              Semantics(
                explicitChildNodes: true,
                enabled: true,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Feedback',
                      style: AppStyles.s20w600,
                    ),
                    Semantics(
                      button: true,
                      label: 'Какая то страница',
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const CircleAvatar(
                            backgroundColor: AppColors.gray400,
                            radius: 12,
                            child: Icon(
                              Icons.close,
                              color: AppColors.white,
                              size: 17,
                            )),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 18),
              const FeedbackCard(),
            ],
          ),
        ),
      );
    },
  );
}

class FeedbackCard extends StatelessWidget {
  const FeedbackCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: AppColors.gray200)),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Semantics(
        explicitChildNodes: true,
        enabled: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Semantics(
              explicitChildNodes: true,
              enabled: true,
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 15,
                    child: Image.asset(AppAssets.images.profile),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    'Julio James',
                    style: AppStyles.s14w500,
                  ),
                  const SizedBox(width: 16),
                  Text(
                    '6 hours ago',
                    style: AppStyles.s11w400.copyWith(
                      fontSize: 12,
                      color: AppColors.gray400,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'I am truly impressed with how you have managed to meet every goal set before you. Good job!',
              style: AppStyles.s11w400.copyWith(fontSize: 12),
            )
          ],
        ),
      ),
    );
  }
}

class GradeCard extends StatelessWidget {
  const GradeCard(
      {Key? key,
      required this.grade,
      required this.assignmentName,
      required this.status})
      : super(key: key);
  final String grade;
  final String assignmentName;
  final String status;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: AppColors.gray200)),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Semantics(
        explicitChildNodes: true,
        enabled: true,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Semantics(
              explicitChildNodes: true,
              enabled: true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    assignmentName,
                    style: AppStyles.s15w600,
                  ),
                  Text(
                    status,
                    style: AppStyles.s14w500.copyWith(color: AppColors.gray600),
                  )
                ],
              ),
            ),
            Semantics(
              explicitChildNodes: true,
              enabled: true,
              child: Column(
                children: [
                  Text(
                    grade,
                    style: AppStyles.s18w500,
                  ),
                  // IconButton(
                  //     onPressed: () {
                  //       showFeedbackSheet(context);
                  //     },
                  //     icon: SvgPicture.asset(AppAssets.svg.feedback))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Attendance extends StatelessWidget {
  const Attendance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Semantics(
      explicitChildNodes: true,
      enabled: true,
      child: Column(
        children: const [
          Divider(
            color: AppColors.primary,
            height: 2,
          )
        ],
      ),
    );
  }
}
