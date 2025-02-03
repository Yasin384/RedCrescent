import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:red_crescent/src/core/constans/spacing.dart';
import 'package:red_crescent/src/core/theme/sf_pro.dart';
import 'package:red_crescent/src/core/widget/red_buton.dart';
import 'package:red_crescent/src/core/widget/title_with_value_row.dart';
import 'package:red_crescent/src/feature/tasks/model/task.dart';
import 'package:red_crescent/src/feature/tasks/task_datails/bloc/tasks_detail_bloc.dart';
import 'package:red_crescent/src/feature/tasks/widget/tasks_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TaskDetailsScreen extends StatefulWidget {
  const TaskDetailsScreen({super.key, required this.taskResult});

  final TaskResult taskResult;

  static const routePath = '/taskDetail';

  @override
  State<TaskDetailsScreen> createState() => _TaskDetailsScreenState();
}

class _TaskDetailsScreenState extends State<TaskDetailsScreen> {
  @override
  void initState() {
    super.initState();
    context
        .read<TasksDetailBloc>()
        .add(Participate(taskId: widget.taskResult.id));
  }

  @override
  Widget build(BuildContext context) {
    String timeWhen = DateFormat('HH:mm').format(widget.taskResult.dueDate);
    final sfPro = Theme.of(context).extension<SfPro>()!;
    final l = AppLocalizations.of(context);
    final bloc = context.read<TasksDetailBloc>();
    final state = context.watch<TasksDetailBloc>();

    return BlocConsumer<TasksDetailBloc, TasksDetailState>(
      listener: (context, state) {
        if (state is TasksParticipateSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
          bloc.add(Participate(taskId: widget.taskResult.id));
        } else if (state is TasksParticipateError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      builder: (context, state) {
        final bool isLoading = state is TasksParticipating;
        final isParticipate = state is TasksParticipate
            ? state.participation.isParticipating
            : false;

        print('---> $isParticipate');

        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: Spacing.h16V12,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TasksCard(
                  taskResult: widget.taskResult,
                  isRequiredPeople: true,
                ),
                TitleWithValueRow(
                    label: '',
                    value: timeWhen,
                    style: sfPro.s16W400.copyWith(color: sfPro.myColor.black)),
                const SizedBox(height: 8),
                TitleWithValueRow(
                    label: l.where,
                    value: widget.taskResult.location ?? l.locationNotSpecified,
                    style: sfPro.s16W400.copyWith(color: sfPro.myColor.black)),
                const SizedBox(height: 8),
                Text(
                  widget.taskResult.description,
                  style: sfPro.s16W500,
                ),
                const SizedBox(height: 8),
                Text(l.coordinatorThisTask, style: sfPro.s16W400),
                const SizedBox(height: 8),
                Text(
                  widget.taskResult.coordinator?.username ?? '',
                  style: sfPro.s16W500,
                ),
                const SizedBox(height: 8),
                !isParticipate
                    ? RedButton(
                        title: l.participate,
                        isLoading: isLoading,
                        onPressed: () {
                          isLoading
                              ? null
                              : bloc.add(
                                  ParticipateInTasks(
                                      taskId: widget.taskResult.id),
                                );
                        },
                      )
                    : RedButton(
                        title: l.leaveTheTask,
                        isLoading: isLoading,
                        onPressed: () {
                          isLoading
                              ? null
                              : bloc.add(
                                  ParticipateOutTasks(
                                      taskId: widget.taskResult.id),
                                );
                        },
                      )
              ],
            ),
          ),
        );
      },
    );
  }
}
