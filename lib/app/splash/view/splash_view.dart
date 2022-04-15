
import 'package:flutter/material.dart';
import 'package:shop_admin/app/splash/controller/splash_controller.dart';
import 'package:shop_admin/base_view.dart';


class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<SplashController>(
      onModelReady: (controller) async {
        await controller.checkIsLogIn();
        controller.splashNavigation();
      },
      builder: (context, controller, child) {
        return Scaffold(
          backgroundColor: const Color(0xff53B175),
          body: Center(
            child: Image.asset('assets/images/splash_logo.png'),
          ),
        );
      },
    );
  }
}
