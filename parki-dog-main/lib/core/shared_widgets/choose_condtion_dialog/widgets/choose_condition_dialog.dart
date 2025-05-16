import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:parki_dog/core/shared_widgets/app_normal_dialog.dart';
import 'package:parki_dog/core/shared_widgets/choose_condtion_dialog/business_logic/choose_condition_bloc.dart';
import 'package:parki_dog/core/shared_widgets/choose_condtion_dialog/widgets/choose_condition_content.dart';
import 'package:parki_dog/generated/locale_keys.g.dart';

Future<dynamic> chooseConditionDialog(BuildContext context,
    {required Function(Condition) onConditionSelected}) {
  return showAppDialog(context,
      title: const Text(
        LocaleKeys.condition_condition,
      ).tr(),
      content: ChooseConditionContent(
        onConditionSelected: onConditionSelected,
      ));
}
