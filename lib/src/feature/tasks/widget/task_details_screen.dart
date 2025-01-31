import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:red_crescent/src/core/constans/spacing.dart';
import 'package:red_crescent/src/core/theme/sf_pro.dart';
import 'package:red_crescent/src/core/widget/red_buton.dart';
import 'package:red_crescent/src/core/widget/title_with_value_row.dart';
import 'package:red_crescent/src/feature/tasks/model/task.dart';
import 'package:red_crescent/src/feature/tasks/widget/tasks_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TaskDetailsScreen extends StatelessWidget {
  const TaskDetailsScreen({super.key, required this.taskResult});

  final TaskResult taskResult;

  static const routePath = '/taskDetail';

  @override
  Widget build(BuildContext context) {
    String timeWhen = DateFormat('HH:mm').format(taskResult.dueDate);
    final sfPro = Theme.of(context).extension<SfPro>()!;
    final l = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: Spacing.h16V12,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TasksCard(
              taskResult: taskResult,
              isRequiredPeople: true,
            ),
            TitleWithValueRow(label: '', value: timeWhen, style:sfPro.s16W400.copyWith(color: sfPro.myColor.black)),
            const SizedBox(height: 8),
            TitleWithValueRow(label: l.where, value: 'vndnvknskfjskfh', style:sfPro.s16W400.copyWith(color: sfPro.myColor.black)),
            const SizedBox(height: 8),
            Text(taskResult.description, style: sfPro.s16W500,),
            const SizedBox(height: 8),
            Text(l.coordinatorThisTask, style: sfPro.s16W400),
            const SizedBox(height: 8),
            Text(taskResult.coordinator?.username ?? '', style: sfPro.s16W500,),
            // Spacer(),
            const SizedBox(height: 62),
            RedButton(title: l.participate, onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
