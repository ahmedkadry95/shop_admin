import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shop_admin/base_controller.dart';

import '../../../enums/screen_state.dart';
import '../model/user_orders.dart';

class ReceivedOrdersController extends BaseController {
  var ordersRef = FirebaseFirestore.instance.collection('orders');

  List<UserOrders> ordersList = [];

  getCurrentOrders() async {
    var response =
        await ordersRef.where('order_state', isNotEqualTo: 'complete').get();

    List<QueryDocumentSnapshot> data = response.docs;
    for (var element in data) {
      ordersList.add(UserOrders.fromJson(element.data()));
    }
    setState(ViewState.idel);
  }
}
