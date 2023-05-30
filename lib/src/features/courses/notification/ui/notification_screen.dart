import 'package:diploma_mobile/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../constants/app_colors.dart';
import '../../../../../constants/app_styles.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

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
          'Notifications',
          style: AppStyles.s15w600,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
                      itemCount: 12,
                      shrinkWrap: true,
                      itemBuilder: (context, int index) {
                        return const NotificationCard();
                      }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  const NotificationCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Semantics(
        explicitChildNodes: true,
        enabled: true,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: const Color(0xFFC3DDF5),
              radius: 23,
              child: SvgPicture.asset(
                AppAssets.svg.assignments,
                color: AppColors.gray600,
                height: 28,
              ),
            ),
            const SizedBox(width: 20),
            Semantics(
              explicitChildNodes: true,
              enabled: true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'General English',
                    style: AppStyles.s17w500,
                  ),
                  Text(
                    'Graded for Homework 1',
                    style: AppStyles.s15w400.copyWith(color: AppColors.gray600),
                  )
                ],
              ),
            ),
            const Spacer(),
            Text(
              '3min ago',
              style: AppStyles.s14w400.copyWith(color: AppColors.gray600),
            )
          ],
        ),
      ),
    );
  }
}
