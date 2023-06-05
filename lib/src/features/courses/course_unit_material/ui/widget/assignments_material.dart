import 'package:diploma_mobile/constants/app_assets.dart';
import 'package:diploma_mobile/constants/app_styles.dart';
import 'package:diploma_mobile/src/features/courses/course_unit_material/ui/widget/pdf_and_other_materials.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../constants/app_colors.dart';

class AssignmentMaterial extends StatelessWidget {
  const AssignmentMaterial({
    Key? key,
    required this.articleHeading,
    required this.dueDate,
    required this.instructions, required this.material,
  }) : super(key: key);
  final String articleHeading;
  final String dueDate;
  final String instructions;
  final String material;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Text(
          articleHeading,
          style: AppStyles.s14w500,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              AppAssets.svg.time,
              color: AppColors.gray400,
            ),
            const SizedBox(width: 8),
            Text(
              dueDate,
              style: AppStyles.s11w400.copyWith(color: AppColors.gray400),
            )
          ],
        ),
        const SizedBox(height: 22),
        const Text(
          'Instructions',
          style: AppStyles.s14w500,
        ),
        Text(
          instructions,
          style: AppStyles.s11w400,
        ),
        const SizedBox(height: 20),
        const Text(
          'Material',
          style: AppStyles.s14w500,
        ),
        const SizedBox(height: 11),
      ],
    );
  }
}

class AssignmentFileContainer extends StatelessWidget {
  const AssignmentFileContainer({Key? key, required this.material}) : super(key: key);
  final String material;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.gray200, width: 2),
        color: AppColors.background,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          PdfAndOtherMaterials(file: material,),
        ],
      ),
    );
  }
}
