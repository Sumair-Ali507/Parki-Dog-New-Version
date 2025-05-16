import 'package:flutter/material.dart';
import 'package:parki_dog/core/shared_widgets/app_bottom_sheet.dart';
import 'package:parki_dog/core/shared_widgets/select_breeds_bottom_sheet/widgets/select_breeds_content.dart';
import 'package:parki_dog/core/utils/values_manager.dart';
import 'package:parki_dog/features/dog_owner/data/models/breed_model.dart';

Future<dynamic> selectBreedsBottomSheet(BuildContext context,
    {required Function(List<Breed>) onBreedsSelected}) {
  return buildAppBottomSheet(context,
      heightFactor: AppDouble.d0_8,
      radius: AppDouble.d16,
      content: SelectBreedsContent(
        onBreedsSelected: onBreedsSelected,
      ));
}
