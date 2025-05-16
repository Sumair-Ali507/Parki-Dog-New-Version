import 'package:parki_dog/core/extensions/extenstions.dart';
import 'package:parki_dog/core/functions/exit_app.dart';
import 'package:parki_dog/core/shared_widgets/app_adaptive_dialog.dart';
import 'package:parki_dog/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

Future<dynamic> exitDialog(BuildContext context) {
  return appAdaptiveDialog(
    context,
    content: const Text(LocaleKeys.exitDialog_sureExitApp).tr(),
    actions: [
      TextButton(
          onPressed: () {
            exitApp(context);
          },
          child: const Text(LocaleKeys.exitDialog_yes).tr()),
      TextButton(
          onPressed: () {
            context.pop();
          },
          child: const Text(LocaleKeys.exitDialog_no).tr()),
    ],
  );
}
/*
PopScope(
      onPopInvoked: (popInvocation) {
        exitDialog(context);
      }),
*/
