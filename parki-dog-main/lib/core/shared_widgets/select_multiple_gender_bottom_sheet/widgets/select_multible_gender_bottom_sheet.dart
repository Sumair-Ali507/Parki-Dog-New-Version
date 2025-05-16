import 'package:flutter/material.dart';
import 'package:parki_dog/core/shared_widgets/app_bottom_sheet.dart';
import 'package:parki_dog/core/shared_widgets/gender_selection_widget.dart';
import 'package:parki_dog/core/shared_widgets/select_multiple_gender_bottom_sheet/widgets/select_multiple_gender_content.dart';
import 'package:parki_dog/core/utils/values_manager.dart';

Future<dynamic> selectMultipleGenderBottomSheet(BuildContext context,
    {required Function(List<Gender>) onGendersSelected}) {
  return buildAppBottomSheet(context,
      heightFactor: AppDouble.d0_5,
      radius: AppDouble.d16,
      content: SelectMultipleGenderContent(
        onGendersSelected: onGendersSelected,
      ));
}
