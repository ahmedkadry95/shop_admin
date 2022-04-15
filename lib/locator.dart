

import 'package:get_it/get_it.dart';
import 'package:shop_admin/app/home/controller/home_controller.dart';
import 'package:shop_admin/app/log_in/controller/log_in_controller.dart';
import 'package:shop_admin/services/api_services.dart';
import 'package:shop_admin/services/shared_pref_services.dart';

import 'app/splash/controller/splash_controller.dart';
import 'services/navigation_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => SharedPrefServices());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => ApiServices());

  initSingleton();
  locator.registerFactory(() => SplashController());
  locator.registerFactory(() => LoginController());
  locator.registerFactory(() => HomeController());


}

void initSingleton() {
  locator<ApiServices>();
  locator<SharedPrefServices>();
  locator<NavigationService>();
}
