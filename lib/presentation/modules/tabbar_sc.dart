

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../../../app/my_res.dart';


import '../widgets/app_widgets/tabbar/src/bottombar_view.dart';
import '../widgets/app_widgets/tabbar/src/bottom_bar.dart';
class tabbar_con extends BaseController {
}

class tabbarSC extends BaseView<tabbar_con>  {
  @override
  vBuilder() =>Scaffold(
      body: GetxBottomBarView(

      getPages: AppRouters,
      routes:  [

        AppRouters.dashboard_route,
        AppRouters.dashboard_route,
         ],
      defaultTransition: Transition.noTransition,
      backgroundColor: Colors.yellowAccent,
showActiveBackgroundColor: false,
      height: 70,
      itemPadding: EdgeInsets.zero,

      bottomBar: <GetBottomBarItem>[
        GetBottomBarItem(
            activeColor: Get.theme.primaryColor,
            icon:  Icon(CupertinoIcons.home),
            inactiveColor: Colors.transparent
        ),

  GetBottomBarItem(
      icon:  Icon(CupertinoIcons.person_2),
        activeColor: Get.theme.primaryColor,
        inactiveColor: Colors.transparent
  ),




      ],
  ),


    );






}
