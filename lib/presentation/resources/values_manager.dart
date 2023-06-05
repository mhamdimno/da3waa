import 'package:da3wa/app/extentions/numbers_extentions.dart';

import '../../app/my_res.dart';

class AppPadding {
  static const double p0 = 0.0;

  static const double p2 = 2.0;
  static const double p4 = 4.0;
  static const double p6 = 6.0;

  static const double p8 = 8.0;
  static const double p10 = 10.0;

  static const double p12 = 12.0;
  static const double p14 = 14.0;
  static const double p16 = 16.0;
  static const double p18 = 18.0;
  static const double p20 = 20.0;
  static const double p28 = 28.0;
  static const double p40 = 40.0;
  static const double p100 = 100.0;
}

class AppSize {
  static const double s0 = 0;
  static const double s0_5 =0.5;
  static const double s1 = 1;
  static const double s1_3 =1.3;

  static const double s2 = 2;
  static const double s1_5 = 1.5;
  static const double s3 = 3.0;
  static const double s4 = 4.0;
  static const double s5 = 5.0;
  static const double s6 = 6;
  static const double s7 = 7;
  static const double s8 = 8.0;
  static const double s10 = 10.0;
  static const double s12 = 12.0;
  static const double s14 = 14.0;
  static const double s15 = 15.0;

  static const double s16 = 16.0;
  static const double s18 = 18.0;
  static const double s20 = 20.0;
  static const double s24 = 24.0;

  static const double s28 = 28.0;
  static const double s35 = 35.0;
  static const double s40 = 40.0;
  static const double s48 = 48.0;
  static const double s60 = 60.0;
  static const double s90 = 90.0;
  static const double s100 = 100.0;
  static const double s120 = 120.0;
  static const double s140 = 140.0;
  static const double s160 = 160.0;
  static const double s165 = 165.0;
  static const double s175 = 175.0;
  static const double s190 = 190.0;
  static const double s22 = 22;
  static const double s25 = 25;
  static const double s30 = 30;
  static const double s33 = 33;
  static const double s45 = 45;
  static const double s50 = 50;
  static const double s56 = 56;
  static const double s63 = 63;
  static const double s65 = 65;
  static const double s70 = 70;
  static const double s75 = 75;
  static const double s80 = 80;
  static const double s86 = 86;
  static const double s93 = 93;

  static const double s107 = 107;
  static const double s115 = 115;
  static const double s150 = 150;

  static const double s187 = 187;
  static const double s200 = 200;
  static const double s220 = 217;
  static const double s239 = 239;
  static const double s250 = 250;
  static const double s254 = 254;

  static const double s272 = 272;
  static const double s280 = 280;
  static const double s300 = 300;
  static const double s356 = 356;

  static const double s450 = 450;
  static const double s340 = 340;

  static const double s343 = 343;
  static const double s497 = 497;
  static const double s520 = 600;
  static const double s700 = 700;

  static const double buttonHeight = 54;

  static const double referenceScreenHeight = 896;
  static const double referenceScreenWidth = 414;
  static const double drawerWidth = 250;

  static SizedBox get appBarHeight =>
      AppBar().preferredSize.height.spaceVertical;
  static double get web_main_container_width => 500;
  static const double smallWidth = 600;

  static  int  crossAxisCountPackagesWeb({required bool is_small_screen}) => is_small_screen ? 2: 4;

  static double get dropdown_sc_height =>
  ( is_web ? 0.7:0.5)*Get.height;




}
class AppCorner {
  static const double s4 = 4.0;
  static const double s8 = 8.0;
  static const double s20 = 20.0;






}
