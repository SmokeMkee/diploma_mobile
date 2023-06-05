import 'package:diploma_mobile/src/features/profile/my_resume/create_resume/data/view_model/create_model.dart';
import 'package:diploma_mobile/src/features/profile/my_resume/create_resume/ui/step1.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../../../../constants/app_styles.dart';

class Step4 extends StatefulWidget {
  const Step4({Key? key}) : super(key: key);

  @override
  State<Step4> createState() => _Step4State();
}

class _Step4State extends State<Step4> {
  TextEditingController keySkillsController = TextEditingController();
  TextEditingController nativeLanguageController = TextEditingController();
  TextEditingController foreignLanguageController = TextEditingController();
  TextEditingController yourProfileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var vm = context.read<CreateModel>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Skills',
            style: AppStyles.s20w600,
          ),
          TextFieldTile(
            title: 'Key skills',
            controller: keySkillsController,
            onChanged: (value) {
              vm.resume.keySkills = value;
            },
          ),
          TextFieldTile(
            onChanged: (value) {
              vm.resume.nativeLanguage = value;
            },
            title: 'Native langiage',
            controller: nativeLanguageController,
          ),
          TextFieldTile(
            onChanged: (value) {
              //todo
             // vm.resume. = value;
            },
            title: 'Foreign languages',
            controller: foreignLanguageController,
          ),
          TextFieldTile(
            onChanged: (value) {
              vm.resume.yourProfile = value;
            },
            title: 'Your profile',
            controller: yourProfileController,
          ),
        ],
      ),
    );
  }
}
