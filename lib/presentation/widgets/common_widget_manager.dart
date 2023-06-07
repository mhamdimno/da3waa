
import 'package:da3wa/app/extentions/numbers_extentions.dart';
import 'package:delayed_display/delayed_display.dart';

import '../../app/my_res.dart';

class CommonWidgetManager{
 static   Widget  emptyWidget = const SizedBox();

 static Widget container_commont(List<Widget> children, Color? bg) {
    return Container(
        decoration: common_decorarion(cor: AppSize.s6, bg: bg),
        child: CommonWidgetManager.customWrap(
          children: children,
          spacing: 10,
        ));
  }
  static BoxDecoration common_decorarion(
      {Color? bg, double? br, double? bw, double? cor, Color? bc}) =>
      BoxDecoration(
        color: bg ?? Get.theme.primaryColorLight,
        borderRadius: BorderRadius.all(Radius.circular(cor ?? AppSize.s6)),
        border: Border.all(
            width: bw ?? 1,
            color: bc ??
                Colors.transparent //                   <--- border width here
        ),
      );

static Column customWrap(
    {required List<Widget>? children,
      double? spacing = AppSize.s2,
      bool isCenter = false}) {
  return Column(
      children:
      children!.map((e) => e.setVerticalPadding(spacing! / 2)).toList());
}




static Widget get line => Container(
   height: 1,
   color: Get.theme.splashColor,
 );

 static noIntenetWidget()=> Scaffold(
     backgroundColor: Get.theme.secondaryHeaderColor,
     body:  DelayedDisplay(
       delay: 1.5.toDuration,
       child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [
             AppImages.logo,
             AppStrings.noNetWork.toTextWidget("b20y"),
           ]).center,
     ));


}