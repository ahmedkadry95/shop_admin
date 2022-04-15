
import 'package:flutter/material.dart';
import 'package:shop_admin/app/log_in/controller/log_in_controller.dart';
import 'package:shop_admin/app/widgts/back_ground_mask.dart';
import 'package:shop_admin/app/widgts/center_logo.dart';
import 'package:shop_admin/app/widgts/input_field.dart';
import 'package:shop_admin/app/widgts/main_button.dart';
import 'package:shop_admin/base_view.dart';
import 'package:shop_admin/utils/extensions.dart';
import 'package:shop_admin/utils/spaces.dart';
import 'package:shop_admin/utils/texts.dart';

class LogInView extends StatelessWidget {
  const LogInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginController>(
      onModelReady: (controller) async {},
      builder: (context, controller, child) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Stack(
                children: [
                  backgroundMask(),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        heightSpace(40),
                        centerLogo(),
                        heightSpace(30),
                        blackTitle1("Log In"),
                        heightSpace(15),
                        smallGreyHint("Enter your email and password"),
                        heightSpace(40),
                        InputField(
                          label: "Email",
                          hint: "Enter your email address",
                          inputType: TextInputType.emailAddress,
                          controller: controller.email,
                        ),
                        heightSpace(20),
                        InputField(
                          label: "Password",
                          hint: "Enter your password",
                          isPassword: true,
                          controller: controller.password,
                          inputType: TextInputType.emailAddress,
                        ),
                        heightSpace(20),
                        const Align(
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          ),
                          alignment: Alignment.centerRight,
                        ),
                        heightSpace(30),
                        MainButton(
                          text: "Log In",
                        ).onTap(
                          () {
                            // controller.login();
                            // controller.addBanner();
                            controller.logIn();
                          },
                        ),
                        heightSpace(30),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
