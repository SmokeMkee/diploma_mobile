import 'package:diploma_mobile/constants/app_assets.dart';
import 'package:diploma_mobile/src/features/profile/my_resume/create_resume/ui/create_resume.dart';
import 'package:diploma_mobile/src/features/profile/my_resume/resume_detailed/ui/resume_detailed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../constants/app_colors.dart';
import '../../../../../constants/app_styles.dart';
import '../data/bloc/resume_bloc.dart';

class MyResume extends StatelessWidget {
  const MyResume({Key? key}) : super(key: key);

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
        title: const Text(
          'My resumes',
          style: AppStyles.s15w600,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.fromLTRB(0, 14, 0, 14),
                  backgroundColor: AppColors.accent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CreateResume(),
                    ),
                  );
                },
                label: const Text('Create new resume'),
                icon: const Icon(Icons.add),
              ),
            ),
          ],
        ),
      ),
      body: BlocBuilder<ResumeBloc, ResumeState>(
        builder: (context, state) {
          if (state is ResumeData) {
            return ListView.builder(
              itemCount: state.listResume.length,
              itemBuilder: (context, int index) {
                DateFormat outputFormat = DateFormat("d MMMM yyyy  HH:mm");
                String formattedDate = outputFormat.format(
                    state.listResume[index].insertDate ?? DateTime.now());
                return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResumeDetailed(
                        resume: state.listResume[index],
                      ),
                    ),
                  ),
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.gray200, width: 1),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.listResume[index].desiredPosition ?? 'no info',
                          style: AppStyles.s14w500.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          formattedDate,
                          style: AppStyles.s11w400.copyWith(
                            fontSize: 12,
                            color: AppColors.grey2,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          }
          if (state is ResumeLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ResumeError) {
            return Center(
              child: Text(state.message),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
