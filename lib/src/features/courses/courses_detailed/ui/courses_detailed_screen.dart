import 'package:diploma_mobile/src/features/courses/course_unit/ui/course_unit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../constants/app_assets.dart';
import '../../../../../constants/app_colors.dart';
import '../../../../../constants/app_styles.dart';

class CoursesDetailedScreen extends StatelessWidget {
  const CoursesDetailedScreen({Key? key}) : super(key: key);

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
            children: const [
              Text(
                'General English',
                style: AppStyles.s15w600,
              ),
              Text(
                'Alan Alexander',
                style: AppStyles.s11w400,
              )
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 16,
        ),
        child: Semantics(
          explicitChildNodes: true,
          enabled: true,
          child: Column(
            children: [
              Expanded(
                child: Semantics(
                  explicitChildNodes: true,
                  enabled: true,
                  child: ListView.builder(
                    itemCount: 4,
                    itemBuilder: (context, int index) {
                      return Semantics(
                        button: true,
                        label: 'какая то страница',
                        child: GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CourseUnit(),
                            ),
                          ),
                          child: CoursesDetailedCard(
                            index: index,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CoursesDetailedCard extends StatelessWidget {
  const CoursesDetailedCard({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 21),
          child: Semantics(
            explicitChildNodes: true,
            enabled: true,
            child: Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: AppColors.gray200,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: AppColors.white,
                    child: Text(
                      (index + 1).toString(),
                      style: AppStyles.s20w600.copyWith(
                        color: AppColors.gray900,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    'Week ${index + 1}',
                    style: AppStyles.s18w500,
                  ),
                ),
                SvgPicture.asset(AppAssets.svg.arrowRight2),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
