import 'package:da3wa/presentation/modules/splash/splash_con.dart';

import '../../../app/my_res.dart';
import 'login_con.dart';



class login_sc extends BaseView<login_con> {
  @override
  Widget vBuilder() => AppScaffold(
      isTransparent: true,
      children: [
AppImages.logo,
        CustomTextField(con.nameTEC),
        ElevatedButton(onPressed: ()=>con.login(), child: AppStrings.login.toTextWidget("r12")),

      ],
      screenType: ScreensType.defeult);
}
