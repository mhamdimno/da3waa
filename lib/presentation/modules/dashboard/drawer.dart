// import '../../../app/my_res.dart';
// import '../../../data/managers/push_notification_manager.dart';
// import '../../../domain/localModels/profileModel.dart';
// import '../../widgets/dialogs_managar.dart';
// import '../../widgets/list_manager.dart';
//
// class DrawerManager{
//
//   static final List arrList = [
//     ProfileModel(title: "dd", action: (){
//
//     })
//     // ProfileModel(
//     //     titile: AppStrings.dashboard,
//     //     image_name: "dashboard",
//     //     is_selected: false),
//     // ProfileModel(
//     //     titile: AppStrings.account, image_name: "account", is_selected: false),
//     // ProfileModel(
//     //     titile: AppStrings.notification,
//     //     image_name: "notifications",
//     //     is_selected: false),
//     // ProfileModel(
//     //     titile: AppStrings.location, image_name: "location", is_selected: false),
//     // /*mprofile(
//     //     titile: cstrings.tellafriend, image_name: "tell_afriend", is_selected: false),*/
//     // ProfileModel(
//     //     titile: AppStrings.support, image_name: "support", is_selected: false),
//     // ProfileModel(
//     //     titile: AppStrings.logout, image_name: "logout", is_selected: false),
//   ];
//
//  static GlobalKey<ScaffoldState> scaffoldKey = GlobalObjectKey<ScaffoldState>(
//       generateRandomNumber);
//
//   static void openDrawer() {
//     scaffoldKey.currentState?.openDrawer();
//   }
//
//   static void closeDrawer() {
//     scaffoldKey.currentState?.openEndDrawer();
//   }
//
//   static select_md({required int index}) async {
//     closeDrawer();
//
//     switch (DrawerManager.arrList[index].titile) {
//     //   case AppStrings.dashboard:
//     //   //closeDrawer();
//     //     break;
//     //   case AppStrings.account:
//     //     closeDrawer();
//     //     AppNavigation.toRoute(AppRouters.edit_profile_route);
//     //
//     //     break;
//     //   case AppStrings.notification:
//     //     AppNavigation.toRoute(AppRouters.notifications_route);
//     //     break;
//     //   case AppStrings.location:
//     //     AppNavigation.toRoute(AppRouters.map_route);
//     //     break;
//     //   case AppStrings.tellafriend:
//     //     AppNavigation.toRoute(AppRouters.share_route);
//     //     break;
//     //   case AppStrings.support:
//     //     AppNavigation.toRoute(AppRouters.contact_us_route);
//     //     break;
//     //   case AppStrings.logout:
//     //     DialogsManager.confirmAction(() async {
//     //       print(',,,,,,,,,,,,,,,,,,,,,,,,,,,,,');
//     //       DialogsManager.showProgress();
//     //       // if (is_not_web){
//     //       await PushNotificationManager.removePushNotificationToken();
//     //       //}
//     //       AppStorage.logout();
//     //       AppNavigation.checkScreen();
//     //       DialogsManager.dismissProgress();
//     //
//     //     });
//     //     break;
//       default:
//         break;
//      }
//   }
//
//   static Widget get drawerWidget =>SizedBox(
// width: AppSize.drawerWidth,
// child: Drawer( child:  Column(
//   children: [
//     AppStrings.toPoints(200).toTextWidget("m20g"),
//         ListManager.CustomListView(list:DrawerManager.arrList,child: ( index) {
//       ProfileModel md = DrawerManager.arrList[index];
//       return Row(
//         children: [
//          // AppImages.dashboard(md.image_name, _img_color(md)),
//           md.title.toTextWidget("m18",textColor:Get.theme.primaryColor),
//         ],
//       )
//           .setSpaceBetweenChildrens(AppSize.s8)
//           .setPadding(AppPadding.p8)
//           .toCustomWidget(backgroundColor: _bg_color(md), corner: AppSize.s8)
//           .addTapGesture(() {
//         DrawerManager.select_md(index: index);
//       });
//     },
//         // emptyChild: CommonWidgetManager.emptyWidget
//         empty_data_string: AppStrings.nodatafound,
//         space: AppSize.s4,
//           isStatic: true
//     )
//         ,
//   ],
// ).setSpaceBetweenChildrens(20).paddingAll(AppSize.s20))
//   );
//
// static Color _bg_color(ProfileModel md) {
//   return Get.theme.hintColor;
// }
//
//   static Color _img_color(ProfileModel md) {
//   return Get.theme.hintColor;
// }
//
//
// }