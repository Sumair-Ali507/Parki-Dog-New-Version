import 'package:parki_dog/core/utils/values_manager.dart';
import 'package:flutter/material.dart';

class CustomTabBarView extends StatefulWidget {
  final List<Widget> tabs;
  final List<Widget> children;
  final double spaceFromHeight;
  final Color? bgColor;
  final Color? labelColor;
  final Color? unSelectedLabelColor;
  final Color? indicatorColor;

  const CustomTabBarView(
      {super.key,
      required this.tabs,
      required this.children,
      this.spaceFromHeight = AppDouble.d0,
      this.bgColor,
      this.labelColor,
      this.unSelectedLabelColor,
      this.indicatorColor});

  @override
  State<CustomTabBarView> createState() => _CustomTabBarViewState();
}

class _CustomTabBarViewState extends State<CustomTabBarView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: widget.tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(widget.spaceFromHeight),
              child: CustomTabBar(
                  tabs: widget.tabs,
                  controller: _tabController,
                  bgColor: widget.bgColor,
                  labelColor: widget.labelColor,
                  unSelectedLabelColor: widget.unSelectedLabelColor,
                  indicatorColor: widget.indicatorColor),
            ),
          ),
          SliverFillRemaining(
            child: TabBarView(
              controller: _tabController,
              children: widget.children,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTabBar extends StatelessWidget {
  final List<Widget> tabs;
  final TabController controller;
  final Color? bgColor;
  final Color? labelColor;
  final Color? unSelectedLabelColor;
  final Color? indicatorColor;

  const CustomTabBar(
      {super.key,
      required this.tabs,
      required this.controller,
      this.bgColor,
      this.labelColor,
      this.unSelectedLabelColor,
      this.indicatorColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor,
      width: double.infinity,
      child: TabBar(
        controller: controller,
        isScrollable: true,
        labelColor: labelColor,
        dividerHeight: AppDouble.d0,
        unselectedLabelColor: unSelectedLabelColor,
        indicatorColor: indicatorColor,
        tabAlignment: TabAlignment.start,
        tabs: tabs
            .map((tab) => Tab(
                  icon: tab,
                ))
            .toList(),
      ),
    );
  }
}
