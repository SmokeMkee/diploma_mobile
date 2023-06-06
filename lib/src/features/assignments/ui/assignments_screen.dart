import 'package:diploma_mobile/constants/app_assets.dart';
import 'package:diploma_mobile/src/widgets/empty_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/app_styles.dart';
import '../../schedule/ui/schedule_screen.dart';
import '../data/bloc/assignments_bloc.dart';
import '../saved_screen/ui/saved_screen.dart';

class AssignmentsScreen extends StatelessWidget {
  const AssignmentsScreen({Key? key}) : super(key: key);

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
        // leading: Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 5),
        //   child: CircleAvatar(
        //     radius: 3,
        //     backgroundColor: AppColors.gray600.withOpacity(0.1),
        //     child: IconButton(
        //       onPressed: () {
        //         Navigator.push(
        //           context,
        //           MaterialPageRoute(
        //             builder: (context) => const SavedScreen(),
        //           ),
        //         );
        //       },
        //       icon: SvgPicture.asset(AppAssets.svg.saved),
        //     ),
        //   ),
        // ),
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.symmetric(horizontal: 15),
        //     child: CircleAvatar(
        //       radius: 23,
        //       backgroundColor: AppColors.gray600.withOpacity(0.1),
        //       child: IconButton(
        //         onPressed: () {},
        //         icon: SvgPicture.asset(AppAssets.svg.filter),
        //       ),
        //     ),
        //   ),
        // ],
        title: Semantics(
          explicitChildNodes: true,
          enabled: true,
          child:  Column(
            children: [
              Text(
                'Assignments',
                style: AppStyles.s15w600,
              ),
            ],
          ),
        ),
      ),
      body: Semantics(
        explicitChildNodes: true,
        enabled: true,
        child: Column(
          children: [
            Container(
              height: 1,
              width: double.infinity,
              color: AppColors.gray200,
            ),
            Expanded(
              child: BlocBuilder<AssignmentsBloc, AssignmentsState>(
                builder: (context, state) {
                  if (state is AssignmentsLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is AssignmentsError) {
                    return Center(
                      child: Text(state.message),
                    );
                  }
                  if (state is AssignmentsData) {
                    return state.listAssignments.isEmpty
                        ? Expanded(
                            child: AppEmptyWidget(
                              header: 'You don\'t have an assignment yet',
                              svgPath: AppAssets.svg.emptyAssignments,
                              subTitle:
                                  'Looks like you don\'t have saved educational materials from courses yet',
                            ),
                          )
                        : ListView.builder(
                            itemBuilder: (context, int index) {
                              return AssignmentsCard(
                                assignmentName:
                                    state.listAssignments[index].heading ?? '0',
                                courseName:
                                    state.listAssignments[index].instructions ??
                                        'sd',
                                date: state.listAssignments[index].startDate ??
                                    DateTime.now().toString(),
                              );
                            },
                            shrinkWrap: true,
                            itemCount: state.listAssignments.length,
                          );
                  }
                  return const SizedBox.shrink();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AssignmentsCard extends StatelessWidget {
  const AssignmentsCard(
      {Key? key,
      required this.assignmentName,
      required this.courseName,
      required this.date})
      : super(key: key);
  final String assignmentName;
  final String courseName;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.symmetric(vertical: 6),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          child: Semantics(
            explicitChildNodes: true,
            enabled: true,
            child: Row(
              children: [
                const CourseContainer(),
                const SizedBox(width: 12),
                Semantics(
                  explicitChildNodes: true,
                  enabled: true,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        assignmentName,
                        style: AppStyles.s14w500.copyWith(
                          fontSize: 12,
                        ),
                      ),
                      AssignmentCardTile(
                        svgPath: AppAssets.svg.time,
                        title: date.toString(),
                      ),
                      AssignmentCardTile(
                        svgPath: AppAssets.svg.courses,
                        title: courseName,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AssignmentCardTile extends StatelessWidget {
  const AssignmentCardTile(
      {Key? key, required this.title, required this.svgPath})
      : super(key: key);
  final String title;
  final String svgPath;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          svgPath,
          height: 15,
          color: AppColors.gray600,
        ),
        const SizedBox(width: 7),
        Text(
          title,
          style: AppStyles.s11w400.copyWith(
            fontSize: 12,
            color: AppColors.gray600,
          ),
        ),
      ],
    );
  }
}
