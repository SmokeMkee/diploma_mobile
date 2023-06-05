import 'package:diploma_mobile/src/features/profile/my_resume/create_resume/ui/step1.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../constants/app_styles.dart';
import '../data/view_model/create_model.dart';

class Step3 extends StatefulWidget {
  const Step3({Key? key}) : super(key: key);

  @override
  State<Step3> createState() => _Step3State();
}

class _Step3State extends State<Step3> {
  TextEditingController levelController = TextEditingController();
  TextEditingController educationalInstitutionController =
      TextEditingController();
  TextEditingController departmentController = TextEditingController();
  TextEditingController specializationController = TextEditingController();
  TextEditingController yearOfGraduationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var vm = context.read<CreateModel>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Education',
            style: AppStyles.s20w600,
          ),
          TextFieldTile(
            onChanged: (value) {
              vm.resume.level = value;
            },
            title: 'Level',
            controller: levelController,
          ),
          TextFieldTile(
            title: 'Educational institution',
            controller: educationalInstitutionController,
            onChanged: (value) {
              vm.resume.educationalInstitution = value;
            },
          ),
          TextFieldTile(
            title: 'Department',
            controller: departmentController,
            onChanged: (value) {
              vm.resume.department = value;
            },
          ),
          TextFieldTile(
            title: 'Specialization',
            controller: specializationController,
            onChanged: (value) {
              vm.resume.specialization = value;
            },
          ),
          TextFieldTile(
            title: 'Year of graduation',
            onChanged: (value) {
              vm.resume.yearOfGraduation = value;
            },
            controller: yearOfGraduationController,
          ),
        ],
      ),
    );
  }
}
