import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BaseViewWidget extends StatelessWidget {
  //Swipe To Refresh
  final bool hasRefresh;
  final ValueGetter<Future<bool>>? onRefreshListener;

  //Toolbar
  final AppBar? appBar;
  final Color? statusBarColor;
  final Widget? drawer;
  final bool resizeToAvoidBottomInset;
  final EdgeInsets? padding;

  //View
  final Widget body;
  final SystemUiOverlayStyle systemUiOverlayStyle;

  BaseViewWidget({
    this.hasRefresh = false,
    this.onRefreshListener,
    this.statusBarColor,
    this.resizeToAvoidBottomInset = true,
    this.systemUiOverlayStyle = SystemUiOverlayStyle.light,
    this.appBar,
    this.padding,
    this.drawer,
    required this.body,
    super.key,
  });

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      appBar: appBar,
      key: _scaffoldKey,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: systemUiOverlayStyle.copyWith(
              statusBarColor: statusBarColor ?? Colors.white),
          child: Padding(
            padding: padding ?? EdgeInsets.zero,
            child: _buildViewBody(),
          )),
      drawer: drawer,
    );
  }

  _buildViewBody() {
    return hasRefresh && onRefreshListener != null
        ? RefreshIndicator(
            triggerMode: RefreshIndicatorTriggerMode.anywhere,
            onRefresh: onRefreshListener!,
            child: body,
          )
        : body;
  }
}
