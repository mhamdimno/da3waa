
import 'package:confirmation_success/confirmation_success.dart';
import 'package:da3wa/presentation/modules/dashboard/drawer.dart';
import 'package:da3wa/presentation/widgets/list_manager.dart';
import 'package:firestore_model/firestore_model.dart';
import 'package:flutter/foundation.dart';

import '../../../app/my_res.dart';

import '../../../data/managers/firebase.dart';
import '../../../domain/remote/cat.dart';
import '../../../domain/remote/user.dart';
import 'user_con.dart';


class users_sc extends BaseView<user_con> {
  @override
  Widget vBuilder() =>  AppScaffold(
appbarText: "الترتيب",
        screenType: ScreensType.dashboard,
       isTransparent: true,
      // key: DrawerManager.scaffoldKey,
        children:[

  ModelGetBuilder<User>(
// you're query to get results

  builder: (_, snapshot) {

return       ListManager.CustomListView(list: snapshot.data,space: 20, child:(index){
  User? cat =  snapshot.data?[index];
  return Row(
     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      //    category.image,
      cat?.name.toTextWidget('r20') ?? nl,
      AppStrings.toPoint(cat?.points).toTextWidget("r20g"),
      (index+1).toString().toTextWidget("r19")

    ],
  ).toCustomWidget(backgroundColor: Get.theme.hintColor,corner: AppCorner.s20,horizontalPadding: 12,verticalPadding: 10);
} )
;

  })


 ] );



}
