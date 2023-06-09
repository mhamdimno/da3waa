import 'package:da3wa/app/extentions/bools_extentions.dart';
import 'package:da3wa/app/extentions/numbers_extentions.dart';

import '../../app/my_res.dart';
import '../../domain/model/DropDown.dart';

Widget CustomTextField(
    TextEditingController? con,
    {
      String? txt,
      String? hint,
      String? popid,
      String? fontFamily,
      String? prefexImg,
      String? suffixImg,
      String? suffixText,
      Widget? suffix,
      double? height,
      double? width,
      double? fontSize,
      double? padding,
      double? corner,
      double? borderwidth,
      Color? bgColor,
      Color? inputColor,
      Color? borderColor,
      bool isCenter = false,
      bool secureText = false,
      ValueChanged<String>? onFieldSubmitted,
      ValueChanged<String>? onChange,
      bool = false,
      bool isRequiredPopId = false,
      bool multiLine = false,
      TextInputType? type,
      DropdownType? popType,
      Function(DropDownModel? v)? onTap,

      InputType tf_type = InputType.normal,
      Function(mgeneral? obj)? cp_pop,
    }) {
  double type_height = tf_type == InputType.underline ? 40 : tf_type == InputType.border
      ? AppSize.s56
      : tf_type == InputType.desc
      ? AppSize.s120.dynamicHeight
      : AppSize.s48;
  double type_start_padding =  tf_type == InputType.underline ? 0 :tf_type == InputType.border
      ? AppSize.s20
      : tf_type == InputType.desc
      ? AppSize.s20
      : AppSize.s20;
  double  type_font_size = tf_type == InputType.border
      ? AppSize.s16
      : tf_type == InputType.desc
      ? AppSize.s14
      : AppSize.s16;
  String  type_font_family = fontFamily ?? "r";
  double type_corner = corner ?? AppSize.s8;

  Color input_background_color = tf_type == InputType.underline ? Get.theme.primaryColorLight: tf_type == InputType.border
      ? Get.theme.primaryColorLight
      : tf_type == InputType.desc
      ? Get.theme.primaryColorLight
      : Get.theme.hintColor;
  Color  type_inputColor = tf_type == InputType.border
      ? Get.theme.primaryColorDark
      : tf_type == InputType.desc
      ? Get.theme.primaryColorDark
      : Get.theme.splashColor;
  Color  type_borderColor = tf_type == InputType.border ?  Get.theme.splashColor: tf_type == InputType.border
      ? Get.theme.disabledColor
      : tf_type == InputType.desc
      ? Get.theme.primaryColorLight
      : Get.theme.hintColor;
  Color  type_underlineColor = tf_type == InputType.underline ?  Get.theme.splashColor: Colors.transparent;
  double  type_borderwidth = borderwidth ?? 0;
  return Theme(
    child: Container(
      height: height ?? type_height,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(type_corner)),
          color: bgColor ?? input_background_color),
      child: TextFormField(
        onFieldSubmitted:onFieldSubmitted,
        onChanged: onChange,
        controller: con,
        // maxLength: maxLength,
        //  maxLines: null,
        obscureText: secureText,
        keyboardType: type == null
            ? multiLine
            ? TextInputType.multiline
            : TextInputType.name
            : type,
        textAlign: isCenter ? TextAlign.center : TextAlign.start,
        maxLines: multiLine ? null : 1,
        initialValue: txt,
        cursorColor: Get.theme.secondaryHeaderColor,

        style: TextStyle(
            fontSize: fontSize ??  type_font_size,
            fontFamily:  type_font_family,

            color: Get.theme.primaryColorDark),
        decoration: InputDecoration(
            label:  tf_type == InputType.border ? "${hint}".toTextWidget("r20t") : null,
            prefixIcon: prefexImg == null ? null : AppImages.icon(prefexImg),
            suffixIcon: suffixImg == null ? null : AppImages.icon(suffixImg),
            suffix: suffix,
            suffixText: suffixText,
            suffixStyle: TextStyle(
                fontSize: AppSize.s24, fontFamily: "sb", color: Get.theme.primaryColor),
            filled: true,
            fillColor: bgColor ?? input_background_color,

            // focusColor: kColors.bgColor,
            hintText: hint == null ? null : hint.tr.capitalize,
            hintStyle: TextStyle(
                fontSize:  type_font_size,
                fontFamily:  type_font_family,
                color: inputColor ?? type_inputColor),
            //  border: InputBorder.none,
            enabledBorder: tf_type == InputType.underline ?
            UnderlineInputBorder(
              borderSide: BorderSide(color: type_underlineColor),
            )
                :OutlineInputBorder(
                borderRadius: BorderRadius.circular(type_corner),
                borderSide: BorderSide(
                    color: borderColor ?? type_borderColor,
                    width: borderwidth ?? type_borderwidth)),

            focusedBorder:  tf_type == InputType.underline ? UnderlineInputBorder(
              borderSide: BorderSide(color: type_underlineColor),
            ):OutlineInputBorder(
                borderRadius: BorderRadius.circular(type_corner),
                borderSide: BorderSide(
                    color: borderColor ?? type_borderColor,
                    width: borderwidth ?? type_borderwidth)),

            border: tf_type == InputType.underline ? UnderlineInputBorder(
              borderSide: BorderSide(color: type_underlineColor),
            ):null,


            contentPadding: tf_type == InputType.border ? null: EdgeInsets.symmetric(horizontal: padding ?? type_start_padding,vertical: suffix==null ? 0:12
            )
        ),
      ),
    ).is_enable(popType==null),
    data: Get.theme.copyWith(
      hintColor: Get.theme.primaryColor,
      disabledColor: input_background_color,
    ),
  ).addTapGesture(() async{
    if (popType != null) {
      DropDownModel? v = await AppNavigation.choose_from_drop_down(popType, popid: popid);
      if (onTap != null) {
        onTap(v);
      }
    } else {
      onTap!(null);
    }

  });
}

