import 'package:diploma_mobile/constants/app_assets.dart';
import 'package:diploma_mobile/constants/app_colors.dart';
import 'package:diploma_mobile/constants/app_styles.dart';
import 'package:diploma_mobile/src/features/auth/sign/data/bloc/sign_bloc.dart';
import 'package:diploma_mobile/src/features/navigation/app_router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../data/bloc/profile_bloc.dart';
import '../my_resume/ui/my_resume.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Semantics(
            explicitChildNodes: true,
            enabled: true,
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                const ProfileInfo(),
                const SizedBox(
                  height: 16,
                ),
                SettingsList(
                  cards: [
                    SettingsItem(
                      name: 'My resumes',
                      iconPath: AppAssets.svg.myResume,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MyResume(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                SettingsList(
                  cards: [
                    SettingsItem(
                      name: 'Account settings',
                      iconPath: AppAssets.svg.settings,
                      onTap: () {},
                    ),
                    SettingsItem(
                      name: 'Notifications',
                      iconPath: AppAssets.svg.notification,
                      onTap: () {},
                    ),
                    SettingsItem(
                      name: 'Language',
                      iconPath: AppAssets.svg.language,
                      secondText: 'English',
                      onTap: () {},
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                const ProfileButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileButton extends StatelessWidget {
  const ProfileButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      explicitChildNodes: true,
      enabled: true,
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: AppColors.accent,
              ),
              onPressed: () {
                context.read<SignBloc>().add(LogOutSignEvent());
                context.router.navigate(const AuthScreenRoute());
              },
              icon: SvgPicture.asset(
                AppAssets.svg.logOut,
                color: Colors.white,
              ),
              label: Padding(
                padding: const EdgeInsets.symmetric(vertical: 11),
                child: Text(
                  'Log out',
                  style: AppStyles.s14w500.copyWith(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SettingsList extends StatelessWidget {
  final List<SettingsItem> cards;

  const SettingsList({Key? key, required this.cards}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.gray200,
        ),
      ),
      child: Semantics(
        explicitChildNodes: true,
        enabled: true,
        child: ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
          itemCount: cards.length,
          separatorBuilder: (BuildContext context, int index) => Padding(
            padding: const EdgeInsets.fromLTRB(63, 12, 0, 12),
            child: Container(
              height: 1,
              width: double.infinity,
              color: AppColors.gray200,
            ),
          ),
          itemBuilder: (BuildContext context, int index) {
            return SettingsCard(
              settingsItem: cards[index],
            );
          },
        ),
      ),
    );
  }
}

class ProfileInfo extends StatefulWidget {
  const ProfileInfo({Key? key}) : super(key: key);

  @override
  State<ProfileInfo> createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  @override
  void initState() {
    context.read<ProfileBloc>().add(FetchProfileEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: const Color(0xFFD8D9DD),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
        child: Semantics(
          explicitChildNodes: true,
          enabled: true,
          child: BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              if (state is ProfileData) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Semantics(
                      explicitChildNodes: true,
                      enabled: true,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state.profile.fullName ?? 'no info',
                            style: AppStyles.s20w600,
                          ),
                          const Text('Student', style: AppStyles.s14w400),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 1,
                      width: double.infinity,
                      color: AppColors.gray200,
                    ),
                    const SizedBox(
                      height: 21,
                    ),
                    Semantics(
                      explicitChildNodes: true,
                      enabled: true,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Email address',
                              style: AppStyles.s14w400
                                  .copyWith(color: AppColors.grey2)),
                          Text(state.profile.email ?? 'no info',
                              style: AppStyles.s14w400),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    Semantics(
                      explicitChildNodes: true,
                      enabled: true,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Phone number',
                            style: AppStyles.s14w400
                                .copyWith(color: AppColors.grey2),
                          ),
                          Text(state.profile.phone ?? 'no info',
                              style: AppStyles.s14w400),
                        ],
                      ),
                    ),
                  ],
                );
              }
              if (state is ProfileLoading) {
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

class SettingsCard extends StatelessWidget {
  final SettingsItem settingsItem;

  const SettingsCard({
    Key? key,
    required this.settingsItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: settingsItem.onTap,
      child: Semantics(
        explicitChildNodes: true,
        enabled: true,
        child: Row(
          children: [
            CircleAvatar(
              radius: 23,
              backgroundColor: AppColors.outsideIcon,
              child: SvgPicture.asset(
                settingsItem.iconPath,
                color: AppColors.gray600,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Text(
                settingsItem.name,
                style: AppStyles.s14w500,
              ),
            ),
            if (settingsItem.secondText != null)
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Text(
                  settingsItem.secondText!,
                  style: AppStyles.s11w400
                      .copyWith(color: AppColors.gray600, fontSize: 12),
                ),
              ),
            SvgPicture.asset(
              AppAssets.svg.arrowRight2,
              width: 16,
              color: AppColors.gray600,
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsItem {
  final String name;
  final String iconPath;
  final String? secondText;
  final VoidCallback onTap;

  SettingsItem(
      {required this.name,
      required this.iconPath,
      this.secondText,
      required this.onTap});
}
