 import 'package:da3wa/app/extentions/numbers_extentions.dart';
import 'package:da3wa/presentation/modules/dashboard/drawer.dart';

import '../../app/my_res.dart';
import 'appbar_manager.dart';

Widget AppScaffold(
{String? appbarText,
double verticalPadding =AppSize.s16,
double horizintalPadding = AppSize.s16,
  Widget? leading_appBar,
  bool isTransparent: true,
  bool isScrool = true,

  double spacingBetweenWidgets = AppSize.s20,
AlignmentGeometry alignment = Alignment.topCenter,
ScreensType screenType = ScreensType.defeult,
bool automaticallyImplyLeading = true,
VoidCallback? onPressed,
  Widget? appbar_child,

  Widget? child,
  bool? has_drawer,

  Key? key,
bool withoutAddTop = false,

  double verticalPaddingForWeb =AppSize.s16,
  double horizintalPaddingForWeb = AppSize.s15,
List<Widget>? children}) {



bool clear_app_bar =
    screenType == ScreensType.defeult || isTransparent || screenType == ScreensType.pop;

return Scaffold(
  key: key ?? Key(generateRandomNumber),
  extendBodyBehindAppBar: isTransparent || screenType == ScreensType.pop,
  backgroundColor:  screenType == ScreensType.pop
      ? Get.theme.splashColor.withOpacity(0.2)
      : clear_app_bar
      ? Colors.redAccent
      : Get.theme.primaryColorLight,
  //drawer: has_drawer == null ? null : DrawerManager.drawerWidget,

appBar:
appbarText == null || appbar_child == null
? null
    : AppbarManager.customAppBar(

appbarText,
  leading: leading_appBar,
  child: appbar_child,

automaticallyImplyLeading: automaticallyImplyLeading,
isTransparent: screenType == ScreensType.pop,
),
  body: child?.setHorizentalPadding(horizintalPadding).setVerticalPadding(verticalPadding)
      ??
      SingleChildScrollView(
        physics: isScrool
            ? RangeMaintainingScrollPhysics()
            : NeverScrollableScrollPhysics(),
        child: Container(
          alignment: alignment,
          //height: Get.height*0.3,
          width: Get.width,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: horizintalPadding.if_web(horizintalPaddingForWeb), vertical: verticalPadding.if_web(verticalPaddingForWeb)),
            child: CommonWidgetManager.customWrap(
                children: children,
                spacing: screenType == ScreensType.defeult ? AppSize.s20 : spacingBetweenWidgets),
          ),
        ),
      ).moveTop(-10),
);
}


