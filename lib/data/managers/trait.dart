import 'package:da3wa/app/my_res.dart';
import 'package:da3wa/data/managers/firebase.dart';

class Trait{
  static  CheckScreen(){
    FBManager.isExistUser.then((value) {
      AppNavigation.setRootScreen(value ? AppRouters.tabbar :  AppRouters.login);
    });
  }
}