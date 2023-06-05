import 'package:diploma_mobile/src/features/profile/my_resume/create_resume/data/view_model/create_model.dart';
import 'package:diploma_mobile/src/features/profile/my_resume/create_resume/ui/step1.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../constants/app_styles.dart';

class Step2 extends StatefulWidget {
  const Step2({Key? key}) : super(key: key);

  @override
  State<Step2> createState() => _Step2State();
}

class _Step2State extends State<Step2> {
  TextEditingController desiredPositionController = TextEditingController();
  TextEditingController salaryController = TextEditingController();
  TextEditingController startWorkController = TextEditingController();
  TextEditingController endWorkController = TextEditingController();
  TextEditingController organizationController = TextEditingController();
  TextEditingController positionController = TextEditingController();

  @override
  void dispose() {
    desiredPositionController.dispose();
    salaryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var vm = context.read<CreateModel>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Profession',
            style: AppStyles.s20w600,
          ),
          TextFieldTile(
            title: 'Desired position',
            controller: desiredPositionController,
            onChanged: (value) {
              vm.resume.desiredPosition = value;
            },
          ),
          TextFieldTile(
            title: 'Salary',
            onChanged: (value) {
              vm.resume.salary = value;
            },
            suffixIcon: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  '₸',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            controller: salaryController,
          ),
          const SizedBox(height: 10),
          const Text(
            'Work experience ',
            style: AppStyles.s20w600,
          ),
          TextFieldTile(
            title: 'Start of work',
            controller: startWorkController,
            onChanged: (value) {
              vm.resume.startOfWork = value;
            },
          ),
          TextFieldTile(
            title: 'End',
            controller: endWorkController,
            onChanged: (value) {
              vm.resume.endOfWork = value;
            },
          ),
          const SizedBox(height: 10),
          TextFieldTile(
            title: 'Organization',
            controller: organizationController,
            onChanged: (value) {
              vm.resume.organization = value;
            },
          ),
          TextFieldTile(
            title: 'Position',
            controller: positionController,
            onChanged: (value) {
              vm.resume.position = value;
            },
          ),
        ],
      ),
    );
  }
}
