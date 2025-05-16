import 'dart:io';

import 'package:parki_dog/core/utils/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> exitApp(BuildContext context) async {
  if (Platform.isAndroid) {
    SystemNavigator.pop();
  } else if (Platform.isIOS) {
    exit(AppInt.i0);
  }
}
