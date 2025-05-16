import 'package:parki_dog/core/helpers/double_text_input_formatter.dart';
import 'package:parki_dog/core/shared_widgets/choose_breed_dialog/widgets/choose_breed_dialog.dart';
import 'package:parki_dog/features/dog_owner/data/models/breed_model.dart';
import 'package:parki_dog/features/profile/export/profile_export.dart';
import 'package:parki_dog/features/profile/presentation/busniess_logic/update_dog_cubit/update_dog_cubit.dart';

class UpdateDogScreen extends StatelessWidget {
  final Profile? profile;

  const UpdateDogScreen({super.key, this.profile});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<UpdateDogCubit>()..init(profile),
      child: BlocConsumer<UpdateDogCubit, UpdateDogState>(
  listener: (updateDogContext, updateDogState) {
    if (updateDogState.isSuccess) {
      showTopSnackBar(context, message: LocaleKeys.profile_changesSaved.tr());
    }
    if (updateDogState.isError) {
      showTopSnackBar(context, message: updateDogState.error,isGreen: false);
    }  },
  builder: (updateDogContext, updateDogState) {
    UpdateDogCubit updateDogCubit =
    updateDogContext.read<UpdateDogCubit>();
    // updateDogCubit.init(profile);
    updateDogCubit.updateInfoProcess(
      breed: Breed(id: '', name: profile?.ownedDogs?.first.breed??''),
      dogName: profile?.ownedDogs?.first.name??'',
      dogGender: parseGender( profile?.ownedDogs?.first.gender??'male'),
      dogBirthDate: updateDogCubit.calculateBirthdateFromAge(profile?.ownedDogs?.first.age),
      dogWeight: profile?.ownedDogs?.first.weight!=null?profile?.ownedDogs?.first.weight.parseToDouble():0.0
    );
    return Scaffold(
        appBar: AppBar(
          leading: const BackAppBar(),
          title: const Text(LocaleKeys.dogOwner_dogInfo).tr(),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppDouble.d24, vertical: AppDouble.d32),
          child: ElevatedButton(
              onPressed: () {
                if(profile?.ownedDogs?.first.sId!=null){
                updateDogCubit.save(profile?.ownedDogs?.first.sId??'');
                }

              },
              child: const Text(LocaleKeys.profile_saveChanges).tr()),
        ),
        body: Form(
          key: updateDogCubit.updateDogFormKey,
          child: ListView(
            padding: const EdgeInsets.symmetric(
                vertical: AppDouble.d16, horizontal: AppDouble.d24),
            children: [
              const SizedBox(height: AppDouble.d32),
              // AddImageWidget(
              //   onTap: () async {
              //     updateDogCubit
              //         .pickDogImage(); // Call the cubit method
              //   },
              //   imageAsset: ImageAssets.dog,
              //   uploadedImage: dogOwnerProcess.dogImageFile,
              // ),
              const SizedBox(height: AppDouble.d24),
              CustomInputField(
                hint: LocaleKeys.dogOwner_dogNameHint.tr(),
                label: LocaleKeys.dogOwner_dogName.tr(),
                controller: updateDogCubit.dogNameController,
                onChanged: (dogName) {
                  updateDogCubit.dogNameController.text = dogName;
                  updateDogCubit.updateInfoProcess(
                      dogName: dogName);
                },
              ),
              const SizedBox(height: AppDouble.d24),
              InkWell(
                onTap: () {
                  chooseBreedDialog(context, onBreedSelected: (breed) {
                    updateDogCubit.breedController.text = breed.name;
                    updateDogCubit.updateInfoProcess(breed: breed);
                  });
                },
                borderRadius: BorderRadius.circular(AppDouble.d16),
                child: CustomInputField(
                    hint: LocaleKeys.dogOwner_breedHint.tr(),
                    label: LocaleKeys.dogOwner_breeds.tr(),
                    controller: updateDogCubit.breedController,
                    enabled: false,
                    suffixIcon:
                    const DefaultSuffixIcon(assetName: ImageAssets.down)),
              ),
              const SizedBox(height: AppDouble.d24),
              GenderSelectionWidget(
                genderController: updateDogCubit.dogGenderController,
                onSelected: (gender) {
                  updateDogCubit.dogGenderController.text =
                      gender.name.tr().capitalizeFirst();
                  updateDogCubit.updateInfoProcess(
                      dogGender: gender);
                },
              ),
              const SizedBox(height: AppDouble.d24),
              InkWell(
                onTap: () {
                  selectDateTimePopup(context,
                      title: LocaleKeys.dateAndTimePicker_selectDate,
                      onDateTimeChanged: (date) {
                        updateDogCubit.dogBirthDateController.text =
                            date.appDateStringFormat();
                        updateDogCubit.updateInfoProcess(
                            dogBirthDate: date);
                      });
                },
                child: CustomInputField(
                    hint: LocaleKeys.dogOwner_birthDateHint.tr(),
                    label: LocaleKeys.dogOwner_birthDate.tr(),
                    controller: updateDogCubit.dogBirthDateController,
                    enabled: false,
                    suffixIcon: const DefaultSuffixIcon(
                      assetName: ImageAssets.calendar,
                    )),
              ),
              const SizedBox(height: AppDouble.d24),
              CustomInputField(
                hint: LocaleKeys.dogOwner_weightHint.tr(),
                label: LocaleKeys.dogOwner_weight.tr(),
                controller: updateDogCubit.dogWeightController,
                onChanged: (weight) {
                  updateDogCubit.dogWeightController.text = weight;
                  updateDogCubit.updateInfoProcess(
                      dogWeight: double.parse(weight));
                },
                textInputType: TextInputType.number,
                inputFormatters: [
                  DoubleTextInputFormatter(),
                ],
              ),
            ],
          ),
        ),
      );
  },
),
    );
  }
}
