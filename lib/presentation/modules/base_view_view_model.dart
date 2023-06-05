import 'package:cross_connectivity/cross_connectivity.dart';
import 'package:flutter/material.dart';
import 'package:lifecycle_lite/lifecycle_mixin.dart';
import 'base_controller.dart';
export 'base_controller.dart';
import '../../../app/my_res.dart';

abstract class BaseView<T extends BaseController> extends StatelessWidget with LifecycleStatelessMixin {
  const BaseView({Key? key}) : super(key: key);
  @override
  void whenHide() {
    setDelayMilliseconds(()=> isInSameScreen.value = true,milliseconds: 600);

    con.whenHide();
  }

  @override
  void whenShow() {
    setDelayMilliseconds(()=> isInSameScreen.value = true,milliseconds: 600);

    con.whenShow();
  }
  T get con => GetInstance().find<T>();

  @override
  Widget build(BuildContext context) {
    return

      ConnectivityBuilder(
          builder: (context, isConnected, status) =>      isConnected==true ?    GetBuilder<T>(
          builder: (con) {
            return vBuilder();
          },
        ):  GetBuilder<T>(
    builder: (con) {

    return CommonWidgetManager.noIntenetWidget();


    },
    ));
  }

  Widget vBuilder();

}
