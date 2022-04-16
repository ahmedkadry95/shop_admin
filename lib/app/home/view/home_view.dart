import 'package:flutter/material.dart';
import 'package:shop_admin/app/home/controller/home_controller.dart';
import 'package:shop_admin/app/widgts/back_ground_mask.dart';
import 'package:shop_admin/app/widgts/center_logo.dart';
import 'package:shop_admin/base_view.dart';
import 'package:shop_admin/utils/colors.dart';
import 'package:shop_admin/utils/extensions.dart';
import 'package:shop_admin/utils/spaces.dart';
import 'package:shop_admin/utils/texts.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeController>(
      onModelReady: (controller) async {
        controller.getBanner();
      },
      builder: (context, controller, child) {
        return Scaffold(
          backgroundColor: backgroundColor,
          body: Stack(
            children: [
              backgroundMask(),
              ListView(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                children: [
                  heightSpace(40),
                  centerLogo(),
                  heightSpace(20),
                  Card(
                    elevation: 10,
                    child: Column(
                      children: [
                        heightSpace(15),
                        blackTitle2('add banner'),
                        heightSpace(20),
                        button('add').onTap(() {
                          controller.uploadImage();
                        }),
                        heightSpace(15),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}

Widget button(String text) {
  return Container(
    padding: const EdgeInsets.symmetric(
      horizontal: 30,
      vertical: 10,
    ),
    decoration: BoxDecoration(
        color: mainColor, borderRadius: BorderRadius.circular(10)),
    child: Text(
      text,
      style: const TextStyle(
        color: Colors.white,
      ),
    ),
  );
}
