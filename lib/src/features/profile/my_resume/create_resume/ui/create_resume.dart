import 'package:diploma_mobile/constants/app_styles.dart';
import 'package:diploma_mobile/src/features/profile/my_resume/create_resume/data/bloc/create_resume_bloc.dart';
import 'package:diploma_mobile/src/features/profile/my_resume/create_resume/ui/step1.dart';
import 'package:diploma_mobile/src/features/profile/my_resume/create_resume/ui/step2.dart';
import 'package:diploma_mobile/src/features/profile/my_resume/create_resume/ui/step3.dart';
import 'package:diploma_mobile/src/features/profile/my_resume/create_resume/ui/step4.dart';
import 'package:diploma_mobile/src/features/profile/my_resume/create_resume/ui/step5.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../constants/app_colors.dart';
import '../data/view_model/create_model.dart';

class CreateResume extends StatefulWidget {
  const CreateResume({Key? key}) : super(key: key);

  @override
  State<CreateResume> createState() => _CreateResumeState();
}

class _CreateResumeState extends State<CreateResume> {
  int activeStep = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          backgroundColor: AppColors.white,
          centerTitle: true,
          title: Semantics(
            explicitChildNodes: true,
            enabled: true,
            child: Column(
              children: const [
                Text(
                  'Create new resume',
                  style: AppStyles.s15w600,
                ),
              ],
            ),
          ),
        ),
        body: Stack(
          children: [
            ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 15),
                  child: Column(
                    children: [
                      EasyStepper(
                        alignment: Alignment.bottomCenter,
                        activeStep: activeStep,
                        lineSpace: 0,
                        lineLength: 50,
                        disableScroll: true,
                        activeStepBackgroundColor: AppColors.subtitleBg,
                        finishedStepBackgroundColor: AppColors.subtitleBg,
                        finishedStepBorderColor: AppColors.subtitle,
                        finishedStepBorderType: BorderType.normal,
                        defaultLineColor: Colors.white,
                        activeStepBorderType: BorderType.normal,
                        activeStepBorderColor: AppColors.subtitle,
                        internalPadding: 0,
                        showLoadingAnimation: false,
                        stepRadius: 17,
                        steps: [
                          EasyStep(
                            customStep: Text(
                              '1',
                              style: AppStyles.s11w400.copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          EasyStep(
                            customStep: Text(
                              '2',
                              style: AppStyles.s11w400.copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          EasyStep(
                            customStep: Text(
                              '3',
                              style: AppStyles.s11w400.copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          EasyStep(
                            customStep: Text(
                              '4',
                              style: AppStyles.s11w400.copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          EasyStep(
                            customStep: Text(
                              '5',
                              style: AppStyles.s11w400.copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                        onStepReached: (index) =>
                            setState(() => activeStep = index),
                      ),
                    ],
                  ),
                ),
                IndexedStack(
                  index: activeStep == 5 ? 4 : activeStep,
                  children: [
                    Consumer<CreateModel>(
                      builder: (_, value, __) {
                        return Step1();
                      },
                    ),
                    Consumer<CreateModel>(
                      builder: (_, value, __) {
                        return Step2();
                      },
                    ),
                    Consumer<CreateModel>(
                      builder: (_, value, __) {
                        return Step3();
                      },
                    ),
                    Consumer<CreateModel>(
                      builder: (_, value, __) {
                        return Step4();
                      },
                    ),
                    Consumer<CreateModel>(
                      builder: (_, value, __) {
                        return Step5();
                      },
                    ),
                    // Step2(),
                    // Step3(),
                    // Step4(),
                    // Step5(),
                  ],
                )
              ],
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 16,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            if (activeStep != 0) {
                              setState(() {
                                activeStep = activeStep - 1;
                              });
                            }
                          });
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: AppColors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          'Back',
                          style: AppStyles.s15w500.copyWith(
                            color: AppColors.accent,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          if (activeStep != 5) {
                            setState(() {
                              activeStep = activeStep + 1;
                            });
                          }
                          if (activeStep == 5) {
                            var vm = context.read<CreateModel>();
                            context
                                .read<CreateResumeBloc>()
                                .add(AddCreateResumeEvent(resume: vm.resume));
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.accent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          child: Text(
                            activeStep != 4 ? 'Next' : 'finish',
                            style: AppStyles.s15w500.copyWith(
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
