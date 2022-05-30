import 'package:flutter/material.dart';
import 'package:shop_admin/app/home/controller/home_controller.dart';
import 'package:shop_admin/base_view.dart';

import '../../../utils/colors.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeController>(
      onModelReady: (controller) async {},
      builder: (context, controller, child) {
        return Container(
          color: backgroundColor,
          child: SafeArea(
            left: false,
            right: false,
            bottom: false,
            child: Scaffold(
              backgroundColor: backgroundColor,
              body: Center(
                child: controller.pages[controller.currentIndex],
              ),
              bottomNavigationBar: Material(
                elevation: 60,
                clipBehavior: Clip.hardEdge,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
                child: BottomNavigationBar(
                  unselectedItemColor: Colors.black,
                  selectedItemColor: mainColor,
                  showUnselectedLabels: false,
                  currentIndex: controller.currentIndex,
                  selectedLabelStyle: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 14),
                  onTap: (index) {
                    controller.changeNavBarIndex(index);
                  },
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home_rounded),
                      label: 'Shop',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.manage_search_rounded),
                      label: 'Orders',
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
