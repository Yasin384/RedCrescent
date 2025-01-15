import 'package:flutter/material.dart';
import 'package:red_crescent/src/core/widget/red_buton.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// {@template select_auth_type_screen}
/// SelectAuthTypeScreen widget.
/// {@endtemplate}
class SelectAuthTypeScreen extends StatelessWidget {
  /// {@macro select_auth_type_screen}
  const SelectAuthTypeScreen({
    super.key, // ignore: unused_element
  });
  static const routePath = '/selectAuthType';

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: <Widget>[
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.25),
          Text(l.pressToAuth),
          RedButton(onPressed: () {}, title: l.signIn),
          TextButton(onPressed: () {}, child: Text(l.help))
        ],
      )),
    );
  }
}
