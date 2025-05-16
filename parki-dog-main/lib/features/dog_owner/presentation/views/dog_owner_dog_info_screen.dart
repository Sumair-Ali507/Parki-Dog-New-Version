import 'package:parki_dog/features/dog_owner/export//dog_owner_export.dart';

class DogOwnerDogInfoScreen extends StatelessWidget {
  final DogOwnerProcessCubit dogOwnerProcessCubit;

  const DogOwnerDogInfoScreen({super.key, required this.dogOwnerProcessCubit});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DogOwnerProcessCubit, DogOwnerProcessModel>(
      bloc: dogOwnerProcessCubit,
      builder: (dogOwnerProcessContext, dogOwnerProcess) {
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
                  if (dogOwnerProcessCubit.dogInfoGormKey.currentState!
                      .validate()) {
                    context.pushNamed(Routes.dogUnSociabilityRoute,
                        arguments: dogOwnerProcessCubit);
                  }
                },
                child: const Text(LocaleKeys.dogOwner_done).tr()),
          ),
          body: Form(
            key: dogOwnerProcessCubit.dogInfoGormKey,
            child: ListView(
              padding: const EdgeInsets.symmetric(
                  vertical: AppDouble.d16, horizontal: AppDouble.d24),
              children: [
                const ProgressiveLine(
                    slotsNumber: AppInt.i3, activeSlot: AppInt.i3),
                const SizedBox(height: AppDouble.d32),
                AddImageWidget(
                  onTap: () async {
                    dogOwnerProcessCubit
                        .pickDogImage(); // Call the cubit method
                  },
                  imageAsset: ImageAssets.dog,
                  uploadedImage: dogOwnerProcess.dogImageFile,
                ),
                const SizedBox(height: AppDouble.d24),
                CustomInputField(
                  hint: LocaleKeys.dogOwner_dogNameHint.tr(),
                  label: LocaleKeys.dogOwner_dogName.tr(),
                  controller: dogOwnerProcessCubit.dogNameController,
                  validator: validateRequiredField,
                  onChanged: (dogName) {
                    dogOwnerProcessCubit.dogNameController.text = dogName;
                    dogOwnerProcessCubit.updateDogOwnerProcess(
                        dogName: dogName);
                  },
                ),
                const SizedBox(height: AppDouble.d24),
                InkWell(
                  onTap: () {
                    chooseBreedDialog(context, onBreedSelected: (breed) {
                      dogOwnerProcessCubit.breedController.text = breed.name;
                      dogOwnerProcessCubit.updateDogOwnerProcess(breed: breed);
                    });
                  },
                  borderRadius: BorderRadius.circular(AppDouble.d16),
                  child: CustomInputField(
                      hint: LocaleKeys.dogOwner_breedHint.tr(),
                      label: LocaleKeys.dogOwner_breeds.tr(),
                      controller: dogOwnerProcessCubit.breedController,
                      validator: validateRequiredField,
                      enabled: false,
                      suffixIcon:
                          const DefaultSuffixIcon(assetName: ImageAssets.down)),
                ),
                const SizedBox(height: AppDouble.d24),
                GenderSelectionWidget(
                  genderController: dogOwnerProcessCubit.dogGenderController,
                  onSelected: (gender) {
                    dogOwnerProcessCubit.dogGenderController.text =
                        gender.name.tr().capitalizeFirst();
                    dogOwnerProcessCubit.updateDogOwnerProcess(
                        dogGender: gender);
                  },
                ),
                const SizedBox(height: AppDouble.d24),
                InkWell(
                  onTap: () {
                    selectDateTimePopup(context,
                        title: LocaleKeys.dateAndTimePicker_selectDate,
                        onDateTimeChanged: (date) {
                      dogOwnerProcessCubit.dogBirthDateController.text =
                          date.appDateStringFormat();
                      dogOwnerProcessCubit.updateDogOwnerProcess(
                          dogBirthDate: date);
                    });
                  },
                  child: CustomInputField(
                      hint: LocaleKeys.dogOwner_birthDateHint.tr(),
                      label: LocaleKeys.dogOwner_birthDate.tr(),
                      controller: dogOwnerProcessCubit.dogBirthDateController,
                      validator: validateRequiredField,
                      enabled: false,
                      suffixIcon: const DefaultSuffixIcon(
                        assetName: ImageAssets.calendar,
                      )),
                ),
                const SizedBox(height: AppDouble.d24),
                CustomInputField(
                  hint: LocaleKeys.dogOwner_weightHint.tr(),
                  label: LocaleKeys.dogOwner_weight.tr(),
                  controller: dogOwnerProcessCubit.dogWeightController,
                  validator: validateRequiredField,
                  onChanged: (weight) {
                    dogOwnerProcessCubit.dogWeightController.text = weight;
                    dogOwnerProcessCubit.updateDogOwnerProcess(
                        dogWeight: double.parse(weight));
                  },
                  textInputType: TextInputType.number,
                  inputFormatters: [
                    DoubleTextInputFormatter(),
                  ],
                ),
                const SizedBox(height: AppDouble.d24),
                CustomInputField(
                  hint: LocaleKeys.dogOwner_chipNumberHint.tr(),
                  label: LocaleKeys.dogOwner_chipNumber.tr(),
                  textInputType: TextInputType.number,
                  controller: dogOwnerProcessCubit.chipNumberController,
                  // validator: validateRequiredField,
                  onChanged: (chipNumber) {
                    dogOwnerProcessCubit.chipNumberController.text = chipNumber;
                    dogOwnerProcessCubit.updateDogOwnerProcess(
                        chipNumber: int.parse(chipNumber));
                  },
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
