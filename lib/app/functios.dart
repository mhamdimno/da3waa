import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:da3wa/app/extentions/strings_extentions.dart';
import 'package:da3wa/presentation/resources/constants_manager.dart';
import 'package:sizer/sizer.dart';

import 'my_res.dart';






DateTime? loginClickTime;

bool isRedundentClick(DateTime currentTime) {
  if (loginClickTime == null) {
    loginClickTime = currentTime;
    print("first click");
    return false;
  }
  if (currentTime.difference(loginClickTime!).inMilliseconds < 400) {
    //set this difference time in seconds
    return true;
  }

  loginClickTime = currentTime;
  return false;
}



String get generateRandomNumber => Random().nextInt(100000).toString();

setDelay(Function cb, {int? seconds}) {
  Future.delayed(Duration(seconds: seconds ?? AppConstants.splashDelay), () {
    cb();
  });
}

setDelayMilliseconds(Function cb, {int milliseconds = 200}) {
  Future.delayed(Duration(milliseconds: milliseconds), () {
    cb();
  });
}

bool get is_not_web=>!kIsWeb;
bool get is_web=>kIsWeb;
bool get is_tablet => SizerUtil.deviceType == DeviceType.tablet ;
