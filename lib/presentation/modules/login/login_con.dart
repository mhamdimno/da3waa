import 'package:da3wa/app/extentions/strings_extentions.dart';
import 'package:da3wa/data/managers/firebase.dart';

import '../../../app/my_res.dart';



//CONTROLLER
class login_con extends BaseController {
  //PROBERITY
  TextEditingController nameTEC = TextEditingController();
  //METHODS

  //ROUTER

  //OVERRIDES
  @override
  void onInit() {
    super.onInit();


  }

  login(){
    if (nameTEC.text.isNotNullOrEmpty) {
      FBManager.createUser(nameTEC.text).then((_) => AppNavigation.toRoute(AppRouters.dashboard_route));
    }
  }
  @override
  void onReady() {
    super.onReady();

  }
}
