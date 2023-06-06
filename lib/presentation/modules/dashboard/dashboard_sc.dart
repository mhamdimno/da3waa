
import 'package:da3wa/presentation/modules/dashboard/drawer.dart';
import 'package:da3wa/presentation/widgets/list_manager.dart';
import 'package:firestore_model/firestore_model.dart';
import 'package:flutter/foundation.dart';

import '../../../app/my_res.dart';

import '../../../data/managers/firebase.dart';
import '../../../domain/remote/cat.dart';
import '../../../domain/remote/user.dart';
import 'dashboard_con.dart';


class DashboardSC extends BaseView<DashboardController> {
  @override
  Widget vBuilder() =>  AppScaffold(

        screenType: ScreensType.dashboard,
       has_drawer: true,
       isTransparent: true,
      // key: DrawerManager.scaffoldKey,
        children:[
  Row(
     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Row(
        children: [
          AppImages.dollar
,
          FutureBuilder<User?>(
            future: FBManager.user, // async work
            builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting: return Text('Loading....');
                default:
                  if (snapshot.hasError)
                    return Text('Error: ${snapshot.error}');
                  else
                    return snapshot.data?.points?.toString().toTextWidget("b16_cnl") ?? nl;
              }
            },
          ),

        ],
      ).setSpaceBetweenChildrens(8),
      Row(
        children: [
          AppImages.sort,
          arrange.value.toString().toString().toTextWidget("b16_cnl")
        ],
      ).setSpaceBetweenChildrens(8),
  ]),

  ModelGetBuilder<Cat>(
// you're query to get results
  builder: (_, snapshot) {

return       ListManager.CustomGridView(list: snapshot.data, crossAxisCount: 4, spacing: AppSize.s20, builder:(index){
  Cat? cat =  snapshot.data?[index];
  return Column(
    children: [
      //    category.image,
      cat?.name.toTextWidget('r40') ?? nl,
      cat?.desc.toTextWidget('r16cn') ?? nl,
      AppStrings.toPoint(cat?.points).toTextWidget("r14g"),


    ],
  ).toCustomWidget(backgroundColor: Get.theme.hintColor,corner: AppCorner.s20,horizontalPadding: 12).addTapGesture(() {
    FBManager.increasePoints(cat?.points ?? 0);
  });
} )
;
  })


 ] );



}
