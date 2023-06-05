import 'package:da3wa/app/extentions/dynamics_extentions.dart';
import 'package:da3wa/app/extentions/strings_extentions.dart';

import '../domain/model/DropDown.dart';
import '../presentation/modules/dashboard/dashboard_con.dart';
import 'my_res.dart';

class AppNavigation {
  static Future<dynamic> toRoute(String route, {arguments}) async {
    isInSameScreen.value = false;

    return await Get.toNamed(
      route,
      arguments: arguments,
    );
  }
  static Future<DropDownModel?> choose_from_drop_down(DropdownType typ,
      {String? popid, List<DropDownModel>? arrPops}) async {
    // return await _presentScreen(dropdown_sc(typ, popid ?? "", arrPops: arrPops),
    //     isDismissible: true);
  }
  static get pop_up_transition => Transition.zoom;

  // static Future<dynamic> _presentScreen(Widget screen,
  //     { double? height, isDismissible = true}) {
  //   isInSameScreen.value = false;
  //
  //   // return showBarModalBottomSheet(
  //   //     isDismissible: isDismissible,
  //   //     useRootNavigator: true,
  //   //     duration: Duration(milliseconds: 500),
  //   //     bounce: true,
  //   //     expand: false,
  //   //     context: Get.context!,
  //   //     builder: (context) => Container(
  //   //         width: double.infinity, height: height ?? AppSize.dropdown_sc_height , child: screen));
  // }
  static void checkScreen() {
    toRouteScreen(AppNavigation.which_router);
  }
  static void ToRouteScreen() {
    setRootScreen(which_router);
  }

  static  String get which_router=>
      AppRouters.dashboard_route;


  static backWithCallBack({result}) {
    isInSameScreen.value = false;

    Get.back(result: result);
  }

  static backUntilRoute(String page) {
    isInSameScreen.value = false;

    Get.offNamedUntil(page, (route) => false);
  }

  static pop({int? pops_number, obj}) {
    isInSameScreen.value = false;

    if (pops_number != null) {
      int count = 0;
      Navigator.of(Get.context!).popUntil((_) => count++ >= pops_number);
    } else {
      Get.back();
    }
  }

  static popWithUpdate() {
    isInSameScreen.value = true;

    Get.back(result: true);
  }

  static toRouteScreen(String route) {
    isInSameScreen.value = false;
    Get.offAllNamed(route);
  }
  static popToRoute(String route)  {
    Get.off(AppRouters.dashboard_route);      //rt.goToHomeDuoToNofictionTapToShowUpdatePackageApi();
  }
  static setRootScreen(String page) {
    isInSameScreen.value = false;

    Get.offAndToNamed(page);
  }

  static toScreen(Widget w) {
    isInSameScreen.value = false;

    Get.to(w);
  }


}

