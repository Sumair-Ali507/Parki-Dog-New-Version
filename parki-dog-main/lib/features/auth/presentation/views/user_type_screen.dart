import 'package:parki_dog/features/auth/export/auth_export.dart';

class UserTypeScreen extends StatelessWidget {
  final DogOwnerProcessCubit dogOwnerProcessCubit;

  const UserTypeScreen({super.key, required this.dogOwnerProcessCubit});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> userTypes = [
      {
        'id': 1,
        'assetName': ImageAssets.dogOwner,
        'text': LocaleKeys.auth_dogOwner,
      },
      {
        'id': 2,
        'assetName': ImageAssets.veterinarianSvg,
        'text': LocaleKeys.auth_veterinarian,
      },
      {
        'id': 3,
        'assetName': ImageAssets.trainer,
        'text': LocaleKeys.auth_trainer,
      },
      {
        'id': 4,
        'assetName': ImageAssets.washingShop,
        'text': LocaleKeys.auth_washingShop,
      },
    ];
    return BlocProvider(
      create: (context) => UserTypeCubit(),
      child: Scaffold(
        appBar: AppBar(
          leading: const BackAppBar(),
          title: const Text(LocaleKeys.auth_whatDescribesYou).tr(),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(
              vertical: AppDouble.d16, horizontal: AppDouble.d24),
          children: [
            const ProgressiveLine(
                slotsNumber: AppInt.i3, activeSlot: AppInt.i1),
            const SizedBox(height: AppDouble.d60),
            BlocBuilder<UserTypeCubit, int?>(
              builder: (userTypeContext, selectedUserId) {
                return Wrap(
                  spacing: AppDouble.d16,
                  runSpacing: AppDouble.d16,
                  alignment: WrapAlignment.center,
                  children: List.generate(
                    userTypes.length,
                    (index) => UserTypeWidget(
                      isSelected: selectedUserId == userTypes[index]['id'],
                      assetName: userTypes[index]['assetName'],
                      text: userTypes[index]['text'],
                      onTap: () {
                        userTypeContext.read<UserTypeCubit>().selectUserType(
                            context,
                            userTypes[index]['id'],
                            dogOwnerProcessCubit);
                      },
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
