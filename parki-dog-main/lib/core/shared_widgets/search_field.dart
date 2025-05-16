import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:parki_dog/core/shared_widgets/custom_input_field.dart';
import 'package:parki_dog/core/shared_widgets/svg_icon.dart';
import 'package:parki_dog/core/utils/assets_manager.dart';
import 'package:parki_dog/core/utils/colors_manager.dart';
import 'package:parki_dog/generated/locale_keys.g.dart';

class SearchField extends StatelessWidget {
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final Widget? suffixIcon;
  final bool isDebounceEnabled;
  const SearchField(
      {super.key,
      this.onChanged,
      this.controller,
      this.suffixIcon,
      this.isDebounceEnabled = false});
  @override
  Widget build(BuildContext context) {
    return CustomInputField(
      controller: controller,
      onChanged: onChanged,
      isDebounceEnabled: isDebounceEnabled,
      hint: LocaleKeys.chat_search.tr(),
      fillColor: ColorsManager.grey100,
      prefixIcon: const IconButton(
        onPressed: null,
        icon: SvgIcon(
            color: ColorsManager.grey400, assetName: ImageAssets.search),
      ),
      suffixIcon: suffixIcon,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: ColorsManager.trans, width: 0)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: ColorsManager.trans, width: 0)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: ColorsManager.trans, width: 0)),
    );
  }
}
