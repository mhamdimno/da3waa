import 'package:da3wa/data/managers/trait.dart';

import '../../../app/my_res.dart';

//BINDING
class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
  }
}

//CONTROLLER
class SplashController extends BaseController {
  //PROBERITY

  //METHODS

  //ROUTER

  //OVERRIDES
  @override
  void onInit() {
    super.onInit();


  }

  @override
  void onReady() {
    super.onReady();
    setDelay(() {
      Trait.CheckScreen();
    },seconds: AppConstants.splashDelay);
  //  2000.delay((){
      ;
    //});
  }
}
