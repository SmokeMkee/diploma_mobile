import 'package:diploma_mobile/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/app_assets.dart';
import '../../../constants/app_colors.dart';
import '../../../generated/l10n.dart';
part 'widgets/nav_bar_item.dart';


class NavBar extends StatelessWidget {
  const NavBar({
    super.key,
    required this.current,
    required this.switchTo,
  });

  final void Function(int) switchTo;
  final int current;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 8,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      backgroundColor: Color(0xFFF8F9FC),
      enableFeedback: true,
      currentIndex: current,
      type: BottomNavigationBarType.fixed,
      selectedFontSize: 4,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      items: [
        BottomNavigationBarItem(
          label: '',
          icon: _NavBarItem(
            isActive: current == 0,
            label: 'Courses',
            activeIconPath: AppAssets.svg.coursesBold,
            inactiveIconPath: AppAssets.svg.courses,
          ),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: _NavBarItem(
            isActive: current == 1,
            label: 'Assignments',
            activeIconPath: AppAssets.svg.assignmentsBold,
            inactiveIconPath: AppAssets.svg.assignments,
          ),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: _NavBarItem(
            isActive: current == 2,
            label: 'Gradebook',
            activeIconPath: AppAssets.svg.gradeBookBold,
            inactiveIconPath: AppAssets.svg.gradeBook,
          ),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: _NavBarItem(
            isActive: current == 3,
            label: 'Schedule',
            activeIconPath: AppAssets.svg.scheduleBold,
            inactiveIconPath: AppAssets.svg.schedule,
          ),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: _NavBarItem(
            isActive: current == 4,
            label: 'Profile',
            activeIconPath: AppAssets.svg.profile,
            inactiveIconPath: AppAssets.svg.profileBold,
          ),
        ),
      ],
      onTap: (index) async {
        switchTo(index);
      },
    );
  }
}
