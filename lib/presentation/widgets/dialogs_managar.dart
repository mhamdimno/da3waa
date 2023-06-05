import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:da3wa/app/extentions/numbers_extentions.dart';
import 'package:da3wa/app/my_res.dart';

import '../../app/functios.dart';

class DialogsManager{
  static showProgress() {
    EasyLoading.show();
    setDelay(() {
      DialogsManager.dismissProgress();
    }, seconds: 20);
  }
  static dismissProgress() {
    EasyLoading.dismiss();
  }

  static confirmAction(Function yes, {bool isDelete = true}) {
    return showDialog(
        context: Get.context!,
        barrierDismissible: false,
        barrierColor: Get.theme.primaryColorDark.withOpacity(0.75),
        builder: (BuildContext ctx) {
          return Dialog(
            backgroundColor: Get.theme.primaryColorLight,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.s8)), //this right here
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,

              children: <Widget>[
                // 30spaceVertical,
                // kImg(isDelete ? "dang" : "confirm", 46, 46,
                //     color: Get.theme.buttonColor),
                AppStrings.areyousure.toTextWidget("sb24m"),
                Container(

                  height: AppSize.s35,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // CustomButton(AppStrings.confirm, (){
                      //   Navigator.pop(ctx);
                      //
                      //   yes();
                      // },
                      //     bgColor: Get.theme.primaryColor,
                      //     //setVerticalPaddingding: 10,
                      //     fsize: AppSize.s18,
                      //     //  hPadding: 20,
                      //     corner: AppSize.s8)
                      //     .expanded,
                      // AppSize.s20.spaceHorizintal,
                      // CustomButton(AppStrings.cancel, () {
                      //   print(',,,,,,,,,,,,,,,,,,,,,,,,,,,,,');
                      //   Navigator.pop(ctx);
                      // },
                      //     bgColor: Get.theme.splashColor,
                      //     //setVerticalPaddingding: 10,
                      //     // hPadding: 20,
                      //     fsize: AppSize.s18,
                      //     corner: AppSize.s8)
                      //     .expanded,
                    ],
                  ),
                ),
              ],
            ).setSpaceBetweenChildrens(AppSize.s30).toCustomWidget(height: AppSize.s140,horizontalPadding: AppPadding.p20,no_alienment:true,            width: double.infinity,maxWidth: AppSize.web_main_container_width
            ),
          );
        });
  }
}

