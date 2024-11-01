import 'package:demo_test/core/routers/routes.dart';
import 'package:demo_test/feature/register_page/presentation/register_page.dart';
import 'package:get/get.dart';

import '../../feature/login_page/pressentation/login_page.dart';
import '../../feature/main/prentation/main_page.dart';
import '../../feature/slash/pages/slash.dart';
class Pages {

  static const String initial = Routes.splash;

  static const String login = Routes.login;

  static final routes = [
    GetPage(
        name: Routes.login,
        page: ()=> LoginPage()
    ),
    GetPage(
      name: Routes.register,
      page: ()=> RegisterPage()
    ),
    GetPage(
      name: Routes.splash,
      page: () => SplashPage()
    ),
    GetPage(
      name: Routes.main,
      page: ()=> MainPage()
    )

  ];
}