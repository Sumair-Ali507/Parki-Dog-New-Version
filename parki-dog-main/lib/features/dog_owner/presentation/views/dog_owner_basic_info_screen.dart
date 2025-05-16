import 'package:parki_dog/features/dog_owner/export//dog_owner_export.dart';

class DogOwnerBasicInfoScreen extends StatelessWidget {
  final DogOwnerProcessCubit dogOwnerProcessCubit;

  const DogOwnerBasicInfoScreen(
      {super.key, required this.dogOwnerProcessCubit});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DogOwnerProcessCubit, DogOwnerProcessModel>(
      bloc: dogOwnerProcessCubit,
      builder: (dogOwnerProcessContext, dogOwnerProcess) {
        return Scaffold(
          appBar: AppBar(
            leading: const BackAppBar(),
            title: const Text(LocaleKeys.dogOwner_basicInfo).tr(),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppDouble.d24, vertical: AppDouble.d32),
            child: ElevatedButton(
                onPressed: () {
                  if (dogOwnerProcessCubit.basicInfoGormKey.currentState!
                      .validate()) {
                    context.pushNamed(Routes.dogOwnerDogInfoRoute,
                        arguments: dogOwnerProcessCubit);
                  }
                },
                child: const Text(LocaleKeys.dogOwner_next).tr()),
          ),
          body: Form(
            key: dogOwnerProcessCubit.basicInfoGormKey,
            child: ListView(
              padding: const EdgeInsets.symmetric(
                  vertical: AppDouble.d16, horizontal: AppDouble.d24),
              children: [
                const ProgressiveLine(
                    slotsNumber: AppInt.i3, activeSlot: AppInt.i2),
                const SizedBox(height: AppDouble.d32),
                AddImageWidget(
                  onTap: () async {
                    dogOwnerProcessCubit
                        .pickDogOwnerImage(); // Call the cubit method
                  },
                  imageAsset: ImageAssets.person,
                  uploadedImage: dogOwnerProcess.imageFile,
                ),
                const SizedBox(height: AppDouble.d24),
                Row(
                  children: [
                    Expanded(
                      child: CustomInputField(
                        hint: LocaleKeys.dogOwner_firstName.tr(),
                        label: LocaleKeys.dogOwner_firstName.tr(),
                        onChanged: (firstName) {
                          dogOwnerProcessCubit.updateDogOwnerProcess(
                              firstName: firstName);
                        },
                        controller: dogOwnerProcessCubit.firstNameController,
                        validator: validateRequiredField,
                      ),
                    ),
                    const SizedBox(width: AppDouble.d8),
                    Expanded(
                      child: CustomInputField(
                        hint: LocaleKeys.dogOwner_lastName.tr(),
                        label: LocaleKeys.dogOwner_lastName.tr(),
                        onChanged: (lastName) {
                          dogOwnerProcessCubit.updateDogOwnerProcess(
                              lastName: lastName);
                        },
                        controller: dogOwnerProcessCubit.lastNameController,
                        validator: validateRequiredField,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppDouble.d24),
                GenderSelectionWidget(
                  genderController: dogOwnerProcessCubit.genderController,
                  onSelected: (gender) {
                    dogOwnerProcessCubit.genderController.text =
                        gender.name.tr().capitalizeFirst();
                    dogOwnerProcessCubit.updateDogOwnerProcess(gender: gender);
                  },
                ),
                const SizedBox(height: AppDouble.d24),
                InkWell(
                  onTap: () {
                    selectDateTimePopup(context,
                        title: LocaleKeys.dateAndTimePicker_selectDate,
                        onDateTimeChanged: (date) {
                      dogOwnerProcessCubit.updateDogOwnerProcess(
                          birthDate: date);
                      dogOwnerProcessCubit.birthDateController.text =
                          date.appDateStringFormat();
                    });
                  },
                  borderRadius: BorderRadius.circular(AppDouble.d16),
                  child: CustomInputField(
                      hint: LocaleKeys.dogOwner_birthDateHint.tr(),
                      label: LocaleKeys.dogOwner_birthDate.tr(),
                      enabled: false,
                      controller: dogOwnerProcessCubit.birthDateController,
                      validator: validateRequiredField,
                      suffixIcon: const DefaultSuffixIcon(
                        assetName: ImageAssets.calendar,
                      )),
                ),
                const SizedBox(height: AppDouble.d24),
                CustomInputField(
                    hint: LocaleKeys.dogOwner_phoneNumberHint.tr(),
                    label: LocaleKeys.dogOwner_phoneNumber.tr(),
                    textInputType: TextInputType.phone,
                    validator: validateRequiredField,
                    prefixIcon: CountryCodePicker(
                      onInit: (countryCode) {
                        dogOwnerProcessCubit.updateDogOwnerProcess(
                            dialCode: countryCode!.dialCode);
                      },
                      onChanged: (countryCode) {
                        dogOwnerProcessCubit.updateDogOwnerProcess(
                            dialCode: countryCode.dialCode);
                      },
                      favorite: const ['+39', '+20', '+970'],
                      initialSelection: '+39',
                    ),
                    onChanged: (phoneNumber) {
                      dogOwnerProcessCubit.phoneNumberController.text =
                          phoneNumber;
                      dogOwnerProcessCubit.updateDogOwnerProcess(
                          phoneNumber: dogOwnerProcess.dialCode! + phoneNumber);
                    },
                    controller: dogOwnerProcessCubit.phoneNumberController,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ]),
                const SizedBox(height: AppDouble.d24),
                InkWell(
                  onTap: () async {
                    final result = await context.pushNamed(Routes.mapRoute,
                        arguments: true);
                    if (result != null) {
                      final LatLng? selectedLatLng = result['latLng'];
                      final String? selectedCountry = result['country'];
                      final String? namedAddress = result['namedAddress'];
                      if (selectedLatLng != null &&
                          selectedCountry != null &&
                          namedAddress != null) {
                        dogOwnerProcessCubit.addressController.text =
                            namedAddress;
                        dogOwnerProcessCubit.updateDogOwnerProcess(
                            country: selectedCountry);
                        dogOwnerProcessCubit.updateDogOwnerProcess(
                            coordinates: [
                              selectedLatLng.latitude,
                              selectedLatLng.longitude
                            ]);
                      }
                    }
                  },
                  borderRadius: BorderRadius.circular(AppDouble.d16),
                  child: CustomInputField(
                    enabled: false,
                    controller: dogOwnerProcessCubit.addressController,
                    hint: LocaleKeys.dogOwner_addressHint.tr(),
                    label: LocaleKeys.dogOwner_address.tr(),
                    validator: validateRequiredField,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
