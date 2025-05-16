import 'dart:math';

import 'package:parki_dog/core/utils/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SlidableCards extends StatefulWidget {
  final List<String> networkImagesList;
  const SlidableCards({super.key, required this.networkImagesList});

  @override
  State<SlidableCards> createState() => _SlidableCardsState();
}

class _SlidableCardsState extends State<SlidableCards> {
  late double _page;
  // late int _page;
  @override
  void initState() {
    super.initState();
    // _page = 10;
    _page = widget.networkImagesList.length - AppDouble.d1;
  }

  @override
  Widget build(BuildContext context) {
    double width = AppDouble.d1.sw;
    PageController pageController;
    // pageController = PageController(initialPage: 10);
    pageController =
        PageController(initialPage: widget.networkImagesList.length - 1);
    pageController.addListener(
      () {
        setState(
          () {
            // _page = pageController.page!;
            _page = pageController.page!;
          },
        );
      },
    );

    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            SizedBox(
              height: width,
              width: width * AppDouble.d0_95,
              child: LayoutBuilder(
                builder: (context, boxConstraints) {
                  List<Widget> cards = List.empty(growable: true);

                  // for (int i = 0; i <= 11; i++) {
                  for (int i = AppInt.i0;
                      i <= widget.networkImagesList.length - AppInt.i1;
                      i++) {
                    double currentPageValue = i - _page;
                    // int currentPageValue = i - _page;
                    bool pageLocation = currentPageValue > AppDouble.d0;

                    double start = AppDouble.d20 +
                        max(
                            (boxConstraints.maxWidth -
                                    width * AppDouble.d0_75) -
                                ((boxConstraints.maxWidth -
                                            width * AppDouble.d0_75) /
                                        AppDouble.d2) *
                                    -currentPageValue *
                                    (pageLocation
                                        ? AppDouble.d9
                                        : AppDouble.d1),
                            AppDouble.d0);

                    var customizableCard = Positioned.directional(
                      top: AppDouble.d20 +
                          AppDouble.d30 *
                              max(-currentPageValue.toDouble(), AppDouble.d0),
                      bottom: AppDouble.d20 +
                          AppDouble.d30 *
                              max(-currentPageValue.toDouble(), AppDouble.d0),
                      start: start,
                      textDirection: TextDirection.ltr,
                      child: Container(
                        // height: width * .67,
                        // width: width * .67,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            // color: Colors.teal,
                            borderRadius: BorderRadius.circular(AppDouble.d20),
                            boxShadow: [
                              BoxShadow(
                                  color:
                                      Colors.white.withOpacity(AppDouble.d0_15),
                                  blurRadius: AppDouble.d10),
                            ]),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(AppDouble.d20),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Image.network(
                            // 'https://picsum.photos/id/$i/800/1200',
                            widget.networkImagesList[i],
                            // ImageAssets.splash,
                            fit: BoxFit.cover,
                            // height: width * .67,
                            // width: width * .67,
                          ),
                        ),
                      ),
                    );
                    cards.add(customizableCard);
                  }
                  return Stack(children: cards);
                },
              ),
            ),
            Positioned.fill(
              child: PageView.builder(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                // itemCount: 11,
                itemCount: widget.networkImagesList.length,
                controller: pageController,
                itemBuilder: (context, index) {
                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
