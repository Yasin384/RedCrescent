import 'package:flutter/material.dart';
import 'package:red_crescent/src/core/theme/sf_pro.dart';

class ProfileDetails extends StatelessWidget {
  final dynamic user;
  final SfPro theme;

  const ProfileDetails({
    super.key,
    required this.user,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(60),
            child: CircleAvatar(
              radius: 60,
              child: Image.network(user.profilePictureUrl ?? ''),
            ),
          ),
          Text(
            user.lastName,
            style: theme.s16W500,
            maxLines: 1,
            overflow: TextOverflow.visible,
          ),
          Text(
            "${user.username} ${user.firstName}",
            style: theme.s16W500,
            maxLines: 1,
            overflow: TextOverflow.visible,
          ),
          Text(
            user.phoneNumber ?? '',
            style: theme.s16W400,
            maxLines: 1,
            overflow: TextOverflow.visible,
          ),
          Text(
            user.email,
            style: theme.s16W400,
            maxLines: 1,
            overflow: TextOverflow.visible,
          ),
          const SizedBox(height: 23),
        ],
      ),
    );
  }
}
