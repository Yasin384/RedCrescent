import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:red_crescent/src/core/constans/app_border_raduis.dart';
import 'package:red_crescent/src/core/theme/sf_pro.dart';
import 'package:red_crescent/src/core/widget/title_with_value_row.dart';
import 'package:red_crescent/src/feature/tasks/model/task.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:red_crescent/src/feature/tasks/task_datails/widget/task_details_screen.dart';
import 'package:red_crescent/src/feature/tasks/widget/tasks_screen.dart';

class TasksCard extends StatelessWidget {
  const TasksCard({
    required this.taskResult,
    this.isRequiredPeople = false,
    super.key,
  });

  final TaskResult taskResult;
  final bool? isRequiredPeople;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final sfPro = Theme.of(context).extension<SfPro>()!;

    String imageUrl = taskResult.photo ?? 'https://i.pinimg.com/236x/47/8d/08/478d08d5c8acbf30d4998f6e4032aaed.jpg';

    String datePublication = DateFormat('dd.MM.yyyy').format(taskResult.createdAt);

    String dateWhen = DateFormat('dd.MM.yyyy').format(taskResult.dueDate);

    final mediaQuery = MediaQuery.sizeOf(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: AppBorderRadius.all15,
          child: Image.network(
            height: mediaQuery.height * 0.23,
            width: mediaQuery.width,
            fit: BoxFit.cover,
            imageUrl,
          ),
        ),
        const SizedBox(height: 16),
        TitleWithValueRow(label: datePublication, value: l.datePublication),
        const SizedBox(height: 8),
        Text(
          taskResult.title,
          style: sfPro.s16W500.copyWith(fontWeight: FontWeight.w600),
        ),
        if(isRequiredPeople ?? false)...[
          TitleWithValueRow(label: l.requiredPeople, value: '3', style: sfPro.s16W400.copyWith(color: sfPro.myColor.black)),
          const SizedBox(height: 8),
        ],
        TitleWithValueRow(label: l.when, value: dateWhen, style: sfPro.s16W400.copyWith(color: sfPro.myColor.black))
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
