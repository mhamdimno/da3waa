
import '../../app/my_res.dart';
import '../modules/dashboard/dashboard_con.dart';
import '../modules/dashboard/dashboard_sc.dart';
import '../modules/splash/splash_con.dart';
import '../modules/splash/splash_sc.dart';


class AppRouters {
  static const String dashboard_route = '/dashboard_route';
  static const String splash_route = '/splash_route';

}

class AllPages {
  static List<GetPage> pages() {
    return [

      GetPage(
          name: AppRouters.dashboard_route,
          page: () => DashboardSC(),
          curve: Curves.easeInCubic,

          binding: DashboardBinding()),
      GetPage(
          name: AppRouters.splash_route,
          page: () => SplashSC(),
          curve: Curves.easeInToLinear,
          binding: SplashBinding()),

    ];
  }
}
