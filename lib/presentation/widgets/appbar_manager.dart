import 'package:da3wa/app/extentions/numbers_extentions.dart';

import '../../app/my_res.dart';

class AppbarManager{

  static PreferredSizeWidget customAppBar(String? tit,
      {bool automaticallyImplyLeading = true,
        bool isTransparent = false,
        List<Widget>? actions,
        bool? clear_drawer,

        Widget? child,
        Widget? leading}) {
    return AppBar(
        centerTitle: true,
        automaticallyImplyLeading: automaticallyImplyLeading,
        actions: actions != null
            ? actions.map((e) => e.paddingSymmetric(horizontal: AppSize.s20)).toList()
            : null,
        leading: leading,
        iconTheme: IconThemeData(
          color: clear_drawer == true
              ? Get.theme.primaryColorLight
              : isTransparent
              ? Get.theme.primaryColor
              : Get.theme.primaryColorLight, //change your color here
        ),
        backgroundColor:
        Colors.orange,
        title: child ?? Text(tit == null ? "" : tit.tr.capitalize!));
  }
}