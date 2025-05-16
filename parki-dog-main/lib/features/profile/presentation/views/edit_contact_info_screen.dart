import 'package:parki_dog/features/dog_owner/export/dog_owner_export.dart';
import 'package:parki_dog/features/profile/export/profile_export.dart';
import 'package:parki_dog/features/profile/presentation/busniess_logic/edit_contact_info/edit_contact_info_cubit.dart';

class EditContactInfoScreen extends StatelessWidget {
  final Profile? profile;

  const EditContactInfoScreen({super.key, this.profile});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<EditContactInfoCubit>()..init(profile),
      child: BlocConsumer<EditContactInfoCubit, EditContactInfoState>(
        listener: (editContactInfoContext, editContactInfoState) {
          if (editContactInfoState.isSuccess) {
            showTopSnackBar(context, message: LocaleKeys.profile_changesSaved.tr());
          }
          if (editContactInfoState.isError) {
            showTopSnackBar(context, message: editContactInfoState.error,isGreen: false);
          }
        },
        builder: (editContactInfoContext, editContactInfoState) {
          EditContactInfoCubit editContactInfoCubit =
          editContactInfoContext.read<EditContactInfoCubit>();
          editContactInfoCubit.updateInfoProcess(
            phoneNumber: profile?.phone??'',
            address: profile?.country??'',
          );
          return Scaffold(
            appBar: AppBar(
              leading: const BackAppBar(),
              title: const Text(LocaleKeys.profile_editBasicInfo).tr(),
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppDouble.d24, vertical: AppDouble.d32),
              child: editContactInfoState.isLoading
                  ? const Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Center(child: CircularProgressIndicator()),
                    ],
                  )
                  :ElevatedButton(
                  onPressed: () {
                    // if (editContactInfoCubit.contactInfoGormKey.currentState!
                    //     .validate()) {
                    //
                    // }
                    editContactInfoCubit.save();

                  },
                  child: const Text(LocaleKeys.profile_save).tr()),
            ),
            body: Form(
              key: editContactInfoCubit.contactInfoGormKey,
              child: ListView(
                padding: const EdgeInsets.symmetric(
                    vertical: AppDouble.d16, horizontal: AppDouble.d24),
                children: [
                  const SizedBox(height: AppDouble.d32),
                  CustomInputField(
                      hint: LocaleKeys.dogOwner_phoneNumberHint.tr(),
                      label: LocaleKeys.dogOwner_phoneNumber.tr(),
                      textInputType: TextInputType.phone,
                      prefixIcon: CountryCodePicker(
                        onInit: (countryCode) {
                          editContactInfoCubit.updateInfoProcess(
                              dialCode: countryCode!.dialCode);
                        },
                        onChanged: (countryCode) {
                          editContactInfoCubit.updateInfoProcess(
                              dialCode: countryCode.dialCode);
                        },
                        favorite: const ['+39', '+20', '+970'],
                        initialSelection: '+39',
                      ),
                      onChanged: (phoneNumber) {
                        editContactInfoCubit.phoneNumberController.text =
                            phoneNumber;
                        editContactInfoCubit.updateInfoProcess(
                            phoneNumber: editContactInfoState.dialCode! + phoneNumber);
                      },
                      controller: editContactInfoCubit.phoneNumberController,
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
                          editContactInfoCubit.addressController.text =
                              namedAddress;
                          editContactInfoCubit.updateInfoProcess(
                              country: selectedCountry);
                          editContactInfoCubit.updateInfoProcess(
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
                      controller: editContactInfoCubit.addressController,
                      hint: LocaleKeys.dogOwner_addressHint.tr(),
                      label: LocaleKeys.dogOwner_address.tr(),
                      // validator: validateRequiredField,
                    ),
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
