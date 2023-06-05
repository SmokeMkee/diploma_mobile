import 'package:diploma_mobile/constants/app_assets.dart';
import 'package:diploma_mobile/src/features/schedule/data/bloc/schedule_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/app_styles.dart';
import '../data/dto/dto_schedule.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> days = [
      'MONDAY',
      'TUESDAY',
      'WEDNESDAY',
      'THURSDAY',
      'FRIDAY',
      'SATURDAY',
      'SUNDAY'
    ];
    return DefaultTabController(
      length: 7,
      child: Scaffold(
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
                const Text(
                  'Schedule',
                  style: AppStyles.s15w600,
                ),
                Text(
                  DateFormat.MMMMEEEEd('en').format(DateTime.now()),
                  style: AppStyles.s11w400,
                )
              ],
            ),
          ),
        ),
        body: Semantics(
          explicitChildNodes: true,
          enabled: true,
          child: Column(
            children: [
              const SizedBox(height: 12),
              const TabBar(
                isScrollable: true,
                indicatorColor: AppColors.accent,
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: AppColors.primary,
                labelStyle: AppStyles.s17w500,
                unselectedLabelColor: AppColors.gray600,
                tabs: [
                  Text('Mon'),
                  Text('Tue'),
                  Text('Wed'),
                  Text('Thur'),
                  Text('Fri'),
                  Text('Sat'),
                  Text('Sun'),
                ],
              ),
              Container(
                height: 1,
                width: double.infinity,
                color: AppColors.gray200,
              ),
              Flexible(
                child: TabBarView(
                  children: [
                    ...List.generate(
                        days.length, (index) => ScheduleList(day: days[index]))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(AppAssets.svg.emptySchedule),
          const Text(
            'Schedule not added yet',
            style: AppStyles.s15w600,
          ),
          const SizedBox(
            height: 19,
          ),
          Text(
            'Looks like you don\'t have a timetable yet, please wait for your teacher to add a lesson',
            textAlign: TextAlign.center,
            style: AppStyles.s14w400.copyWith(color: AppColors.gray600),
          )
        ],
      ),
    );
  }
}

class ScheduleCard extends StatelessWidget {
  final Schedule schedule;

  const ScheduleCard({Key? key, required this.schedule}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
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
                        schedule.lessonDuration ?? 'no info',
                        style: AppStyles.s14w500.copyWith(
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        schedule.courseName ?? 'no info',
                        style: AppStyles.s14w500.copyWith(),
                      ),
                      Text(
                        'Zoom',
                        style: AppStyles.s11w400.copyWith(
                          color: AppColors.subtitle,
                        ),
                      )
                    ],
                  ),
                ),
                const Spacer(),
                const Text('Lecture')
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CourseContainer extends StatelessWidget {
  const CourseContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: const Color(0xff6B75C7),
      ),
      padding: const EdgeInsets.all(10),
      child: Text(
        'GE',
        style: AppStyles.s18w500.copyWith(color: AppColors.white),
      ),
    );
  }
}

class ScheduleList extends StatefulWidget {
  final String day;

  const ScheduleList({Key? key, required this.day}) : super(key: key);

  @override
  State<ScheduleList> createState() => _ScheduleListState();
}

class _ScheduleListState extends State<ScheduleList> {
  @override
  void initState() {
    context.read<ScheduleBloc>().add(FetchScheduleEvent(day: widget.day));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      explicitChildNodes: true,
      enabled: true,
      child: BlocBuilder<ScheduleBloc, ScheduleState>(
        builder: (context, state) {
          if (state is ScheduleLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ScheduleError) {
            return Center(
              child: Text(state.message),
            );
          }
          if (state is ScheduleData) {
            return state.scheduleList.isEmpty ? EmptyWidget() :  ListView.builder(
              itemBuilder: (context, int index) {
                return ScheduleCard(
                  schedule: state.scheduleList[index],
                );
              },
              shrinkWrap: true,
              itemCount: state.scheduleList.length,
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
