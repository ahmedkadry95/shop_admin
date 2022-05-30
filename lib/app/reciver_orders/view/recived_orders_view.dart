import 'package:flutter/material.dart';
import 'package:shop_admin/base_view.dart';

import '../controller/recived_orders_controller.dart';

class ReceivedOrdersView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<ReceivedOrdersController>(
      onModelReady: (controller) async {},
      builder: (context, controller, child) {
        return Scaffold(

        );
      },
    );
  }
}
