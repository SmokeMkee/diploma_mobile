import 'package:diploma_mobile/constants/app_assets.dart';
import 'package:diploma_mobile/src/features/courses/ui/courses_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../constants/app_colors.dart';
import '../../../../../constants/app_styles.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({Key? key}) : super(key: key);

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
        title: const Text(
          'Saved',
          style: AppStyles.s15w600,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          children: [
            const SearchWidget(),
            const SizedBox(height: 15),
            Expanded(
              child: ListView.builder(
                  itemCount: 7,
                  shrinkWrap: true,
                  itemBuilder: (context, int index) {
                    return const SavedCard();
                  }),
            )
          ],
        ),
      ),
    );
  }
}

class SavedCard extends StatelessWidget {
  const SavedCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: AppColors.gray200)),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Present Perfect',
                style: AppStyles.s15w600,
              ),
              Text(
                'Course name: General English',
                style: AppStyles.s14w500.copyWith(color: AppColors.gray600),
              ),
              Text(
                'Subcourse: Week 1',
                style: AppStyles.s14w500.copyWith(color: AppColors.gray600),
              )
            ],
          ),
          SvgPicture.asset(AppAssets.svg.threeDots)
        ],
      ),
    );
  }
}
