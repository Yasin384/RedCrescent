import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:red_crescent/src/core/theme/sf_pro.dart';

class ProfileStatistics extends StatelessWidget {
  final dynamic user;
  final SfPro theme;

  const ProfileStatistics({
    super.key,
    required this.user,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    String formatDate(String? date) {
      if (date == null || date.isEmpty) {
        return '—';
      }
      try {
        final parsedDate = DateTime.parse(date);
        return DateFormat('dd.MM.yyyy').format(parsedDate);
      } catch (_) {
        return '—';
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Ваш статус и статистика в Red Crescent',
          style: theme.s16W500,
          maxLines: 1,
          overflow: TextOverflow.visible,
        ),
        const SizedBox(height: 20),
        _buildRowContent(theme, 'Статус', user.role ?? ''),
        const SizedBox(height: 20),
        _buildRowContent(theme, 'Дата вступления', formatDate(user.dateJoined)),
        const SizedBox(height: 20),
        _buildRowContent(
            theme, 'Общее время волонтерства', '${user.totalHours ?? 0} ч'),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text('Достижение', style: theme.s16W400),
              ],
            ),
            Column(
              children: [
                Text('Достижение', style: theme.s16W400),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildRowContent(SfPro theme, String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: theme.s16W400,
        ),
        Text(
          value,
          style: theme.s16W400.copyWith(
            color: theme.myColor.black,
          ),
        ),
      ],
    );
  }
}
