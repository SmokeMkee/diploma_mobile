import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/app_assets.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_styles.dart';

class AppEmptyWidget extends StatelessWidget {
  const AppEmptyWidget(
      {Key? key,
      required this.header,
      required this.svgPath,
      required this.subTitle})
      : super(key: key);
  final String header;
  final String svgPath;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(svgPath),
          Text(
            header,
            style: AppStyles.s15w600,
          ),
          const SizedBox(
            height: 19,
          ),
          Text(
            subTitle,
            textAlign: TextAlign.center,
            style: AppStyles.s14w400.copyWith(color: AppColors.gray600),
          )
        ],
      ),
    );
  }
}
