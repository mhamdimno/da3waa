import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:da3wa/app/extentions/lists_extentions.dart';
import 'package:da3wa/app/extentions/numbers_extentions.dart';

import '../../app/my_res.dart';

class ListManager{
  static Widget CustomGridView({
    required List? list,
    required int crossAxisCount,
    required double spacing,
    required Widget Function(  int index) builder,
    String? emptyString,
    bool isStatic = true,
    bool isHorizintal = false,
    bool reverse = false,
    double? childAspectRatio,
    Widget? emptyChild
  }) {
    return list.isNullOrEmpty
        ? emptyChild ?? CommonWidgetManager.emptyWidget
        :
    StaggeredGridView.countBuilder(

      //count: count,
      crossAxisCount: crossAxisCount,
      mainAxisSpacing: spacing,
      crossAxisSpacing: spacing,
      itemBuilder: (_,index){
        return builder(index);
      },
      reverse: reverse,
      physics:
      isStatic && !isHorizintal ? NeverScrollableScrollPhysics() : null,
      shrinkWrap: isStatic ? true : false,
      scrollDirection: isHorizintal ? Axis.horizontal : Axis.vertical,
      itemCount: list?.length ?? 0,
      staggeredTileBuilder: (int index) => new StaggeredTile.fit(2),


    );
  }



  static Widget CustomListView(
      {required List? list,
        required  Widget Function( int index) child,
        String? empty_data_string,
        bool isStatic = true,
        ScrollController? con,
        Widget? seperator,
        bool isHorizintal = false,
        bool reverse = false,
        double space = 0,
        Widget? emptyChild,
      }) {

    ListView  listView = ListView.separated(
        controller: con,
        reverse: reverse,
        separatorBuilder: (_, i) {
          return seperator ?? space.spaceVertical;
        },
        physics: isStatic && !isHorizintal
            ? NeverScrollableScrollPhysics()
            : ClampingScrollPhysics(),
        shrinkWrap: isStatic ? true : false,
        itemCount: list?.length ?? 0,
        scrollDirection: isHorizintal ? Axis.horizontal : Axis.vertical,
        itemBuilder: (_,index){
          return child(index).animate(isHorizintal ? AnimateType.fadeInRight:AnimateType.fadeInUp);
        });
    return list.isNullOrEmpty
        ? emptyChild ?? CommonWidgetManager.emptyWidget

    :  ConstrainedBox(
        constraints: BoxConstraints(minHeight: list.isNullOrEmpty ? Get.height*0.8:AppSize.s40),
        child
            : listView);

    // ]);
  }

  static Widget emptyContents({String? txt, bool isFullText = false}) {
    return SizedBox();
    // return CommonWidgetManager.customWrap(children:
    // [
    //   AppImages.empty_package,
    //   AppStrings.packages.toTextWidget("sb24m"),
    //   AppStrings.youcurrentlydo.toTextWidget("l18")
    //
    // ]);
  }
}