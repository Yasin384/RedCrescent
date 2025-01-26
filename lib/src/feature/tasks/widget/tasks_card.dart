import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:red_crescent/src/core/constans/app_border_raduis.dart';
import 'package:red_crescent/src/core/theme/sf_pro.dart';
import 'package:red_crescent/src/feature/tasks/model/task.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TasksCard extends StatelessWidget {
  const TasksCard({super.key, required this.taskResult});

  final TaskResult taskResult;

  @override
  Widget build(BuildContext context) {
    final text = AppLocalizations.of(context);
    final sfPro = Theme.of(context).extension<SfPro>()!;

    String imageUrl = taskResult.photo ??
        'https://i.pinimg.com/236x/47/8d/08/478d08d5c8acbf30d4998f6e4032aaed.jpg';

    String datePublication = DateFormat('dd.MM.yyyy').format(taskResult.createdAt);

    String dateWhen = DateFormat('dd.MM.yyyy').format(taskResult.dueDate);

    final mediaQuery = MediaQuery.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: AppBorderRadius.all15,
          child: Image.network(
            height: mediaQuery.size.height * 0.23,
            width: mediaQuery.size.width,
            fit: BoxFit.cover,
            imageUrl,
          ),
        ),
        const SizedBox(height: 16),
        _buildTitle(datePublication, text.datePublication, context),
        const SizedBox(height: 8),
        Text(
          taskResult.title,
          style: sfPro.s16W500.copyWith(fontWeight: FontWeight.w600),
        ),
        _buildTitle(text.when, dateWhen, context, style: sfPro.s16W400.copyWith(color: sfPro.myColor.black)),
      ],
    );
  }

  Widget _buildTitle(
    String label,
    String value,
    BuildContext context, {
    TextStyle? style,
  }) {
    final sfPro = Theme.of(context).extension<SfPro>()!;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: sfPro.s16W400.copyWith(color: sfPro.myColor.grey)),
        Text(value,
            style: style ?? sfPro.s16W400.copyWith(color: sfPro.myColor.grey)),
      ],
    );
  }
}

// CachedNetworkImage(
// imageUrl: '${Words.mediaUrl}/${techCard.file}',
// progressIndicatorBuilder: (context, url, progress) =>
// _buildImageProgress(progress),
// imageBuilder: (context, imageProvider) => _buildImage(imageProvider),
// errorWidget: (context, url, error) => _buildImageError(error),
// ),
