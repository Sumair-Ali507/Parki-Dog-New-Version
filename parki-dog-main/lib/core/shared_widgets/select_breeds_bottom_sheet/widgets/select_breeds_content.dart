import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parki_dog/core/extensions/extenstions.dart';
import 'package:parki_dog/core/shared_widgets/search_field.dart';
import 'package:parki_dog/core/shared_widgets/select_breeds_bottom_sheet/business_logic/multi_breed_selection_cubit/multi_breed_selection_cubit.dart';
import 'package:parki_dog/core/shared_widgets/select_breeds_bottom_sheet/business_logic/multi_breed_selection_cubit/multi_breed_selection_state.dart';
import 'package:parki_dog/core/shared_widgets/select_breeds_bottom_sheet/widgets/checkbox_selection_unit.dart';
import 'package:parki_dog/core/utils/text_styles.dart';
import 'package:parki_dog/core/utils/values_manager.dart';
import 'package:parki_dog/features/dog_owner/data/models/breed_model.dart';
import 'package:parki_dog/generated/locale_keys.g.dart';

class SelectBreedsContent extends StatelessWidget {
  final Function(List<Breed>) onBreedsSelected;

  const SelectBreedsContent({super.key, required this.onBreedsSelected});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppDouble.d1.sw,
      child: BlocProvider(
        create: (context) => MultiBreedSelectionCubit(),
        child: BlocBuilder<MultiBreedSelectionCubit, MultiBreedSelectionState>(
          builder: (breadContext, breedSelectionState) {
            MultiBreedSelectionCubit breedCubit =
                breadContext.read<MultiBreedSelectionCubit>();
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppDouble.d16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    LocaleKeys.chooseAndSelectBreed_selectBreeds,
                    style: TextStyles.font18Grey600Medium(),
                    textAlign: TextAlign.start,
                  ).tr(),
                  const SizedBox(height: AppDouble.d24),
                  SearchField(
                    controller: breedCubit.searchController,
                    onChanged: breedCubit.searchBreeds,
                    isDebounceEnabled: true,
                  ),
                  const SizedBox(height: AppDouble.d16),
                  SizedBox(
                    height: context.height * AppDouble.d0_8 - AppDouble.d250,
                    child: breedSelectionState.filteredBreeds.isNotEmpty
                        ? ListView.builder(
                            itemCount:
                                breedSelectionState.filteredBreeds.length,
                            // shrinkWrap: true,
                            itemBuilder: (context, index) {
                              final breed =
                                  breedSelectionState.filteredBreeds[index];
                              return CheckboxSelectionUnit(
                                isSelected: breedSelectionState.selectedBreedIds
                                    .contains(breed.id),
                                onTap: () =>
                                    breedCubit.toggleBreedSelection(breed.id),
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
                        onPressed:
                            breedSelectionState.selectedBreedIds.isNotEmpty
                                ? () {
                                    onBreedsSelected
                                        .call(breedCubit.getSelectedBreeds());
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
