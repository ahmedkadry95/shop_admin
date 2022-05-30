import 'package:get_it/get_it.dart';
import 'package:shop_admin/app/home/controller/home_controller.dart';
import 'package:shop_admin/app/log_in/controller/log_in_controller.dart';
import 'package:shop_admin/base_controller.dart';
import 'package:shop_admin/base_view.dart';
import 'package:shop_admin/services/api_services.dart';
import 'package:shop_admin/services/shared_pref_services.dart';

import 'app/add_product/controller/add_product_controller.dart';
import 'app/reciver_orders/controller/recived_orders_controller.dart';
import 'app/splash/controller/splash_controller.dart';
import 'services/navigation_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => SharedPrefServices());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => ApiServices());

  initSingleton();
  locator.registerFactory(() => BaseView());
  locator.registerFactory(() => BaseController());
  locator.registerFactory(() => SplashController());
  locator.registerFactory(() => LoginController());
  locator.registerFactory(() => HomeController());
  locator.registerFactory(() => ReceivedOrdersController());
  locator.registerFactory(() => AddProductController());
}

void initSingleton() {
  locator<ApiServices>();
  locator<SharedPrefServices>();
  locator<NavigationService>();
}
