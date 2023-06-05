import 'package:da3wa/presentation/resources/colors_manager.dart';

import '../../app/my_res.dart';

/// Created by daewubintara on
/// 08, September 2020 16.17

class Appthemes {
  static final ThemeData _lightTheme = ThemeData(
      fontFamily: "r",
      hintColor: ColorManager.hint,
      primaryColor: ColorManager.primary,
      scaffoldBackgroundColor: ColorManager.light,
      secondaryHeaderColor: ColorManager.helper,
      backgroundColor: ColorManager.light,
      primaryColorDark: ColorManager.dark,
      primaryColorLight: ColorManager.light,
      //cardColor: text_grey,

      disabledColor: ColorManager.disabled,
      splashColor: ColorManager.splash,
      appBarTheme: AppBarTheme(
          centerTitle: true,
          titleTextStyle: TextStyle(
              fontFamily: "r", fontSize: AppSize.s16, color: ColorManager.light),
          color: ColorManager.primary,
          iconTheme: IconThemeData(color: ColorManager.primary),
          elevation: 0),

      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(fontFamily: "r"),
      ));


  /// LIGHT THEME
  static ThemeData theme() {
    return _lightTheme;
  }

  ThemeMode init() {
    return ThemeMode.light;
  }

  void changeThemeMode(ThemeMode themeMode) {
    Get.changeThemeMode(themeMode);
    Get.rootController.themeMode.reactive;
  }

  ThemeData general() {
    return _lightTheme;
  }
}
