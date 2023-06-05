import 'dart:io';

import 'package:da3wa/app/enums.dart';
import 'package:da3wa/app/extentions/numbers_extentions.dart';
import 'package:da3wa/app/my_res.dart';
import 'package:da3wa/presentation/resources/constants_manager.dart';
import 'package:da3wa/presentation/resources/values_manager.dart';

//common image
class AppImages {
 static String _assetName(String? name) =>  'assets/images/${name ?? "logo"}.png';
 static  Widget CustomImage(
    String? name,
    double? width, {
    Duration? duration,
    Duration? delay,
    double? height,
    AnimateType? animate_type,
    Color? color,
    bool isCircle = false,
    BoxFit? fit = BoxFit.fill,
  }) {
    double corner = isCircle ? width ?? 2 / 2 : 0;

    return Image.asset(
      _assetName(name),
      fit: fit!,
      width: width == null ? null : width,
      height: height == null ? null : height,
      color: color,
    ).setCornerRaduis(corner);
  }

  static AssetImage provider_image(String v) => AssetImage(_assetName(v));

 static Widget get logo => CustomImage("logo", AppSize.s100);
 static Widget get sort => CustomImage("sort", AppSize.s30);
 static Widget get dollar => CustomImage("dollar", AppSize.s30);
  static UnconstrainedBox icon(String v) {
   return UnconstrainedBox(
     child: CustomImage(
       v,
       AppSize.s30,
     ),
   );
 }

}
