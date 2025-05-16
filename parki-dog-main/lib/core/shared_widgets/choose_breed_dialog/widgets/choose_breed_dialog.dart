import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:parki_dog/core/shared_widgets/app_normal_dialog.dart';
import 'package:parki_dog/core/shared_widgets/choose_breed_dialog/widgets/choose_breed_content.dart';
import 'package:parki_dog/features/dog_owner/data/models/breed_model.dart';
import 'package:parki_dog/generated/locale_keys.g.dart';

Future<dynamic> chooseBreedDialog(BuildContext context,
    {required Function(Breed) onBreedSelected}) {
  return showAppDialog(context,
      title: const Text(
        LocaleKeys.chooseAndSelectBreed_chooseBreed,
      ).tr(),
      content: ChooseBreedContent(
        onBreedSelected: onBreedSelected,
      ));
}
