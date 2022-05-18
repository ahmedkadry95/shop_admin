import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shop_admin/base_controller.dart';
import 'package:shop_admin/locator.dart';
import 'package:shop_admin/routs/routs_names.dart';
import 'package:shop_admin/services/navigation_service.dart';
import 'package:shop_admin/services/shared_pref_services.dart';
import 'package:shop_admin/utils/strings.dart';
import '../../../services/api_services.dart';

class LoginController extends BaseController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  var apiServices = locator<ApiServices>();
  var navigation = locator<NavigationService>();
  var pref = locator<SharedPrefServices>();
  String? loginStatus;

  logIn() async {
    loginStatus =
        await apiServices.logIn(email: email.text, password: password.text);
    if (loginStatus == 'true') {
      await pref.saveBoolean(isLogin, true);
      navigation.navigateToAndClearStack(RouteName.home);
    } else {
      print('faild login');
    }
  }

  CollectionReference banner = FirebaseFirestore.instance.collection('banner');

  void addBanner() {
    banner.add({'test': 'test'});
  }
}
