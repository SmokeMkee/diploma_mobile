import 'dart:convert';
import 'dart:io';

import 'package:diploma_mobile/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../../../../constants/app_colors.dart';
import '../../../../../../constants/app_styles.dart';
import '../data/view_model/create_model.dart';

class Step5 extends StatefulWidget {
  const Step5({Key? key}) : super(key: key);

  @override
  State<Step5> createState() => _Step5State();
}

class _Step5State extends State<Step5> {
  final ImagePicker imagePicker = ImagePicker();
  File? pickedFile;

  @override
  Widget build(BuildContext context) {
    var vm = context.read<CreateModel>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            children: const [
              Text(
                'Profile photo',
                textAlign: TextAlign.start,
                style: AppStyles.s20w600,
              ),
            ],
          ),
          const SizedBox(height: 21),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () async {
                  final picked =
                      await imagePicker.pickImage(source: ImageSource.gallery);
                  if (picked != null) {
                    setState(() {
                      pickedFile = File(picked.path);
                      vm.resume.photoData = pickedFile!.path;
                    });
                    print(pickedFile?.path);

                  }
                },
                child: CircleAvatar(
                  radius: 71,
                  backgroundColor: AppColors.gray600,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(180),
                    child: CircleAvatar(
                      backgroundColor: AppColors.outsideIcon,
                      radius: 70,
                      backgroundImage: pickedFile != null
                          ? Image.file(
                              pickedFile!,
                              fit: BoxFit.contain,
                            ).image
                          : null,
                      child: pickedFile != null
                          ? null
                          : SvgPicture.asset(
                              AppAssets.svg.camera,
                              height: 60,
                            ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () async {
                  final picked =
                      await imagePicker.pickImage(source: ImageSource.gallery);
                  if (picked != null) {
                    setState(() {
                      pickedFile = File(picked.path);
                      vm.resume.photoData = pickedFile!.path;
                    });
                  }
                },
                child: Text(
                  'Edit photo',
                  style: AppStyles.s15w600.copyWith(
                    color: AppColors.accent,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
