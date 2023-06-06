import 'package:da3wa/app/my_res.dart';
import 'package:da3wa/data/managers/firebase.dart';

class Trait{
  static  CheckScreen(){
    FBManager.isExistUser.then((value) {
      AppNavigation.toRoute(value ? AppRouters.dashboard_route :  AppRouters.login);
    });
  }
}