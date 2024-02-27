import 'package:expense/viewsPages/categories.dart';
import 'package:expense/viewsPages/dashboard.dart';
import 'package:expense/viewsPages/login.dart';
import 'package:expense/viewsPages/registration.dart';
import 'package:get/get.dart';

class Routes {
  static var routes = [
    GetPage(name: "/", page: () => login()),
    GetPage(name: "/register", page: () => RegistrationPage()),
    GetPage(name: "/homepage", page: () => HomePage()),
     GetPage(name: "/categories", page: () => CategoriesPage()),
    //GetPage(name: "/settings", page: () => SettingsPage()),
    //GetPage(name: "/account", page: () => AccountPage()),
  ];
}
