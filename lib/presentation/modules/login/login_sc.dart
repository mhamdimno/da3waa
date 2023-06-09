import 'package:da3wa/presentation/modules/splash/splash_con.dart';

import '../../../app/my_res.dart';
import 'login_con.dart';



class login_sc extends BaseView<login_con> {
  @override
  Widget vBuilder() => AppScaffold(
      isTransparent: true,
      children: [

        AppStrings.entername.toTextWidget("r56l").paddingOnly(top: 100),
        CustomTextField(con.nameTEC),
        ElevatedButton(onPressed: ()=>con.login(), child: AppStrings.confirm.toTextWidget("r24"),  style: ElevatedButton.styleFrom(
            primary: ColorManager.helper
        )),

      ],
      screenType: ScreensType.defeult);
}
