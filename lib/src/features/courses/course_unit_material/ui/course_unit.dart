import 'dart:io';

import 'package:diploma_mobile/src/features/courses/course_unit_material/data/bloc/unit_material_bloc.dart';
import 'package:diploma_mobile/src/features/courses/course_unit_material/ui/widget/assignments_material.dart';
import 'package:diploma_mobile/src/features/courses/course_unit_material/ui/widget/image_material.dart';
import 'package:diploma_mobile/src/features/courses/course_unit_material/ui/widget/open_question_material.dart';
import 'package:diploma_mobile/src/features/courses/course_unit_material/ui/widget/pdf_and_other_materials.dart';
import 'package:diploma_mobile/src/features/courses/course_unit_material/ui/widget/text_material.dart';
import 'package:diploma_mobile/src/widgets/app_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../constants/app_assets.dart';
import '../../../../../constants/app_colors.dart';
import '../../../../../constants/app_styles.dart';
import '../data/bloc_material/section_material_bloc.dart';

class CourseUnit extends StatefulWidget {
  const CourseUnit(
      {Key? key,
      required this.unitSectionName,
      required this.courseName,
      required this.unitId,
      required this.courseId})
      : super(key: key);
  final String unitSectionName;
  final String courseName;
  final int unitId;
  final int courseId;

  @override
  State<CourseUnit> createState() => _CourseUnitState();
}

