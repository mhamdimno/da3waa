

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

        getPages: AllPages.pages(),
      routes:  [

        AppRouters.dashboard_route,
        AppRouters.users,
         ],
      defaultTransition: Transition.noTransition,
      backgroundColor: Colors.white,
showActiveBackgroundColor: false,
      height: 70,
      itemPadding: EdgeInsets.zero,

      bottomBar: <GetBottomBarItem>[
        GetBottomBarItem(
            icon:  Icon(Icons.home),
            activeColor: ColorManager.primary,
            inactiveColor: Colors.grey
        ),

  GetBottomBarItem(
      icon:  Icon(Icons.person_2),
        activeColor: ColorManager.primary,
        inactiveColor: Colors.grey
  ),




      ],
  ),


    );






}
