import 'package:da3wa/app/my_res.dart';
import 'package:da3wa/data/managers/firebase.dart';

class Trait{
  static CheckScreen(){
    FBManager.isExistUser.then((value) {
value ? AppRouters.dashboard_route :  AppRouters.dashboard_route;     });
  }
}