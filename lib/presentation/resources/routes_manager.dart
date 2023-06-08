
import 'package:da3wa/presentation/modules/login/login_con.dart';
import 'package:da3wa/presentation/modules/login/login_sc.dart';
import 'package:da3wa/presentation/modules/tabbar_sc.dart';
import 'package:da3wa/presentation/modules/users/user_con.dart';
import 'package:da3wa/presentation/modules/users/users_sc.dart';

import '../../app/my_res.dart';
import '../modules/dashboard/dashboard_con.dart';
import '../modules/dashboard/dashboard_sc.dart';
import '../modules/splash/splash_con.dart';
import '../modules/splash/splash_sc.dart';


class AppRouters {
  static const String dashboard_route = '/dashboard_route';
  static const String splash_route = '/splash_route';
  static const String login = '/login';
  static const String tabbar = '/tabbar';
  static const String users = '/users';
}

class AllPages {
  static List<GetPage> pages() {
    return [

      GetPage(
          name: AppRouters.tabbar,
          page: () => tabbarSC(),
          binding: BindingsBuilder(() {
            Get.lazyPut<tabbar_con>(() => tabbar_con());
          })
          ),
      GetPage(
          name: AppRouters.users,
          page: () => users_sc(),
          binding: BindingsBuilder(() {
            Get.lazyPut<user_con>(() => user_con());
          })
          ),
      GetPage(
          name: AppRouters.login,
          page: () => login_sc(),

          binding: BindingsBuilder(() {
            Get.lazyPut<login_con>(() => login_con());
          })),
      GetPage(
          name: AppRouters.dashboard_route,
          page: () => DashboardSC(),
          curve: Curves.easeInCubic,

          binding: BindingsBuilder(() {
            Get.lazyPut<DashboardController>(() => DashboardController());
          })),
      GetPage(
          name: AppRouters.splash_route,
          page: () => SplashSC(),
          curve: Curves.easeInToLinear,
          binding: SplashBinding()),

    ];
  }
}
