import 'package:expense/controllers/userController.dart';
import 'package:expense/controllers/userListController.dart';
import 'package:expense/utils/routes.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

void main() {
  Get.put(CurrentUserController());
  runApp(GetMaterialApp(
    //home: RegistrationScreen(),
    //home: login(),
    //home: calculator(),
    initialRoute: "/",
    debugShowCheckedModeBanner: false,
    getPages: Routes.routes,
  ));
}
