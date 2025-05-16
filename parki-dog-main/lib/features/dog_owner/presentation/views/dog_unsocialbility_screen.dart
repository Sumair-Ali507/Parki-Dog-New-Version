import 'package:parki_dog/features/dog_owner/export//dog_owner_export.dart';

class DogUnSociabilityScreen extends StatelessWidget {
  final DogOwnerProcessCubit dogOwnerProcessCubit;

  const DogUnSociabilityScreen({super.key, required this.dogOwnerProcessCubit});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => SignupCubit(getIt.get()),
        child: BlocConsumer<SignupCubit, SignupState>(
          listener: (signUpContext, signUpState) {
            if (signUpState.isError) {
              showTopSnackBar(context,
                  message: LocaleKeys.paginatedListView_somethingWentWrong.tr(),
                  isGreen: false);
            }
            if (signUpState.isSuccess) {
              showTopSnackBar(context,
                  message: LocaleKeys.auth_successVerifyEmail.tr());
              // context.pushNamed(Routes.verifyEmailRoute);
              context.pushNamedAndRemoveUntil(Routes.verifyEmailRoute,
                  predicate: (route) => false);
            }
          },
          builder: (signUpContext, signUpState) {
            SignupCubit signUpCubit = signUpContext.read<SignupCubit>();
            return BlocBuilder<DogOwnerProcessCubit, DogOwnerProcessModel>(
              bloc: dogOwnerProcessCubit,
              builder: (dogOwnerProcessContext, dogOwnerProcess) {
                return Scaffold(
                  bottomNavigationBar: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppDouble.d16, vertical: AppDouble.d32),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        signUpState.isLoading && signUpState.fromNotNow == true
                            ? const Center(child: CircularProgressIndicator())
                            : SizedBox(
                                width: double.infinity,
                                child: TextButton(
                                    onPressed: () {
                                      signUpCubit.signUp(context,
                                          body:
                                              registrationBody(dogOwnerProcess)
                                                  .toJson(),
                                          fromNotNow: true,
                                          fromSubmit: false,
                                          fromX: false);
                                    },
                                    child: Text(
                                      LocaleKeys.dogOwner_notNow,
                                      style: TextStyles.font16Grey600Medium(),
                                    ).tr())),
                        const SizedBox(height: AppDouble.d14),
                        signUpState.isLoading && signUpState.fromSubmit == true
                            ? const Center(child: CircularProgressIndicator())
                            : SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                    onPressed: () {
                                      signUpCubit.signUp(context,
                                          body:
                                              registrationBody(dogOwnerProcess)
                                                  .toJson(),
                                          fromSubmit: true,
                                          fromNotNow: false,
                                          fromX: false);
                                    },
                                    child:
                                        const Text(LocaleKeys.dogOwner_confirm)
                                            .tr())),
                      ],
                    ),
                  ),
                  body: ListView(
                    padding: const EdgeInsets.all(AppDouble.d16),
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              LocaleKeys.dogOwner_dogUnSociability,
                              textAlign: TextAlign.start,
                              maxLines: AppInt.i1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyles.font24Grey700SemiBold(),
                            ).tr(),
                          ),
                          signUpState.isLoading && signUpState.fromX == true
                              ? const Center(child: CircularProgressIndicator())
                              : IconButton(
                                  onPressed: () {
                                    signUpCubit.signUp(context,
                                        body: registrationBody(dogOwnerProcess)
                                            .toJson(),
                                        fromX: true,
                                        fromSubmit: false,
                                        fromNotNow: false);
                                  },
                                  icon: SvgPicture.asset(
                                    ImageAssets.close,
                                    colorFilter: const ColorFilter.mode(
                                        ColorsManager.grey700, BlendMode.srcIn),
                                  ))
                        ],
                      ),
                      const SizedBox(height: AppDouble.d8),
                      Text(
                        LocaleKeys.dogOwner_dogUnSociabilitySubHeader,
                        style: TextStyles.font12Grey500Regular(),
                      ).tr(),
                      const SizedBox(height: AppDouble.d48),
                      InkWell(
                        onTap: () {
                          selectBreedsBottomSheet(context,
                              onBreedsSelected: (breeds) {
                            dogOwnerProcessCubit.updateDogOwnerProcess(
                                breedsUnsociability:
                                    breeds.map((e) => e.name).toList());
                            dogOwnerProcessCubit
                                    .breedsUnsociabilityController.text =
                                '${breeds.length} ${LocaleKeys.dogOwner_breeds.tr()}';
                          });
                        },
                        borderRadius: BorderRadius.circular(AppDouble.d16),
                        child: CustomInputField(
                            hint: LocaleKeys.dogOwner_breedHint.tr(),
                            label: LocaleKeys.dogOwner_breeds.tr(),
                            controller: dogOwnerProcessCubit
                                .breedsUnsociabilityController,
                            // validator: validateRequiredField,
                            enabled: false,
                            suffixIcon: const DefaultSuffixIcon(
                                assetName: ImageAssets.down)),
                      ),
                      const SizedBox(height: AppDouble.d32),
                      InkWell(
                        onTap: () {
                          selectMultipleGenderBottomSheet(context,
                              onGendersSelected: (genders) {
                            dogOwnerProcessCubit
                                    .gendersUnsociabilityController.text =
                                genders
                                    .map((e) => e.name.tr().capitalizeFirst())
                                    .join(', ');
                            dogOwnerProcessCubit.updateDogOwnerProcess(
                                gendersUnsociability:
                                    genders.map((e) => e.name.tr()).toList());
                          });
                        },
                        borderRadius: BorderRadius.circular(AppDouble.d16),
                        child: CustomInputField(
                            hint: LocaleKeys.dogOwner_genderHint.tr(),
                            label: LocaleKeys.dogOwner_gender.tr(),
                            controller: dogOwnerProcessCubit
                                .gendersUnsociabilityController,
                            // validator: validateRequiredField,
                            enabled: false,
                            suffixIcon: const DefaultSuffixIcon(
                                assetName: ImageAssets.down)),
                      ),
                      const SizedBox(height: AppDouble.d32),
                      CustomInputField(
                        hint: LocaleKeys.dogOwner_weightHint.tr(),
                        label: LocaleKeys.dogOwner_weight.tr(),
                        controller:
                            dogOwnerProcessCubit.weightUnsociabilityController,
                        // validator: validateRequiredField,
                        onChanged: (weight) {
                          dogOwnerProcessCubit
                              .weightUnsociabilityController.text = weight;
                          dogOwnerProcessCubit.updateDogOwnerProcess(
                              minWeightUnsociability: double.parse(weight));
                        },
                        suffixIcon: InkWell(
                          onTap: () {
                            chooseConditionDialog(context,
                                onConditionSelected: (condition) {
                              dogOwnerProcessCubit.updateDogOwnerProcess(
                                  conditionUnsociability: condition);
                            });
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                dogOwnerProcess.conditionUnSociability.name,
                                style: TextStyles.font12Grey500RegularRoboto(),
                              ).tr(),
                              const SizedBox(width: AppDouble.d4),
                              SvgPicture.asset(ImageAssets.down,
                                  colorFilter: const ColorFilter.mode(
                                      ColorsManager.grey500, BlendMode.srcIn)),
                              const SizedBox(width: AppDouble.d12)
                            ],
                          ),
                        ),
                        textInputType: TextInputType.number,
                        inputFormatters: [
                          DoubleTextInputFormatter(),
                        ],
                      )
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
