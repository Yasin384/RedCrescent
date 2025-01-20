import 'package:flutter/material.dart';
import 'package:red_crescent/src/core/theme/my_color.dart';
import 'package:red_crescent/src/core/theme/sf_pro.dart';
import 'package:red_crescent/src/feature/leaderboard/model/user_response.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LeaderboardCard extends StatelessWidget {
  const LeaderboardCard({super.key, required this.user});

  final UserResult user;

  @override
  Widget build(BuildContext context) {
    final sfPro = Theme.of(context).extension<SfPro>()!;
    final theme = Theme.of(context).extension<MyColor>()!;
    final text = AppLocalizations.of(context);
    return Row(
      children: [
        CircleAvatar(
          radius: 37,
          child: ClipOval(
            child: user.profilePictureUrl != null
                ? _buildImage(theme)
                : Container(
                    color: theme.grey,
                    child: Icon(
                      Icons.person,
                      color: theme.white,
                      size: 73,
                    ),
                  ),
          ),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(user.username,
                style: sfPro.s16W400.copyWith(color: theme.black)),
            Text('${user.firstName} ${user.lastName}',
                style: sfPro.s16W400.copyWith(color: theme.black)),
            const SizedBox(height: 4),
            Text('${text.totalHours} ${user.totalHours} ${text.hours}',
                style: sfPro.s16W400),
          ],
        )
      ],
    );
  }

  Image _buildImage(MyColor theme) {
    return Image.network(
      user.profilePictureUrl!,
      fit: BoxFit.cover,
      width: 74,
      height: 74,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return Center(
          child: CircularProgressIndicator(
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                loadingProgress.expectedTotalBytes!
                : null,
          ),
        );
      },
      errorBuilder: (context, error, stackTrace) {
        return Container(
          color: theme.grey,
          child: Icon(
            Icons.person,
            color: theme.white,
            size: 73,
          ),
        );
      },
    );
  }
}
