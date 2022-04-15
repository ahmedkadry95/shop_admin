import 'dart:async';

import 'package:shop_admin/base_controller.dart';
import 'package:shop_admin/locator.dart';
import 'package:shop_admin/routs/routs_names.dart';
import 'package:shop_admin/services/navigation_service.dart';
import 'package:shop_admin/services/shared_pref_services.dart';
import 'package:shop_admin/utils/strings.dart';


class SplashController extends BaseController {
  var pref = locator<SharedPrefServices>();
  var navigation = locator<NavigationService>();

  bool? isLogIn;
  String? accountType;

  checkIsLogIn() async {
    isLogIn = await pref.getBoolean(isLogin);
  }

  splashNavigation() async {
    if (isLogIn!) {
      navigationTimer(RouteName.home);
    } else {
      navigationTimer(RouteName.logIn);
    }
  }

  void navigationTimer(String routName) {
    Timer(
      const Duration(seconds: 3),
      () {
        navigation.navigateTo(routName);
      },
    );
  }
}
