import 'package:flutter/material.dart';
import 'package:shop_admin/app/reciver_orders/recived_orders_controller/recived_orders_controller.dart';
import 'package:shop_admin/base_view.dart';

class ReceivedOrdersView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<ReceivedOrdersController>(
      onModelReady: (controller) async {},
      builder: (context, controller, child) {
        return Scaffold();
      },
    );
  }
}
