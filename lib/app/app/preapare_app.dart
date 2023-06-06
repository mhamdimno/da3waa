import 'dart:io';

import 'package:da3wa/data/managers/devive_manager.dart';
import 'package:da3wa/data/managers/firebase.dart';
import 'package:firestore_model/firestore_model.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_storage/get_storage.dart';
import 'package:da3wa/data/managers/push_notification_manager.dart';

import '../../presentation/resources/colors_manager.dart';
import '../../presentation/resources/theme_manager.dart';
import '../my_res.dart';
Future prepareApp() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();
  await DeviceManager.init();
  await FBManager.init();
  Appthemes().changeThemeMode(ThemeMode.light);

  _configLoading();
  makeServiceSettings();

}

makeServiceSettings() {


}


void _configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(seconds: 1)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = AppSize.s40
    ..radius = AppSize.s10
    ..progressColor = ColorManager.hint
    ..backgroundColor = ColorManager.light
    ..indicatorColor = ColorManager.primary
    ..textColor = ColorManager.primary
    ..maskColor = ColorManager.light.withOpacity(0.0)
  //..backgroundColor = Colors.transparent
    ..maskType = EasyLoadingMaskType.custom;

  // ..userInteractions = true
  // ..dismissOnTap = false
  //..customAnimation = CustomAnimation();
}

setOriantions() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

 TransitionBuilder? get  initAppBuilder=>(context, child) {
   child = EasyLoading.init()(context,child);
   return child;

 };
