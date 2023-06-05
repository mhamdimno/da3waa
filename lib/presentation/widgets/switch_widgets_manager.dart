import 'package:flutter/cupertino.dart';

import '../../app/my_res.dart';

class SwitchManager{
 static customSwitch(ValueChanged<bool>? onChanged, bool? value) {
    return CupertinoSwitch(
      onChanged: onChanged,
      value: value ?? true,
      activeColor: Get.theme.primaryColor,
    );
  }
}

