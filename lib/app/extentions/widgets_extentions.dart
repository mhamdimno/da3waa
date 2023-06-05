import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:da3wa/app/extentions/dynamics_extentions.dart';
import 'package:da3wa/app/extentions/numbers_extentions.dart';
import 'package:da3wa/app/my_res.dart';
import 'package:da3wa/presentation/widgets/common_widget_manager.dart';

import '../../presentation/resources/assets_manager.dart';
import '../../presentation/resources/colors_manager.dart';
import '../../presentation/resources/values_manager.dart';
import '../enums.dart';


extension RowExtentions on Row {
  Row setSpaceBetweenChildrens(double sp) => this.children.isEmpty
      ? this
      : Row(
          mainAxisAlignment: mainAxisAlignment,
          crossAxisAlignment: crossAxisAlignment,
          children:
              this.children.map((e) => e.setHorizentalPadding(sp.dynamicHeight / 2)).toList());
}

extension ColumnExtentions on Column {
  Column setSpaceBetweenChildrens(double sp) => this.children.isEmpty
      ? this
      : Column(
          mainAxisAlignment: mainAxisAlignment,
          crossAxisAlignment: crossAxisAlignment,
          children:
              this.children.map((e) => e.setVerticalPadding(sp / 2)).toList());
}

extension WidgetsExtentions on Widget {
  Widget side_flip(bool flip) => Align(
      alignment: flip ? Alignment.centerRight : Alignment.centerLeft,
      child: this);

