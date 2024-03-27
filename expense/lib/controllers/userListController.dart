import 'package:get/get.dart';

class UserController extends GetxController{
  final loadingUser=true.obs;

final userList={}.obs;
updateUserList(list)=>userList.value=list;
updateLoadingUser (loading)=>loadingUser.value= loading;

}