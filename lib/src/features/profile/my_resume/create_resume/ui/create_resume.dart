import 'package:diploma_mobile/src/features/profile/my_resume/create_resume/ui/step1.dart';
import 'package:flutter/material.dart';

class CreateResume extends StatelessWidget {
  const CreateResume({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Step1(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
