import 'package:flutter/material.dart';
import 'package:shop_admin/app/add_product/view/add_product_view.dart';
import 'package:shop_admin/base_controller.dart';
import 'package:shop_admin/enums/screen_state.dart';
import '../../reciver_orders/view/recived_orders_view.dart';

class HomeController extends BaseController {
  List<Widget> pages = [
    AddProductView(),
    ReceivedOrdersView(),
  ];
  int currentIndex = 0;

  void changeNavBarIndex(int index) {
    currentIndex = index;
    setState(ViewState.idel);
  }
}
