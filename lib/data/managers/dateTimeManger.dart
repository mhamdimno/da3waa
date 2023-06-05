import 'package:da3wa/app/extentions/strings_extentions.dart';
import '../../app/my_res.dart';

class DateTimeManger {
  static const String  date_default_formatter = "EEEE, MMM d, yyyy HH:mm";
  static const String  with_day_month_name = "EEEE MMMM dd yyyy";
  static const String  date_only = "yyyy-MM-dd";

  static Future<DateTime?> chooseDate(String days) async{
    return await showDatePicker(
      context: Get.context!,
      initialDatePickerMode: DatePickerMode.day,
      initialDate: new DateTime.now(),
      firstDate: new DateTime.now().subtract(new Duration(days: 0)),
      lastDate: new DateTime.now().add(new Duration(days: days.toInt)),
      fieldHintText: "ssss",
      confirmText: AppStrings.confirm.toUpperCase(),
      builder: (_, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Get.theme.primaryColor,
            colorScheme: ColorScheme.light(primary: Get.theme.primaryColor),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child ?? CommonWidgetManager.emptyWidget,
        );
      },
    );
  }
}
