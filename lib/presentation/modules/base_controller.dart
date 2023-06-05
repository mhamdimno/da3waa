import 'dart:io';


import 'package:da3wa/presentation/widgets/common_widget_manager.dart';

import '../../../app/my_res.dart';





  // List<mgeneral?> arrDatas = [];
class BaseController extends GetxController {
  final ScrollController list_con = ScrollController();

  mgeneral? objData = mgeneral();

  ScrollController? scrollController;
  int limit = 20;
  int limitIncrement = 20;
  bool isLoaded=false;


void onLoadMore() {}
void dismiss() {}
void setupUI() {}
  void whenHide() {}
  void whenShow() {}

  getDataFromApi() {}
  postDataFromApi() {}


  @override
  void onReady() {

    setDelayMilliseconds(()=> isInSameScreen.value = true,milliseconds: 600);

    if (Get.arguments != null) {
      objData = Get.arguments;
    }
    super.onReady();
  }

  @override
  void onInit() {


    super.onInit();
    setupUI();
  }
}