class _CourseUnitState extends State<CourseUnit> {
  @override
  void initState() {
    context.read<UnitMaterialBloc>().add(
          FetchSectionUnitMaterialEvent(
              unitId: widget.unitId, courseId: widget.courseId),
        );
    super.initState();
  }

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
        title: Semantics(
          explicitChildNodes: true,
          enabled: true,
          child: Column(
            children: [
              Text(
                widget.unitSectionName,
                style: AppStyles.s15w600,
              ),
              Text(
                widget.courseName,
                style: AppStyles.s11w400,
              )
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Semantics(
          explicitChildNodes: true,
          enabled: true,
          child: BlocBuilder<UnitMaterialBloc, UnitMaterialState>(
            builder: (context, state) {
              if (state is UnitMaterialData) {
                return DefaultTabController(
                  length: state.tabs.length,
                  child: Column(
                    children: [
                      TabBar(
                        isScrollable: true,
                        indicatorColor: AppColors.accent,
                        indicatorSize: TabBarIndicatorSize.label,
                        labelColor: AppColors.primary,
                        labelStyle: AppStyles.s15w600,
                        unselectedLabelColor: AppColors.gray600,
                        tabs: List.generate(
                          state.tabs.length,
                          (index) => Text(
                            state.tabs[index].sectionName.toString() ??
                                'no info',
                          ),
                        ),
                      ),
                      Flexible(
                        child: TabBarView(
                          children: [
                            ...List.generate(
                              state.tabs.length,
                              (index) {
                                return UnitMaterial(
                                  courseId: widget.courseId,
                                  unitId: widget.unitId,
                                  sectionId: state.tabs[index].id ?? 0,
                                );
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }
              if (state is UnitMaterialError) {
                return Text(state.message);
              }
              if (state is UnitMaterialLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}

class UnitMaterial extends StatefulWidget {
  const UnitMaterial({
    Key? key,
    required this.courseId,
    required this.unitId,
    required this.sectionId,
  }) : super(key: key);
  final int courseId;
  final int unitId;
  final int sectionId;

  @override
  State<UnitMaterial> createState() => _UnitMaterialState();
}

class _UnitMaterialState extends State<UnitMaterial> {
  @override
  void initState() {
    context.read<SectionMaterialBloc>().add(
          FetchSectionMaterialEvent(
            unitId: widget.unitId,
            courseId: widget.courseId,
            sectionId: widget.sectionId,
          ),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SectionMaterialBloc, SectionMaterialState>(
      builder: (context, state) {
        if (state is SectionMaterialLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is SectionMaterialData) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: state.listMaterial.length,
                  shrinkWrap: true,
                  itemBuilder: (context, int index) {
                    Widget? widget;
                    var type = state.listMaterial[index].flagCreationInfo;
                    switch (type) {
                      case 'Picture':
                        widget = ImageMaterial(
                          image: state.listMaterial[index].fileData ?? '',
                        );
                        break;
                      case 'Pdf and other materials':
                        widget = PdfAndOtherMaterials(
                            file: state.listMaterial[index].fileData ?? '');
                        break;
                      case 'Open questions':
                        widget = OpenQuestionMaterial(
                            question: state.listMaterial[index].question ?? '');
                        break;
                      case 'Text':
                        widget = TextMaterial(
                          articleHeading:
                              state.listMaterial[index].articleHeading,
                          textMarker: state.listMaterial[index].textMarker,
                          articleText: state.listMaterial[index].articleText,
                        );
                        break;
                      case 'Dividing line':
                        widget = const AppDivider();
                        break;
                    }
                    return widget ?? const SizedBox.shrink();
                  },
                ),
              ),
              if (state.assignmentMaterial != null)
                AssignmentMaterial(
                  articleHeading: state.assignmentMaterial!.heading ?? '',
                  dueDate: state.assignmentMaterial!.endDate ?? '',
                  instructions: state.assignmentMaterial!.instructions ?? '',
                  material: state.assignmentMaterial!.material ?? '',
                )
            ],
          );
        }
        if (state is SectionMaterialError) {
          return Text(state.message);
        }
        return const SizedBox.shrink();
      },
    );
  }
}

// Column(
// children: [
// const Text(
// 'Lecture',
// style: AppStyles.s14w500,
// ),
// Container(
// height: 1,
// width: double.infinity,
// color: AppColors.gray200,
// ),
// const SizedBox(height: 24),
// const LectureInfoContainer(),
// const SizedBox(height: 24),
// Container(
// height: 1,
// width: double.infinity,
// color: AppColors.gray200,
// ),
// const SizedBox(height: 24),
// const FirstConstructor(),
// const SizedBox(height: 24),
// Container(
// height: 1,
// width: double.infinity,
// color: AppColors.gray200,
// ),
// const SizedBox(height: 24),
// const SecondConstructor(),
// ],
// ),
class SecondConstructor extends StatelessWidget {
  const SecondConstructor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Semantics(
      explicitChildNodes: true,
      enabled: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'USING PRESENT PERFECT',
            style: AppStyles.s14w500,
          ),
          const SizedBox(height: 10),
          Semantics(
            explicitChildNodes: true,
            enabled: true,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(AppAssets.svg.indicator),
                const SizedBox(width: 10),
                Flexible(
                  child: Text(
                    'Present Perfect is an action that '
                    'took place in the past, but matters to us'
                    ' now, in the present. Therefore, Present'
                    ' Perfect is used when it is necessary to '
                    'show the result of a perfect action in the'
                    ' present.Describe below chart using Present Perfect',
                    style: AppStyles.s11w400.copyWith(fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
          Image.asset(AppAssets.images.diagram)
        ],
      ),
    );
  }
}

class FirstConstructor extends StatelessWidget {
  const FirstConstructor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Semantics(
      explicitChildNodes: true,
      enabled: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'RULE',
            style: AppStyles.s14w500,
          ),
          const SizedBox(height: 10),
          Text(
            'Present Perfect causes difficulties for students,'
            ' because in Russian it has no analogues. In general, '
            'Present Perfect indicates an action that took place '
            'in the indefinite past before the moment of speech,'
            ' but has some connection with the present - we are '
            'interested in the result of this action now - in the '
            'present.',
            style: AppStyles.s11w400.copyWith(fontSize: 12),
          ),
          const SizedBox(height: 10),
          Semantics(
            explicitChildNodes: true,
            enabled: true,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(AppAssets.svg.lightBulb),
                const SizedBox(width: 8),
                Flexible(
                  child: Text(
                    'Words indicating the Present Perfect are '
                    'usually adverbs of indefinite tense: recently, '
                    'finally, ever, never, just, for, since, yet,'
                    ' already.',
                    style: AppStyles.s11w400.copyWith(fontSize: 12),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
