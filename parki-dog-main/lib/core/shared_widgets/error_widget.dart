import 'package:parki_dog/core/shared_widgets/app_adaptive_dialog.dart';
import 'package:parki_dog/core/shared_widgets/empty_error_widget.dart';
import 'package:parki_dog/core/utils/colors_manager.dart';
import 'package:flutter/material.dart';

class AppErrorWidget extends StatelessWidget {
  final String description;
  final bool isDialog;
  final Future<bool> Function()? buttonClickListener;
  final bool hasButton;
  final String? buttonTxt;

  const AppErrorWidget({
    super.key,
    required this.description,
    this.isDialog = false,
    this.buttonClickListener,
    this.hasButton = false,
    this.buttonTxt,
  });

  @override
  Widget build(BuildContext context) {
    return isDialog
        ? DialogEmptyErrorWidget(
            description: description,
            isEmptyView: false,
          )
        : EmptyErrorWidget(
            description: description,
            isEmptyView: false,
            hasButton: hasButton,
            buttonClickListener: buttonClickListener,
            buttonTxt: buttonTxt,
          );
  }
}

Future<dynamic> appErrorDialog(BuildContext context, String description) {
  return appAdaptiveDialog(
    context,
    bgColor: ColorsManager.white,
    content: AppErrorWidget(
      description: description,
      isDialog: true,
    ),
  );
}
