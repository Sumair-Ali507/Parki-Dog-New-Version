// import 'package:parki_dog/core/shared_widgets/app_loading_widget.dart';
// import 'package:parki_dog/core/shared_widgets/empty_error_widget.dart';
// import 'package:parki_dog/core/shared_widgets/error_widget.dart';
// import 'package:parki_dog/core/shared_widgets/shimmer_loading_parser.dart';
// import 'package:parki_dog/core/utils/custom_types.dart';
// import 'package:parki_dog/core/utils/enum.dart';
// import 'package:parki_dog/generated/locale_keys.g.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
//
// class PaginatedListView<T> extends StatefulWidget {
//   final PagingController<int, T> pagingController;
//   final WidgetItemBuilder<T> itemBuilder;
//   final ViewOrientation viewOrientation;
//   final double cellAspectRatio;
//   final double cellWidth;
//   final Widget? emptyViewIconData;
//   final String? emptyViewTitle;
//   final String? emptyViewDescription;
//   final String? emptyViewButtonTxt;
//   final ValueGetter<Future<bool>>? emptyViewButtonClickListener;
//   final bool isShimmerLoading;
//   final double shimmerItemsRadius;
//   final double shimmerAllPadding;
//   final double shimmerItemsMargin;
//   final Axis shimmerItemsScrollDirection;
//   final Color shimmerBaseColor;
//   final Color shimmerHighlightColor;
//   final EdgeInsets? padding;
//   final int crossAxisCount;
//   final double crossAxisSpacing;
//   final double mainAxisSpacing;
//
//   const PaginatedListView({
//     required this.pagingController,
//     required this.itemBuilder,
//     this.viewOrientation = ViewOrientation.orientationVertical,
//     this.cellAspectRatio = 1,
//     this.cellWidth = 200,
//     this.emptyViewIconData,
//     this.emptyViewTitle,
//     this.emptyViewDescription,
//     this.emptyViewButtonTxt,
//     this.emptyViewButtonClickListener,
//     this.padding,
//     this.isShimmerLoading = false,
//     this.shimmerItemsRadius = 8,
//     this.shimmerAllPadding = 0,
//     this.shimmerItemsMargin = 8,
//     this.shimmerItemsScrollDirection = Axis.vertical,
//     this.shimmerBaseColor = Colors.grey,
//     this.shimmerHighlightColor = Colors.white,
//     this.crossAxisCount = 2,
//     this.crossAxisSpacing = 5,
//     this.mainAxisSpacing = 5,
//     super.key,
//   });
//
//   @override
//   State<PaginatedListView> createState() => _PaginatedListViewState<T>();
// }
//
// class _PaginatedListViewState<T> extends State<PaginatedListView<T>> {
//   late PagingController<int, T> _pagingController;
//
//   @override
//   void initState() {
//     _pagingController = widget.pagingController;
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var cellHeight = widget.cellWidth / widget.cellAspectRatio;
//
//     var pagedChildBuilderDelegate = PagedChildBuilderDelegate<T>(
//       itemBuilder: (context, item, index) =>
//           _itemBuilder(item, index, cellHeight),
//       firstPageErrorIndicatorBuilder: (_) => _buildErrorView(),
//       firstPageProgressIndicatorBuilder: (_) =>
//           _buildLoadingView(isShimmer: widget.isShimmerLoading),
//       noItemsFoundIndicatorBuilder: (_) => _buildEmptyView(),
//       newPageProgressIndicatorBuilder: (_) => const AppLoadingWidget(),
//       newPageErrorIndicatorBuilder: (_) => Container(),
//     );
//     return widget.viewOrientation == ViewOrientation.orientationGrid
//         ? PagedGridView<int, T>(
//       padding: widget.padding,
//             showNewPageProgressIndicatorAsGridChild: false,
//             showNewPageErrorIndicatorAsGridChild: false,
//             showNoMoreItemsIndicatorAsGridChild: false,
//             pagingController: _pagingController,
//             builderDelegate: pagedChildBuilderDelegate,
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: widget.crossAxisCount,
//               crossAxisSpacing: widget.crossAxisSpacing.h,
//               mainAxisSpacing: widget.mainAxisSpacing.h,
//               childAspectRatio: widget.cellAspectRatio,
//             ))
//         : SizedBox(
//             height:
//                 widget.viewOrientation == ViewOrientation.orientationHorizontal
//                     ? cellHeight
//                     : double.infinity,
//             child: PagedListView<int, T>(
//               padding: widget.padding,
//                 scrollDirection: widget.viewOrientation ==
//                         ViewOrientation.orientationHorizontal
//                     ? Axis.horizontal
//                     : Axis.vertical,
//                 pagingController: _pagingController,
//                 builderDelegate: pagedChildBuilderDelegate),
//           );
//   }
//
//   _itemBuilder(T item, int index, double cellHeight) {
//     return widget.viewOrientation == ViewOrientation.orientationGrid
//         ? widget.itemBuilder(item, index)
//         : Container(
//             width: widget.cellWidth,
//             height: cellHeight,
//             padding: EdgeInsets.symmetric(
//               vertical: 5.h,
//             ),
//             child: widget.itemBuilder(item, index),
//           );
//   }
//
//   _buildEmptyView() {
//     return EmptyErrorWidget(
//       title: widget.emptyViewTitle ?? LocaleKeys.paginatedListView_noDataFound,
//       description: widget.emptyViewDescription ?? LocaleKeys.paginatedListView_tryRefreshPage,
//       hasButton: true,
//       buttonTxt: widget.emptyViewButtonTxt ?? LocaleKeys.paginatedListView_tryAgain,
//       buttonClickListener: widget.emptyViewButtonClickListener,
//     );
//   }
//
//   _buildErrorView() {
//     return AppErrorWidget(
//       description: _pagingController.error ?? LocaleKeys.paginatedListView_somethingWentWrong,
//       hasButton: true,
//       buttonTxt: LocaleKeys.paginatedListView_tryAgain,
//       buttonClickListener: widget.emptyViewButtonClickListener,
//     );
//   }
//
//   _buildLoadingView({bool isShimmer = false}) {
//     // return const ;
//     return isShimmer
//         ? ShimmerLoadingParser(
//             orientation: widget.viewOrientation,
//             cellWidth: widget.cellWidth,
//             cellAspectRatio: widget.cellAspectRatio,
//             radius: widget.shimmerItemsRadius,
//             baseColor: widget.shimmerBaseColor,
//             highlightColor: widget.shimmerHighlightColor,
//             margin: widget.shimmerItemsMargin,
//             scrollDirection: widget.shimmerItemsScrollDirection,
//             padding: widget.shimmerAllPadding,
//           )
//         : const AppLoadingWidget();
//   }
// }
