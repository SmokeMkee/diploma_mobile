import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../constants/app_assets.dart';
import '../../../../../constants/app_colors.dart';
import '../../../../../constants/app_styles.dart';

class CourseUnit extends StatelessWidget {
  const CourseUnit({Key? key}) : super(key: key);

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
        title: Column(
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            children: [
              const Text(
                'Lecture',
                style: AppStyles.s14w500,
              ),
              Container(
                height: 1,
                width: double.infinity,
                color: AppColors.gray200,
              ),
              const SizedBox(height: 24),
              const LectureInfoContainer(),
              const SizedBox(height: 24),
              Container(
                height: 1,
                width: double.infinity,
                color: AppColors.gray200,
              ),
              const SizedBox(height: 24),
              const FirstConstructor(),
              const SizedBox(height: 24),
              Container(
                height: 1,
                width: double.infinity,
                color: AppColors.gray200,
              ),
              const SizedBox(height: 24),
              const SecondConstructor(),
            ],
          ),
        ),
      ),
    );
  }
}

class SecondConstructor extends StatelessWidget {
  const SecondConstructor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'USING PRESENT PERFECT',
          style: AppStyles.s14w500,
        ),
        const SizedBox(height: 10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(AppAssets.svg.indicator),
            const SizedBox(width: 10),
            Flexible(
              child: Text('Present Perfect is an action that '
                  'took place in the past, but matters to us'
                  ' now, in the present. Therefore, Present'
                  ' Perfect is used when it is necessary to '
                  'show the result of a perfect action in the'
                  ' present.Describe below chart using Present Perfect',
                style: AppStyles.s11w400.copyWith(fontSize: 12),),
            ),
          ],
        ),
        Image.asset(AppAssets.images.diagram)
      ],
    );
  }
}

class FirstConstructor extends StatelessWidget {
  const FirstConstructor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'RULE',
          style: AppStyles.s14w500,
        ),
        const SizedBox(height: 10),
        Text(
          'Present Perfect causes difficulties for students,'
          ' because in Russian it has no analogues. In general, '
          'Present Perfect indicates an action that took place '
          'in the indefinite past before the moment of speech,'
          ' but has some connection with the present - we are '
          'interested in the result of this action now - in the '
          'present.',
          style: AppStyles.s11w400.copyWith(fontSize: 12),
        ),
        const SizedBox(height: 10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            SvgPicture.asset(AppAssets.svg.lightBulb),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                'Words indicating the Present Perfect are '
                'usually adverbs of indefinite tense: recently, '
                'finally, ever, never, just, for, since, yet,'
                ' already.',
                style: AppStyles.s11w400.copyWith(fontSize: 12),
              ),
            )
          ],
        )
      ],
    );
  }
}

class LectureInfoContainer extends StatefulWidget {
  const LectureInfoContainer({Key? key}) : super(key: key);

  @override
  State<LectureInfoContainer> createState() => _LectureInfoContainerState();
}

class _LectureInfoContainerState extends State<LectureInfoContainer> {
  PageController pageController = PageController();

  int getCurrentIndex() {
    return pageController.page!.round();
  }

  int currentPage = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.gray200,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(10),
        color: AppColors.gray200.withOpacity(0.1),
      ),
      child: Column(
        children: [
          LessonPageBuilder(
            controller: pageController,
            imagePath: [
              ...List.generate(
                10,
                (index) =>
                    'https://www.gannett-cdn.com/presto/2021/03/22/NRCD/9d9dd9e4-e84a'
                    '-402e-ba8f-daa659e6e6c5-PhotoWord_003'
                    '.JPG?width=1320&height=850&fit=crop&format=pjpg&auto=webp',
              ),
            ],
            valueChanged: (int value) {
              setState(() {
                currentPage = value + 1;
              });
            },
          ),
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  pageController.previousPage(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeIn);
                },
                child: SvgPicture.asset(AppAssets.svg.arrowLeft2),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 31),
                child: Text('$currentPage out of 10'),
              ),
              GestureDetector(
                onTap: () {
                  pageController.nextPage(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeIn);
                },
                child: SvgPicture.asset(AppAssets.svg.arrowRight2),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class LessonPageBuilder extends StatelessWidget {
  const LessonPageBuilder(
      {Key? key,
      required this.controller,
      required this.imagePath,
      required this.valueChanged})
      : super(key: key);
  final PageController controller;
  final List<String> imagePath;
  final ValueChanged<int> valueChanged;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        onPageChanged: valueChanged,
        controller: controller,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, int index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              imagePath[index],
              fit: BoxFit.cover,
            ),
          );
        },
        itemCount: imagePath.length,
      ),
    );
  }
}
