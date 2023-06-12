import 'package:confirmation_success/confirmation_success.dart';
import 'package:da3wa/app/extentions/strings_extentions.dart';
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
  Widget vBuilder() =>
      AppScaffold(

          screenType: ScreensType.dashboard,
          has_drawer: true,
          isTransparent: true,
          // key: DrawerManager.scaffoldKey,
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      AppImages.dollar
                      ,
                      ModelStreamSingleBuilder<User>(
// your query to stream first result
                          query: (q) => q.orderBy('createdAt'),
// pass document id if you need to stream only this document
                          docId: AppStorage.uuid,
                          builder: (_, snapshot) {
                            return snapshot.data?.points?.toString()
                                .toTextWidget("b16_cnl") ?? nl;
                          })


                    ],
                  ).setSpaceBetweenChildrens(8),
                  FutureBuilder<User?>(
                    future: FBManager.user, // async work
                    builder: (BuildContext context,
                        AsyncSnapshot<User?> snapshot) {
                      switch (snapshot.connectionState) {
                        default:
                          if (snapshot.hasError)
                            return Text('Error: ${snapshot.error}');
                          else
                            return snapshot.data?.name?.toString().toTextWidget(
                                "b16_cnl") ?? nl;
                      }
                    },
                  ),
                  // Row(
                  //   children: [
                  //     AppImages.sort,
                  //     arrange.value.toString().toString().toTextWidget(
                  //         "b16_cnl")
                  //   ],
                  // ).setSpaceBetweenChildrens(8),
                ]),
            CustomTextField(TextEditingController(), onChange: (v) {
              if (v.isNullOrEmpty){
                con.arrCats.value=con.arrCatsAll.value;
              }else{
                con.arrCats.value=con.arrCats.where((element) => element?.name?.contains(v) == true)
                    .toList();
              }

            }),


            Obx(() {
              return ListManager.CustomGridView(list: con.arrCats.value,
                  crossAxisCount: 4,
                  spacing: AppSize.s20,
                  builder: (index) {
                    Cat? cat = con.arrCats.value[index];
                    return Column(
                      children: [
                        //    category.image,
                        cat?.name.toTextWidget('r40_cn_l_2') ?? nl,
                        cat?.desc.toTextWidget('r16cn') ?? nl,
                        AppStrings.toPoint(cat?.points).toTextWidget("r20g"),


                      ],
                    ).toCustomWidget(backgroundColor: Colors.white,
                        corner: AppCorner.s20,
                        horizontalPadding: 12).addTapGesture(() async {
                      await FBManager.increasePoints(cat?.points ?? 0);
                      Get.to(ConfirmationSuccess(
                        showBubbleSplash: true,
                        reactColor: Colors.green,
                        child: nl,

                      ));
                      setDelay(() {
                        AppNavigation.pop();
                      }, seconds: 2);
                    });
                  });
            })


          ]);


}
