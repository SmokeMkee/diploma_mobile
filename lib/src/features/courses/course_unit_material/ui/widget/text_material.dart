import 'package:diploma_mobile/constants/app_assets.dart';
import 'package:diploma_mobile/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TextMaterial extends StatelessWidget {
  const TextMaterial({
    Key? key,
    required this.articleHeading,
    required this.textMarker,
    required this.articleText,
  }) : super(key: key);
  final String? articleHeading;
  final bool? textMarker;
  final String? articleText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (articleHeading != null && articleHeading!.isNotEmpty)
            Text(
              articleHeading!,
              style: AppStyles.s15w400,
            ),
          const SizedBox(height: 9),
          Row(
            children: [
              if (textMarker != null && textMarker == true)
                SvgPicture.asset(AppAssets.svg.lightBulb),
              if (textMarker != null && textMarker == true)
                const SizedBox(width: 8),
              if (articleText != null && articleText!.isNotEmpty)
                Expanded(
                  child: Text(
                    articleText!,
                    style: AppStyles.s11w400.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
            ],
          )
        ],
      ),
    );
  }
}
