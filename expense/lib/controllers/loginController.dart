import 'package:get/get.dart';

class LoginController extends GetxController {
  var phoneNumber = ''.obs;
  var user_id =0.obs;
  var userName= ''.obs;

  void updatePhoneNumber(num) {
    phoneNumber.value = num;
  }

  void updateUserId(id) {
    user_id.value = id;
  }
  void updatefname(name){
    userName.value =name;
  }
}