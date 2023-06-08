import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:da3wa/app/extentions/numbers_extentions.dart';
import 'package:da3wa/app/extentions/strings_extentions.dart';

import 'package:da3wa/app/my_res.dart';
import 'package:da3wa/presentation/resources/colors_manager.dart';


AutoSizeText CustomText(
  String? txt,
  double? size, {
  Color? color,
  TextAlign? align,
  String? fontFamily,
  int? maxLines,
  double? height,
      double? letterSpace,
  bool? selected,
}) {
  return AutoSizeText(

      txt.isNullOrEmpty
          ? ""
          : txt.is_uppercase || txt!.contains("\n")
          ? txt!.replaceAll("null", "").trim()
          : txt.replaceAll("null", "").capitalize!.trim(),
      minFontSize: AppSize.s6,
      textAlign: align ?? TextAlign.start,
      maxLines: maxLines ?? null,
      style: TextStyle(
          fontSize: size?.toDouble().dynamicWidth ?? AppSize.s16,
          fontFamily: fontFamily ?? "r",
          height: height ?? 1.5,
          letterSpacing: letterSpace ?? 1,

          color: selected == null
              ? color ?? Get.theme.primaryColorDark
              : selected
                  ? Get.theme.primaryColorLight
                  : Get.theme.primaryColorDark));
}

extension text_optianlExtentions on String? {
  AutoSizeText toTextWidget(String v,{Color? textColor}) {
    int? max_lines;
    if (v.contains("l_")) {
      String delimiter = 'l_';
      int lastIndex = v.indexOf(delimiter);
      String trimmed = v.substring(0, lastIndex);
      max_lines = v.replaceAll(trimmed, "").replaceAll("l_", "").toIntOptinal;
    }
    var list= v.characters
        .where((v) => v.toDoubleOptinal != null)
        .toList();
    if (max_lines != null) {
      list.removeLast();
    }
    double font_size = list
        .join("")
        .toDoubleOptinal ?? 16.0;
    String font_family = v.characters.first;
    Color font_color =  Get.theme.primaryColorDark;
    switch (v.replaceAll("cn", "").characters.last) {
      case "m":
        font_color = Get.theme.primaryColor;
        break;
      case "d":
        font_color = Get.theme.primaryColorDark;
        break;
      case "l":
        font_color = Get.theme.primaryColorLight;
        break;
      case "t":
        font_color = Get.theme.splashColor;
        break;


      case "s":
        font_color = Colors.transparent;
        break;

      default:
        font_color = Colors.black;

    }
    return CustomText(this, font_size,
        fontFamily: font_family,
        color: textColor ?? font_color,
        align: v.contains("cn") == true ? TextAlign.center : null,
        maxLines: max_lines);
  }
}
