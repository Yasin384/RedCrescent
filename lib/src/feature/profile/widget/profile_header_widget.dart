import 'package:flutter/widgets.dart';
import 'package:red_crescent/src/core/theme/sf_pro.dart';

class ProfileHeader extends StatelessWidget {
  final String title;
  final SfPro theme;

  const ProfileHeader({
    super.key,
    required this.title,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: theme.s24W500,
      ),
    );
  }
}
