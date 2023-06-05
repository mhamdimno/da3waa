
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

          ModelStreamSingleBuilder<User>(
// you're query to stream first result
          query: (q) => q.orderBy('points'),
// pass document id if you need to stream only dis document
          docId: AppStorage.uuid,
          onLoading: ()=>nl,
          onError: (_)=>nl,
          builder: (_, snapshot) {
          return   snapshot.data?.points?.toString().toTextWidget("b16_cnl") ?? nl;

          }),
        ],
      ).setSpaceBetweenChildrens(8),
      Row(
        children: [
          AppImages.sort,
          arrange.value.toString().toString().toTextWidget("b16_cnl")
        ],
      ).setSpaceBetweenChildrens(8),
  ]),



      ListManager.CustomGridView(list: con.arrCats, crossAxisCount: 4, spacing: AppSize.s20, builder:(index){
        Cat? cat = con.arrCats[index];
                return Column(
                  children: [
                //    category.image,
                    cat?.name.toTextWidget('r40') ?? nl,
                    cat?.desc.toTextWidget('r16cn') ?? nl,
        AppStrings.toPoint(cat?.points).toTextWidget("r14g"),


        ],
                ).toCustomWidget(backgroundColor: Get.theme.hintColor,corner: AppCorner.s20,horizontalPadding: 12).addTapGesture(() {
                  FBManager.increasePoints(points: cat?.points ?? 0);
                });
      } )

 ] );



}
