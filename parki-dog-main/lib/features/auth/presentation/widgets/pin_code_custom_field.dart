import 'package:parki_dog/features/auth/export/auth_export.dart';
import 'package:parki_dog/features/auth/presentation/business_logic/pin_code_cubit/pin_code_cubit.dart';
import 'package:parki_dog/features/auth/presentation/business_logic/pin_code_cubit/pin_code_state.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinCodeCustomWidget extends StatelessWidget {
  const PinCodeCustomWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PinCodeCubit, PinCodeState>(
      builder: (context, state) {
        return Directionality(
            textDirection: TextDirection.rtl,
            child: PinCodeTextField(
              // Existing properties
              onChanged: (value) {
                BlocProvider.of<PinCodeCubit>(context).onPinCodeChanged(value);
              },
              onCompleted: (value) {
                BlocProvider.of<PinCodeCubit>(context)
                    .onPinCodeCompleted(value);
              },
              appContext: context,
              length: 4,
              // Existing properties
              pastedTextStyle: const TextStyle(
                color: ColorsManager.greyDark,
                fontWeight: FontWeight.bold,
              ),
              obscureText: false,
              obscuringCharacter: '*',
              backgroundColor: Colors.transparent,
              animationType: AnimationType.fade,
              validator: (v) {
                return null;
              },
              pinTheme: PinTheme(
                  // disabledColor: ColorsManager.lightnessGrey,
                  shape: PinCodeFieldShape.box,
                  borderWidth: AppDouble.d1,
                  borderRadius: BorderRadius.circular(AppDouble.d15),
                  fieldHeight: 70,
                  fieldWidth: 70,
                  inactiveColor: ColorsManager.greyDividerHome,
                  activeColor: ColorsManager.primaryColor,
                  selectedColor: ColorsManager.primaryColor,
                  selectedFillColor: ColorsManager.white,
                  inactiveFillColor: ColorsManager.white,
                  activeFillColor: ColorsManager.white),
              cursorColor: ColorsManager.primaryColor,
              animationDuration: const Duration(milliseconds: 300),
              textStyle: TextStyles.font40PrimaryMedium(),
              enableActiveFill: true,
              keyboardType: TextInputType.number,
            ));
      },
    );
  }
}
