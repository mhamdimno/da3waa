import 'package:cross_connectivity/cross_connectivity.dart';
import 'package:flutter/material.dart';
import 'base_controller.dart';
export 'base_controller.dart';
import '../../../app/my_res.dart';

abstract class BaseView<T extends BaseController> extends StatelessWidget {
  const BaseView({Key? key}) : super(key: key);

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
