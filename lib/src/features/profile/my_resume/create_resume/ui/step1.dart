import 'package:diploma_mobile/constants/app_styles.dart';
import 'package:diploma_mobile/src/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../constants/app_colors.dart';
import '../data/view_model/create_model.dart';

class Step1 extends StatefulWidget {
  const Step1({Key? key}) : super(key: key);

  @override
  State<Step1> createState() => _Step1State();
}

class _Step1State extends State<Step1> {
  @override
  void dispose() {
    firstNameController.dispose();
    secondNameController.dispose();
    patronymicNameController.dispose();
    cellPhoneController.dispose();
    cityOfResidenceController.dispose();
    workExperienceController.dispose();
    dateOfBirthController.dispose();
    super.dispose();
  }

  TextEditingController firstNameController = TextEditingController();
  TextEditingController secondNameController = TextEditingController();
  TextEditingController patronymicNameController = TextEditingController();
  TextEditingController cellPhoneController = TextEditingController();
  TextEditingController citizenshipController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController cityOfResidenceController = TextEditingController();
  TextEditingController workExperienceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var vm = context.read<CreateModel>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Contact details',
            style: AppStyles.s20w600,
          ),
          TextFieldTile(
            title: 'First name',
            controller: firstNameController,
            onChanged: (value) {
              vm.resume.firstName = value;
            },
          ),
          TextFieldTile(
            title: 'Second name',
            controller: secondNameController,
            onChanged: (value) {
              vm.resume.secondName = value;
            },
          ),
          TextFieldTile(
            title: 'Patronymic name',
            controller: patronymicNameController,
            onChanged: (value) {
              vm.resume.patronymicName = value;
            },
          ),
          TextFieldTile(
            title: 'Cellphone',
            controller: cellPhoneController,
            onChanged: (value) {
              vm.resume.cellPhone = value;
            },
          ),
          TextFieldTile(
            title: 'Date of birth',
            controller: dateOfBirthController,
            onChanged: (value) {
              vm.resume.birthDate = value;
            },
          ),
          GenderTile(
            title: 'Gender',
            onSelect: (value) {},
          ),
          const SizedBox(height: 20),
          TextFieldTile(
            title: 'Citizenship',
            controller: citizenshipController,
            onChanged: (value) {
              vm.resume.citizenship = value;
            },
          ),
          TextFieldTile(
            title: 'City of residence',
            controller: cityOfResidenceController,
            onChanged: (value) {
              vm.resume.cityOfResidence = value;
            },
          ),
          TextFieldTile(
            title: 'Work experience',
            controller: workExperienceController,
            onChanged: (value) {
              vm.resume.workExperience = value;
            },
          ),
        ],
      ),
    );
  }
}

class GenderTile extends StatefulWidget {
  const GenderTile({Key? key, required this.title, required this.onSelect})
      : super(key: key);
  final String title;
  final Function(String) onSelect;

  @override
  State<GenderTile> createState() => _GenderTileState();
}

class _GenderTileState extends State<GenderTile> {
  List<String> genders = [
    'Female',
    'Male',
  ];
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: AppStyles.s15w400.copyWith(
            color: AppColors.grey2,
          ),
        ),
        const SizedBox(height: 9),
        Row(
          children: [
            ...List.generate(
              genders.length,
              (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selected = index;
                    });
                    widget.onSelect.call(genders[selected]);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 6),
                    padding:
                        const EdgeInsets.symmetric(vertical: 7, horizontal: 17),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: selected == index
                          ? AppColors.accent.withOpacity(0.2)
                          : AppColors.outsideIcon,
                    ),
                    child: Text(
                      genders[index],
                      style: AppStyles.s15w400,
                    ),
                  ),
                );
              },
            )
          ],
        )
      ],
    );
  }
}

class TextFieldTile extends StatelessWidget {
  const TextFieldTile(
      {Key? key,
      required this.title,
      required this.controller,
      this.suffixIcon,
      required this.onChanged})
      : super(key: key);
  final String title;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final Function(String?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppStyles.s15w400.copyWith(
            color: AppColors.grey2,
          ),
        ),
        const SizedBox(height: 4),
        AppTextField(
          onChanged: onChanged,
          suffixIcon: suffixIcon,
          hintText: title,
          controller: controller,
        ),
        const SizedBox(height: 19),
      ],
    );
  }
}
