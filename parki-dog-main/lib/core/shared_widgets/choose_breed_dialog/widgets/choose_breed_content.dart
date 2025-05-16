import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parki_dog/core/extensions/extenstions.dart';
import 'package:parki_dog/core/shared_widgets/choose_breed_dialog/business_logic/radio_breed_selection_cubit/radio_breed_selection_cubit.dart';
import 'package:parki_dog/core/shared_widgets/choose_breed_dialog/business_logic/radio_breed_selection_cubit/radio_breed_selection_state.dart';
import 'package:parki_dog/core/shared_widgets/choose_breed_dialog/widgets/radio_selection_unit.dart';
import 'package:parki_dog/core/shared_widgets/search_field.dart';
import 'package:parki_dog/core/utils/text_styles.dart';
import 'package:parki_dog/core/utils/values_manager.dart';
import 'package:parki_dog/features/dog_owner/data/models/breed_model.dart';
import 'package:parki_dog/generated/locale_keys.g.dart';

class ChooseBreedContent extends StatelessWidget {
  final Function(Breed) onBreedSelected;

  const ChooseBreedContent({super.key, required this.onBreedSelected});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppDouble.d1.sw,
      child: BlocProvider(
        create: (context) => RadioBreedSelectionCubit(),
        child: BlocBuilder<RadioBreedSelectionCubit, RadioBreedSelectionState>(
          builder: (breadContext, breedSelectionState) {
            RadioBreedSelectionCubit breedCubit =
                breadContext.read<RadioBreedSelectionCubit>();
            return Column(
              children: [
                SearchField(
                  controller: breedCubit.searchController,
                  onChanged: breedCubit.searchBreeds,
                  isDebounceEnabled: true,
                ),
                const SizedBox(height: AppDouble.d16),
                SizedBox(
                  height: context.height / AppDouble.d4,
                  child: breedSelectionState.filteredBreeds.isNotEmpty
                      ? ListView.builder(
                          itemCount: breedSelectionState.filteredBreeds.length,
                          itemBuilder: (context, index) {
                            final breed =
                                breedSelectionState.filteredBreeds[index];
                            return RadioSelectionUnit(
                              isSelected: breedSelectionState.selectedBreedId ==
                                  breed.id,
                              onTap: () => breedCubit.selectBreed(breed.id),
                              text: breed.name,
                            );
                          })
                      : Center(
                          child: Text(
                            LocaleKeys.chooseAndSelectBreed_noBreedsFound,
                            textAlign: TextAlign.center,
                            style: TextStyles.font14Grey400Regular(),
                          ).tr(),
                        ),
                ),
                const SizedBox(height: AppDouble.d16),
                SizedBox(
                  width: AppDouble.d1.sw,
                  child: ElevatedButton(
                      onPressed: breedSelectionState.selectedBreedId != null
                          ? () {
                              onBreedSelected.call(breedCubit.getBreedFromId(
                                  breedSelectionState.selectedBreedId!));
                              context.pop();
                            }
                          : null,
                      child: const Text(LocaleKeys.chooseAndSelectBreed_confirm)
                          .tr()),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
