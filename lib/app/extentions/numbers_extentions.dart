import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../presentation/resources/values_manager.dart';
import '../functios.dart';

extension intExtetntions on int {

  Duration get toDuration => Duration(seconds: this);

  double get dynamicHeight =>
      Get.height * (this / AppSize.referenceScreenHeight);

  double get dynamicWidth => Get.width * (this / AppSize.referenceScreenWidth);


  SizedBox get spaceHorizintal => SizedBox(
        width: toDouble(),
      );
  SizedBox get spaceVertical => SizedBox(height: toDouble());


}

extension doubleExtetntions on double {
  double if_web(double v)=>is_web ? v:this;

  double if_tablet(double v)=> SizerUtil.deviceType == DeviceType.tablet ? v:this;

  double f_with_ipad( double phone,double ipad){
    return is_web ? ipad: SizerUtil.deviceType == DeviceType.tablet ? ipad:phone;
  }

  Duration get toDuration => Duration(milliseconds: (this * 1000).toInt());

  double get dynamicHeight =>
      Get.height * (this / AppSize.referenceScreenHeight);

  double get dynamicWidth => (is_web || is_tablet) ? this*1.1: Get.width * (this / AppSize.referenceScreenWidth);


  SizedBox get spaceHorizintal => SizedBox(
        width: this,
      );
  SizedBox get spaceVertical => SizedBox(height: this);
// ···
}

extension NonNullInteger on int? {
  int orZero() {
    if (this == null) {
      return 0;
    } else {
      return this!;
    }
  }
}
