import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'app_textfield.dart';

class AppDatePickerField extends StatefulWidget {
  const AppDatePickerField({
    super.key,
    required this.label,
    this.selectedData,
    required this.onChanged,
  });

  final String label;
  final DateTime? selectedData;
  final ValueChanged<DateTime> onChanged;

  @override
  State<AppDatePickerField> createState() => _AppDatePickerFieldState();
}

class _AppDatePickerFieldState extends State<AppDatePickerField> {
  final TextEditingController controller = TextEditingController();

  DateFormat formatter = DateFormat("dd.mm.yyyy hh:mm");

  DateTime? selectedDate;
  late TimeOfDay selectedTime;

  @override
  void initState() {
    super.initState();
    selectedDate = widget.selectedData;
    if (selectedDate != null) {
      selectedTime = TimeOfDay(
        hour: selectedDate!.hour,
        minute: selectedDate!.minute,
      );
    } else {
      selectedTime = TimeOfDay.now();
    }

    if (widget.selectedData != null) {
      controller.text = formatter.format(widget.selectedData!);
    }
  }

  void pickDate() async {
    final pickedDate = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      initialDate: widget.selectedData,
      lastDate: DateTime(2100),
    );

    if (pickedDate == null || context.mounted == false) return;

    final pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (pickedTime == null || !context.mounted) return;

    selectedDate = pickedDate.add(
      Duration(
        hours: pickedTime.hour,
        minutes: pickedTime.minute,
      ),
    );
    controller.text = formatter.format(selectedDate!);
    widget.onChanged(selectedDate!);
    setState(() {});
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppTextfield(
      readOnly: true,
      onTap: pickDate,
      label: widget.label,
      controller: controller,
    );
  }
}
