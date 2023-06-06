import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../app/my_res.dart';

class AppToasts{
  static _showToast(ToastType typ,String msg){
    showTopSnackBar(       Overlay.of(Get.context!),
        CustomSnackBar.info(message: msg));
  }

 static showError(String? msg,{bool showToast=true}) {
    if (msg != null && showToast) {
      showTopSnackBar(
       Overlay.of(Get.context!),
        CustomSnackBar.error(message: msg),
      );

    }
  }
  static showMessage(String? msg) {
    if (msg != null) {
      showTopSnackBar(
        Overlay.of(Get.context!),
        CustomSnackBar.success(message: msg),
      );
    }
  }

  static showInfo(String? msg) {
    if (msg != null) {
      _showToast(ToastType.other,msg);
    }
  }

}


