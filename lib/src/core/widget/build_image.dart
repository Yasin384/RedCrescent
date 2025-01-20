import 'package:flutter/material.dart';
import 'package:red_crescent/src/core/theme/my_color.dart';
import 'package:red_crescent/src/feature/leaderboard/model/leaderboard.dart';

class BuildImage extends StatelessWidget {
  const BuildImage({
    super.key,
    required this.user,
  });

  final UserResult user;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<MyColor>()!;
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