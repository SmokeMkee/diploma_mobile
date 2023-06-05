import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/app_styles.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    Semantics(
                      explicitChildNodes: true,
                      enabled: true,
                      child: ListView.builder(
                        itemBuilder: (context, int index) {
                          return const ScheduleCard();
                        },
                        shrinkWrap: true,
                        itemCount: 3,
                      ),
                    ),
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

class ScheduleCard extends StatelessWidget {
  const ScheduleCard({Key? key}) : super(key: key);

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
                        '09:00 - 09:30',
                        style: AppStyles.s14w500.copyWith(
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        'General English',
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
