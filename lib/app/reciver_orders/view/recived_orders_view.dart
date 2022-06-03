import 'package:flutter/material.dart';
import 'package:shop_admin/base_view.dart';

import '../controller/recived_orders_controller.dart';

class ReceivedOrdersView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<ReceivedOrdersController>(
      onModelReady: (controller) {
        controller.getCurrentOrders();
      },
      builder: (context, controller, child) {
        return Scaffold(
          body: ListView.builder(
              itemCount: controller.ordersList.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: [
                      Text(controller.ordersList[index].orderId.toString()),
                      Text(controller.ordersList[index].userToken.toString()),
                      Text(controller.ordersList[index].orderState.toString()),
                    ],
                  ),
                );
              }),
        );
      },
    );
  }
}
