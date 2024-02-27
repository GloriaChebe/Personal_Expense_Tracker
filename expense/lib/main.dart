import 'package:expense/utils/routes.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
    //home: RegistrationScreen(),
    //home: login(),
    //home: calculator(),
    initialRoute: "/",
    debugShowCheckedModeBanner: false,
    getPages: Routes.routes,
  ));
}
