import 'package:flutter/material.dart';
import 'package:red_crescent/src/core/theme/my_color.dart';
import 'package:red_crescent/src/core/theme/sf_pro.dart';
import 'package:red_crescent/src/core/widget/build_image.dart';
import 'package:red_crescent/src/feature/leaderboard/model/leaderboard.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LeaderboardCard extends StatelessWidget {
  const LeaderboardCard({super.key, required this.user});

  final UserResult user;

  @override
  Widget build(BuildContext context) {
    final sfPro = Theme.of(context).extension<SfPro>()!;
    final color = Theme.of(context).extension<MyColor>()!;
    final l = AppLocalizations.of(context);
    return Row(
      children: [
        CircleAvatar(
          radius: 37,
          child: ClipOval(
            child: user.profilePictureUrl != null
                ? BuildImage(user: user)
                : Container(
                    color: color.grey,
                    child: Icon(
                      Icons.person,
                      color: color.white,
                      size: 73,
                    ),
                  ),
          ),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(user.username ?? '',
                style: sfPro.s16W400.copyWith(color: color.black)),
            Text('${user.firstName} ${user.lastName}',
                style: sfPro.s16W400.copyWith(color: color.black)),
            const SizedBox(height: 4),
            Text('${l.totalHours} ${user.totalHours} ${l.hours}',
                style: sfPro.s16W400),
          ],
        )
      ],
    );
  }
}
