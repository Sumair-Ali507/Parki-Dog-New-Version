import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

EdgeInsets allInsets(double value) => EdgeInsets.all(value.r);

EdgeInsets symmetricInsets({double? vertical, double? horizontal}) =>
    EdgeInsets.symmetric(
        vertical: vertical?.h ?? 0, horizontal: horizontal?.w ?? 0);

EdgeInsetsDirectional onlyInsets(
        {double? start, double? top, double? end, double? bottom}) =>
    EdgeInsetsDirectional.only(
        top: top?.h ?? 0,
        bottom: bottom?.h ?? 0,
        start: start?.w ?? 0,
        end: end?.w ?? 0);
