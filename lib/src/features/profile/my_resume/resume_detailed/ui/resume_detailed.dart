import 'dart:convert';

import 'package:diploma_mobile/constants/app_assets.dart';
import 'package:diploma_mobile/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../constants/app_colors.dart';
import '../../../../../widgets/app_divider.dart';
import '../../data/dto/resume.dart';

class ResumeDetailed extends StatelessWidget {
  const ResumeDetailed({Key? key, required this.resume}) : super(key: key);
  final Resume resume;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: AppColors.white,
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(AppAssets.svg.threeDots),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: Image.memory(
                  base64Decode(resume.photoData ?? ''),
                  fit: BoxFit.contain,
                ).image,
              ),
              Text(
                resume.desiredPosition ?? '',
                style: AppStyles.s20w600,
              ),
              Text(
                '${resume.firstName ?? ''} ${resume.secondName ?? ''}',
                style: AppStyles.s14w400.copyWith(
                  color: AppColors.grey2,
                ),
              ),
              ResumeSection(
                headerTitle: 'Contact details',
                infoSections: {
                  'Cellphone': resume.cellPhone ?? 'no info',
                  'Date of birth': resume.birthDate ?? 'no info',
                  'Gender': resume.gender ?? 'no info',
                  'City of residence': resume.cityOfResidence ?? 'no info',
                  'Work experience': resume.workExperience ?? 'no info',
                },
              ),
              ResumeSection(
                headerTitle: 'Profession',
                infoSections: {
                  'Desired position': resume.desiredPosition ?? 'no info',
                  'Salary': resume.salary ?? 'no info',
                  'Start of work': resume.startOfWork ?? 'no info',
                  'End': resume.endOfWork ?? 'no info',
                  'Organization': resume.organization ?? 'no info',
                  'Position': resume.position ?? 'no info',
                },
              ),
              ResumeSection(
                headerTitle: 'Education',
                infoSections: {
                  'Level': resume.level ?? 'no info',
                  'Educational institution':
                      resume.educationalInstitution ?? 'no info',
                  'Department': resume.department ?? 'no info',
                  'Specialization': resume.specialization ?? 'no info',
                  'Year of graduation': resume.yearOfGraduation ?? 'no info',
                },
              ),
              ResumeSection(
                headerTitle: 'Skills',
                infoSections: {
                  'Key skills': resume.keySkills ?? 'no info',
                  'Native language': resume.nativeLanguage ?? 'no info',
                  'Your profile': resume.yourProfile ?? 'no info',
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ResumeSection extends StatelessWidget {
  const ResumeSection(
      {Key? key, required this.headerTitle, required this.infoSections})
      : super(key: key);
  final String headerTitle;
  final Map<String, String> infoSections;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 21),
        const AppDivider(),
        const SizedBox(height: 21),
        Text(
          headerTitle,
          style: AppStyles.s15w600,
        ),
        const SizedBox(height: 3.5),
        ...List.generate(
          infoSections.length,
          (index) => SectionTile(
            title: infoSections.keys.toList()[index],
            subTitle: infoSections.values.toList()[index],
          ),
        ),
      ],
    );
  }
}

class SectionTile extends StatelessWidget {
  const SectionTile({Key? key, required this.title, required this.subTitle})
      : super(key: key);
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppStyles.s15w500.copyWith(color: AppColors.grey2),
          ),
          Text(
            subTitle,
            style: AppStyles.s15w400,
          ),
        ],
      ),
    );
  }
}
