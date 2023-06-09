import 'package:da3wa/data/managers/firebase.dart';

import '../../../app/my_res.dart';
import '../../../domain/remote/cat.dart';


//BINDING
class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardController());
  }
}

//CONTROLLER
class DashboardController extends BaseController {


  //PROBERITY
  var arrCatsAll = <Cat?>[].obs;
  var arrCats = <Cat?>[].obs;

  @override
  void setupUI() {
    // TODO: implement setupUI
    super.setupUI();
    FBManager.cats.then((value) {
       arrCats.value=value;
       arrCatsAll.value=value;
    });

  }







}