import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../constants/app_assets.dart';
import '../../../../../constants/app_colors.dart';
import '../../../../../constants/app_styles.dart';

class AuthScreenWidget extends StatefulWidget {
  const AuthScreenWidget({
    Key? key,
    required this.headerTitle,
    this.secondTitle,
    required this.fields,
    required this.elevatedButtonText,
    this.elevatedButtonRightIcon,
    required this.textForPassword,
    required this.navigationButtonText,
    required this.elevatedButtonOnTap,
    required this.navigationButtonOnTap,
  }) : super(key: key);
  final String headerTitle;
  final String? secondTitle;
  final Widget fields;

  final String elevatedButtonText;
  final String? elevatedButtonRightIcon;
  final String textForPassword;
  final String navigationButtonText;
  final VoidCallback elevatedButtonOnTap;
  final VoidCallback navigationButtonOnTap;

  @override
  State<AuthScreenWidget> createState() => _AuthScreenWidgetState();
}

class _AuthScreenWidgetState extends State<AuthScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 60,
          ),
          Image.asset(
            AppAssets.images.logo,
            height: 45,
          ),
          const SizedBox(
            height: 40,
          ),
          Card(
            elevation: 10,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              padding: const EdgeInsets.fromLTRB(16, 40, 16, 20),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Text(
                    widget.headerTitle.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: AppStyles.s30w700.copyWith(),
                  ),
                  const SizedBox(height: 23),
                  if (widget.secondTitle != null)
                    Text(
                      widget.secondTitle!,
                      style: AppStyles.s15w500,
                    ),
                  const SizedBox(height: 15),
                  widget.fields,
                  const SizedBox(height: 43),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.fromLTRB(0, 22, 0, 22),
                            backgroundColor: AppColors.accent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: widget.elevatedButtonOnTap,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                widget.elevatedButtonText,
                                style: AppStyles.s15w500.copyWith(
                                  color: AppColors.white,
                                ),
                              ),
                              if (widget.elevatedButtonRightIcon != null)
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(13, 0, 0, 0),
                                  child: SvgPicture.asset(
                                    AppAssets.svg.arrowRight,
                                    color: AppColors.white,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  Text(
                    widget.textForPassword,
                    style: AppStyles.s14w500,
                  ),
                  TextButton(
                    onPressed: widget.navigationButtonOnTap,
                    child: Text(
                      widget.navigationButtonText,
                      style:
                          AppStyles.s14w500.copyWith(color: AppColors.accent),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
