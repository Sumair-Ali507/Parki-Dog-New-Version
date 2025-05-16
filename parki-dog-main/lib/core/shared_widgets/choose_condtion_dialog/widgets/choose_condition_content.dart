import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parki_dog/core/extensions/extenstions.dart';
import 'package:parki_dog/core/shared_widgets/choose_breed_dialog/widgets/radio_selection_unit.dart';
import 'package:parki_dog/core/shared_widgets/choose_condtion_dialog/business_logic/choose_condition_bloc.dart';
import 'package:parki_dog/core/utils/values_manager.dart';

class ChooseConditionContent extends StatelessWidget {
  final Function(Condition) onConditionSelected;
  const ChooseConditionContent({super.key, required this.onConditionSelected});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppDouble.d1.sw,
      child: Column(
        children: [
          BlocProvider(
            create: (context) => ChooseConditionCubit(),
            child: BlocBuilder<ChooseConditionCubit, Condition>(
              builder: (conditionContext, condition) {
                ChooseConditionCubit conditionCubit =
                    conditionContext.read<ChooseConditionCubit>();
                return SizedBox(
                  height: 150,
                  child: ListView.builder(
                      itemCount: Condition.values.length,
                      itemBuilder: (context, index) {
                        return RadioSelectionUnit(
                          isSelected: condition == Condition.values[index],
                          onTap: () {
                            conditionCubit
                                .changeCondition(Condition.values[index]);
                            onConditionSelected(Condition.values[index]);
                            context.pop();
                          },
                          text: Condition.values[index].name.tr(),
                        );
                      }),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
