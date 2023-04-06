import 'package:diploma_mobile/constants/app_styles.dart';
import 'package:diploma_mobile/src/features/gradebook/gradebook_detailed/ui/gradebook_detailed_screen.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/app_colors.dart';
import '../../../courses/ui/courses_screen.dart';

class GradeBookScreen extends StatelessWidget {
  const GradeBookScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Courses> list = [
      Courses(
          coursesName: 'General English',
          teacherName: 'Teacher: Alan Alexander'),
      Courses(
          coursesName: 'UX/UI Design', teacherName: 'Teacher: Edward Jones'),
      Courses(
          coursesName: 'Web Development',
          teacherName: 'Teacher: Charles Franklin'),
      Courses(
          coursesName: 'Animation Animation',
          teacherName: 'Teacher: Julio James'),
    ];
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
        child: Column(
          children: [
            const SearchWidget(),
            Expanded(
              child: ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, int index) {
                  return GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const GradeBookDetailedScreen(),
                      ),
                    ),
                    child: CoursesCard(
                      courseName: list[index].coursesName,
                      teacherName: list[index].teacherName,
                    ),
                  );
                },
              ),
            ),
          ],
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
                    'Teacher: Alan Alexander',
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