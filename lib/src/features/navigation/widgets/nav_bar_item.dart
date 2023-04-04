part of '../navigation.dart';

class _NavBarItem extends StatelessWidget {
  const _NavBarItem({
    required this.isActive,
    required this.label,
    required this.activeIconPath,
    required this.inactiveIconPath,
  });

  final bool isActive;
  final String label;
  final String activeIconPath;
  final String inactiveIconPath;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: isActive ? Colors.white : Colors.transparent,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: Column(
                children: [
                  SvgPicture.asset(
                    isActive ? activeIconPath : inactiveIconPath,
                  ),
                  const SizedBox(height: 5.0),
                  Text(
                    label,
                    style: AppStyles.s11w400,
                    textAlign: TextAlign.center,
                    softWrap: false,
                    overflow: TextOverflow.fade,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