  Widget get setLeading => Align(alignment: Alignment.centerLeft, child: this);
  Widget get setTrailing =>
      Align(alignment: Alignment.centerRight, child: this);
  Widget get setCenter => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [CommonWidgetManager.emptyWidget, this, CommonWidgetManager.emptyWidget],
      );

  Widget addChild(Widget child, {AlignmentGeometry? alignment}) {
    return Stack(
        alignment: alignment ?? Alignment.center, children: [this, child]);
  }
  Widget get addPopUpDismissButton  =>
     Icon(Icons.highlight_remove,color: ColorManager.primary).addTapGesture(() {AppNavigation.pop();}).setTrailing.animate(AnimateType.slideInUp);
  


  Widget addTopChild(Widget? child, {double spacing = AppSize.s10}) {
    return child == null
        ? this
        : Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [child, this]).setSpaceBetweenChildrens(spacing);
  }

  Widget toScrollWidget({double? height}) {
    return SingleChildScrollView(
      child: Container(
        width:Get.width,
        height: height,
        child: this,
      ),
    );
  }
  Widget setHeight(double? h) => h.is_null || h==0.0  ? this:Container(
    height: h,
    child: this,
  );
  Widget setWidth(double w) => w.is_null || w==0.0 ? this:Container(
    width: w,
    child: this,
  );
  Widget get  is_not_support_web =>
      Visibility(visible: is_not_web, child: this);
  Widget maxWidth(double w) => w.is_null || w==0.0 ? this:ConstrainedBox(

    constraints: BoxConstraints(maxWidth: w),
    child: this,
  );

  Align setAlien(AlignmentGeometry value) => Align(
        child: this,
        alignment: value,
      );
  Widget get ToCustomWidgetNum => toCustomWidget(
      width: AppSize.s65,
      height: AppSize.s28,
      corner: AppSize.s2,
      backgroundColor: Get.theme.primaryColorLight);

  Widget toCustomWidgetPopUp(double? height) => this.toCustomWidget(
      height: height,
      width: Get.width * 0.9,
      maxWidth:AppSize.web_main_container_width,
      backgroundColor: Get.theme.primaryColorLight,
      corner: AppSize.s20).center
      .setCenter;

  Widget isHidden2(bool v,{double height = 0}) {
    return v ? height.spaceVertical:this;
  }
  Widget get al_side_if_web => is_web? setLeading:this;

  Widget toCustomWidget(
          {double? verticalPadding,
          double? horizontalPadding,
          double? corner,
            bool no_alienment=false,
            double? maxWidth,
            double? minWidth,

            double? height,
          String? background_image,
          AlignmentGeometry? alignment = Alignment.topCenter,
          double? width,
          bool has_gradient = false,
          double? borderWidth,
          Color? borderColor,
          Color? backgroundColor}) =>
      Container(
        alignment: no_alienment ? null: alignment,
         constraints: BoxConstraints(minWidth: minWidth  ?? 0  , maxWidth: maxWidth ?? Get.width),

            child: this
            .setVerticalPadding(
            verticalPadding)
            .setHorizentalPadding(horizontalPadding),
        width: width ?? null,
        height: height ?? null,
        decoration: BoxDecoration(
            //  boxShadow: [kShadow(e_shadow.none)],
            image: (has_gradient == false && background_image == null)
                ? null
                : DecorationImage(
                    image: AppImages.provider_image(has_gradient ? "bg_btn" : background_image!),
                    fit: BoxFit.fill,
                  ),
            borderRadius: BorderRadius.all(Radius.circular(
    corner ?? 0)),
            border: Border.all(
                width:  borderWidth ?? 1,
                color:borderColor ??
                        Colors
                            .transparent //                   <--- border width here
                ),
            color: backgroundColor ?? Colors.transparent),
      );
  ClipRRect setCornerRaduis(double value) =>
      ClipRRect(borderRadius: BorderRadius.circular(value), child: this);

  AbsorbPointer get disableWidget =>
      AbsorbPointer(absorbing: true, child: this);
  AbsorbPointer is_enable(bool value) =>
      AbsorbPointer(absorbing: !value, child: this);

  Widget setScale(double scale) => Transform.scale(scale: scale, child: this);

  Widget addTapGesture(GestureTapCallback onTap, {bool disable = false}) {
    return disable
        ? this
        : GestureDetector(
      onTap: (){
        if(isRedundentClick(DateTime.now())){
          print('hold on, processing');
          return;
        }
        onTap();
      },
            child: this,
          );
  }

  Widget setHorizentalPadding(double? value) {
    return value == null
        ? this
        : Padding(
            padding: EdgeInsets.symmetric(horizontal: value),
            child: this,
          );
  }

  Widget setVerticalPadding(double? value) {
    return value == null
        ? this
        : Padding(
            padding: EdgeInsets.symmetric(vertical: value),
            child: this,
          );
  }

  Widget setTopPadding(double? value) {
    return value == null
        ? this
        : Padding(
            padding: EdgeInsets.only(top: value),
            child: this,
          );
  }

  Widget setPadding(double? value) {
    return value == null
        ? this
        : Padding(
            padding: EdgeInsets.all(value),
            child: this,
          );
  }

  Widget get flip => Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(pi),
        child: this,
      );
  Widget get center => Center(child: this);
  Widget get expanded => Expanded(child: this);
  Widget is_expanded(bool? value) =>
      value == true ? Expanded(child: this) : this;

  Widget isHidden(bool value) {
    return Visibility(visible: value == null ? false : !value, child: this);
  }

  Widget moveTop(double? value) {
    return value == null
        ? this
        : Transform.translate(offset: Offset(0, -value.dynamicHeight), child: this);
  }

  Widget moveLeft(double? value) {
    return value == null
        ? this
        : Transform.translate(offset: Offset(-value.dynamicWidth, 0), child: this);
  }

  Widget moveRight(double? value) {
    return value == null
        ? this
        : Transform.translate(offset: Offset(value.dynamicWidth, 0), child: this);
  }

  Widget setAlpha(double value) {
    return Opacity(
      opacity: value,
      child: this,
    );
  }

  Widget moveBottom(double value) {
    return Transform.translate(offset: Offset(0, value), child: this);
  }

  Widget w_scrool({double? height}) {
    return SingleChildScrollView(

      child: SizedBox(

        width: Get.width,
        height: height,
        child: this,
      ),
    );
  }


}
