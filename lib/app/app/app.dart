
import 'package:get/get.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:lifecycle_lite/life_navigator_observer.dart';
import 'package:da3wa/app/app/preapare_app.dart';
import 'package:da3wa/app/enums.dart';
import 'package:da3wa/app/extentions/dynamics_extentions.dart';
import 'package:da3wa/app/extentions/numbers_extentions.dart';
import 'package:da3wa/app/my_res.dart';
import 'package:sizer/sizer.dart';
import '../../presentation/resources/routes_manager.dart';
import '../../presentation/resources/theme_manager.dart';

class MyApp extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    setOriantions();
    return
      Sizer(
        builder: (context, orientation, deviceType) {

      return KeyboardDismissOnTap(
          child: GetMaterialApp(
            navigatorObservers: [
              LifeNavigatorObserver(),
            ],
            defaultTransition: Transition.fade,
            //smartManagement: SmartManagement.keepFactory,
            theme: Appthemes.theme(),
            themeMode: Appthemes().init(),
            transitionDuration: 0.4.toDuration,
            debugShowCheckedModeBanner: false,
            builder:initAppBuilder,

            getPages: AllPages.pages(),
            locale: Locale(ConstantType.en.toStringEnumKey),
            enableLog: false,
            initialRoute: AppRouters.splash_route,
          )
          );

        });
  }
}