import 'package:diploma_mobile/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/app_styles.dart';
import '../../schedule/ui/schedule_screen.dart';
import '../saved_screen/ui/saved_screen.dart';

class AssignmentsScreen extends StatelessWidget {
  const AssignmentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          backgroundColor: AppColors.white,
          centerTitle: true,
          leading: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: CircleAvatar(
              radius: 3,
              backgroundColor: AppColors.gray600.withOpacity(0.1),
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SavedScreen(),
                    ),
                  );
                },
                icon: SvgPicture.asset(AppAssets.svg.saved),
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: CircleAvatar(
                radius: 23,
                backgroundColor: AppColors.gray600.withOpacity(0.1),
                child: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(AppAssets.svg.filter),
                ),
              ),
            ),
          ],
          title: Column(
            children: const [
              Text(
                'Assignments',
                style: AppStyles.s15w600,
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            const TabBar(
              isScrollable: true,
              indicatorColor: AppColors.accent,
              indicatorSize: TabBarIndicatorSize.label,
              labelColor: AppColors.primary,
              labelStyle: AppStyles.s15w600,
              unselectedLabelColor: AppColors.gray600,
              tabs: [
                Text('All assignments'),
                Text('Assigned'),
                Text('Past due')
              ],
            ),
            Container(
              height: 1,
              width: double.infinity,
              color: AppColors.gray200,
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ListView.builder(
                    itemBuilder: (context, int index) {
                      return const AssignmentsCard();
                    },
                    shrinkWrap: true,
                    itemCount: 4,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AssignmentsCard extends StatelessWidget {
  const AssignmentsCard({Key? key}) : super(key: key);

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
          child: Row(
            children: [
              const CourseContainer(),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Homework_1',
                    style: AppStyles.s14w500.copyWith(
                      fontSize: 12,
                    ),
                  ),
                  AssignmentCardTile(
                    svgPath: AppAssets.svg.time,
                    title: 'Due April 24, 2023 23:59',
                  ),
                  AssignmentCardTile(
                    svgPath: AppAssets.svg.courses,
                    title: 'Course: General English',
                  ),
                ],
              ),
            ],
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
