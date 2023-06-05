import 'package:da3wa/presentation/modules/splash/splash_con.dart';

import '../../../app/my_res.dart';



class SplashSC extends BaseView<SplashController> {
  @override
  Widget vBuilder() => AppScaffold(
      isTransparent: true,
      child: AppImages.logo.setScale(AppSize.s1_3).animate(AnimateType.zoomIn,duration: 2.seconds),
      screenType: ScreensType.defeult);
}
