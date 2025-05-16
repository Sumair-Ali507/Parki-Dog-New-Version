import 'package:parki_dog/features/profile/export/profile_export.dart';

class EditBasicInfoScreen extends StatelessWidget {
  final Profile? profile;

  const EditBasicInfoScreen(
      {super.key,this.profile});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<EditBasicInfoCubit>()..init(profile),
      child: BlocConsumer<EditBasicInfoCubit, EditBasicInfoState>(
        listener: (editBasicInfoContext, editBasicInfoState) {
          if (editBasicInfoState.isSuccess) {
            showTopSnackBar(context, message: LocaleKeys.profile_changesSaved.tr());
          }
          if (editBasicInfoState.isError) {
            showTopSnackBar(context, message: editBasicInfoState.error,isGreen: false);
          }
        },
        builder: (editBasicInfoContext, editBasicInfoState) {
          EditBasicInfoCubit editBasicInfoCubit =
          editBasicInfoContext.read<EditBasicInfoCubit>();
          editBasicInfoCubit.updateInfoProcess(
            firstName: profile?.firstName??'',
            lastName: profile?.lastName??'',
            gender: parseGender('male'),
            birthDate: null,
          );
          return Scaffold(
            appBar: AppBar(
              leading: const BackAppBar(),
              title: const Text(LocaleKeys.profile_editBasicInfo).tr(),
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppDouble.d24, vertical: AppDouble.d32),
              child: editBasicInfoState.isLoading
                  ? const Column(
                                  mainAxisSize: MainAxisSize.min,
                    children: [
                      Center(child: CircularProgressIndicator()),
                    ],
                  )
                  :ElevatedButton(
                  onPressed: () {
                    // if (editBasicInfoCubit.basicInfoGormKey.currentState!
                    //     .validate()) {
                    //
                    // }
                    editBasicInfoCubit.save();
                  },
                  child: const Text(LocaleKeys.profile_save).tr()),
            ),
            body: Form(
              key: editBasicInfoCubit.basicInfoGormKey,
              child: ListView(
                padding: const EdgeInsets.symmetric(
                    vertical: AppDouble.d16, horizontal: AppDouble.d24),
                children: [
                  const SizedBox(height: AppDouble.d32),
                  AddImageWidget(
                    onTap: () async {
                      editBasicInfoCubit
                          .pickDogOwnerImage(); // Call the cubit method
                    },
                    imageAsset: ImageAssets.person,
                    uploadedImage: editBasicInfoState.imageFile,
                  ),
                  const SizedBox(height: AppDouble.d24),
                  Row(
                    children: [
                      Expanded(
                        child: CustomInputField(
                          hint: LocaleKeys.dogOwner_firstName.tr(),
                          label: LocaleKeys.dogOwner_firstName.tr(),
                          onChanged: (firstName) {
                            editBasicInfoCubit.updateInfoProcess(
                                firstName: firstName);
                          },
                          controller:
                          editBasicInfoCubit.firstNameController,
                          // validator: validateRequiredField,
                        ),
                      ),
                      const SizedBox(width: AppDouble.d8),
                      Expanded(
                        child: CustomInputField(
                          hint: LocaleKeys.dogOwner_lastName.tr(),
                          label: LocaleKeys.dogOwner_lastName.tr(),
                          onChanged: (lastName) {
                            editBasicInfoCubit.updateInfoProcess(
                                lastName: lastName);
                          },
                          controller: editBasicInfoCubit.lastNameController,
                          // validator: validateRequiredField,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppDouble.d24),
                  GenderSelectionWidget(
                    genderController: editBasicInfoCubit.genderController,
                    onSelected: (gender) {
                      editBasicInfoCubit.genderController.text =
                          gender.name.tr().capitalizeFirst();
                      editBasicInfoCubit.updateInfoProcess(gender: gender);
                    },
                  ),
                  const SizedBox(height: AppDouble.d24),
                  InkWell(
                    onTap: () {
                      selectDateTimePopup(context,
                          title: LocaleKeys.dateAndTimePicker_selectDate,
                          onDateTimeChanged: (date) {
                            editBasicInfoCubit.updateInfoProcess(
                                birthDate: date);
                            editBasicInfoCubit.birthDateController.text =
                                date.appDateStringFormat();
                          });
                    },
                    borderRadius: BorderRadius.circular(AppDouble.d16),
                    child: CustomInputField(
                        hint: LocaleKeys.dogOwner_birthDateHint.tr(),
                        label: LocaleKeys.dogOwner_birthDate.tr(),
                        enabled: false,
                        controller: editBasicInfoCubit.birthDateController,
                        // validator: validateRequiredField,
                        suffixIcon: const DefaultSuffixIcon(
                          assetName: ImageAssets.calendar,
                        )),
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
