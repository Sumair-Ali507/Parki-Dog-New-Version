import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parki_dog/core/extensions/extenstions.dart';
import 'package:parki_dog/core/shared_widgets/gender_selection_widget.dart';
import 'package:parki_dog/core/shared_widgets/select_breeds_bottom_sheet/widgets/checkbox_selection_unit.dart';
import 'package:parki_dog/core/shared_widgets/select_multiple_gender_bottom_sheet/buisness_logic/multiple_gender_selection_cubit/multiple_gender_selection_cubit.dart';
import 'package:parki_dog/core/shared_widgets/select_multiple_gender_bottom_sheet/buisness_logic/multiple_gender_selection_cubit/multiple_gender_selection_state.dart';
import 'package:parki_dog/core/utils/text_styles.dart';
import 'package:parki_dog/core/utils/values_manager.dart';
import 'package:parki_dog/generated/locale_keys.g.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectMultipleGenderContent extends StatelessWidget {
  final Function(List<Gender>) onGendersSelected;

  const SelectMultipleGenderContent(
      {super.key, required this.onGendersSelected});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDouble.d16),
      child: BlocProvider(
        create: (context) => MultipleGenderSelectionCubit(),
        child: BlocBuilder<MultipleGenderSelectionCubit,
            MultipleGenderSelectionState>(
          builder: (gendersContext, gendersState) {
            MultipleGenderSelectionCubit gendersCubit =
                gendersContext.read<MultipleGenderSelectionCubit>();
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    LocaleKeys.dogOwner_gender,
                    style: TextStyles.font18Grey600Medium(),
                    textAlign: TextAlign.start,
                  ).tr(),
                  const SizedBox(height: AppDouble.d24),
                  const SizedBox(height: AppDouble.d16),
                  SizedBox(
                    height: AppDouble.d130,
                    child: ListView.builder(
                        itemCount: Gender.values.length,
                        // shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return CheckboxSelectionUnit(
                            isSelected:
                                gendersCubit.isSelected(Gender.values[index]),
                            onTap: () =>
                                gendersCubit.toggleGender(Gender.values[index]),
                            text: Gender.values[index].name.tr(),
                          );
                        }),
                  ),
                  const SizedBox(height: AppDouble.d16),
                  SizedBox(
                    width: AppDouble.d1.sw,
                    child: ElevatedButton(
                        onPressed: gendersState.selectedGenders.isNotEmpty
                            ? () {
                                onGendersSelected
                                    .call(gendersState.selectedGenders);
                                context.pop();
                              }
                            : null,
                        child:
                            const Text(LocaleKeys.chooseAndSelectBreed_confirm)
                                .tr()),
                  ),
                  // const SizedBox(height: AppDouble.d16),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
