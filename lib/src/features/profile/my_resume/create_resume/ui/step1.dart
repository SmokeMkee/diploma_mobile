import 'package:diploma_mobile/constants/app_styles.dart';
import 'package:diploma_mobile/src/widgets/app_text_field.dart';
import 'package:flutter/material.dart';

import '../../../../../../constants/app_colors.dart';

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
    return Column(
      children: [
        const Text(
          'Contact details',
          style: AppStyles.s20w600,
        ),
        TextFieldTile(
          title: 'First name',
          controller: firstNameController,
        ),
        TextFieldTile(
          title: 'Second name',
          controller: secondNameController,
        ),
        TextFieldTile(
          title: 'Patronymic name',
          controller: patronymicNameController,
        ),
        TextFieldTile(
          title: 'Cellphone',
          controller: cellPhoneController,
        ),
        TextFieldTile(
          title: 'Date of birth',
          controller: firstNameController,
        ),
        GenderTile(
          title: 'Gender',
          onSelect: (value) {},
        ),
        SizedBox(height: 20),
        TextFieldTile(
          title: 'Citizenship',
          controller: firstNameController,
        ),
        TextFieldTile(
          title: 'City of residence',
          controller: firstNameController,
        ),
        TextFieldTile(
          title: 'Work experience',
          controller: firstNameController,
        ),
      ],
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
  const TextFieldTile({Key? key, required this.title, required this.controller})
      : super(key: key);
  final String title;
  final TextEditingController controller;

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
          hintText: title,
          controller: controller,
        ),
        const SizedBox(height: 19),
      ],
    );
  }
}
