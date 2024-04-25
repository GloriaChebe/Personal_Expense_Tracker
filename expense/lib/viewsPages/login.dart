import 'dart:convert';
import 'package:expense/controllers/userController.dart';
import 'package:expense/controllers/userListController.dart';
import 'package:expense/models/usersModel.dart';
import 'package:flutter/material.dart';
// import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:expense/views/customButton.dart';
import 'package:expense/views/customText.dart';
import 'package:expense/views/customTextField.dart';
import 'package:expense/views/customPrefernces.dart';
import 'package:expense/configs/constants.dart';
import 'package:expense/controllers/loginController.dart';
//LoginController loginController=Get.put(loginController);
class login extends StatelessWidget {
   login({Key? key}) : super(key: key);

  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final Prefs_prefs = Prefs();
  // var store=GetStorage();
   final userController = Get.find<CurrentUserController>();

  @override
  Widget build(BuildContext context) {
    Prefs_prefs.getString('userName').then((userName) {
      if (userName != null) {
        userNameController.text = userName;
      }
    });

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Color(0xFF000000), Color(0xFF740001)]),
        ),
        child: Center(
          child: SafeArea(
            child: Container(
              height: 470,
              width: 310,
              padding: const EdgeInsets.all(50.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Colors.white,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/logo.png", height: 120,),
                          customText(
                            label: "WELCOME BACK",
                            labelColor: primaryColor,
                            fontSize: 20,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    customText(label: "Username"),
                    customTextField(
                      userFieldController: userNameController,
                      icon: Icons.person,
                      hint: "enter username",
                    ),
                    const customText(label: "Password"),
                    customTextField(
                      userFieldController: passwordController,
                      icon: Icons.lock,
                      hideText: true,
                      isPassword: true,
                      hint: "your password",
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomButton(
                          buttonLabel: "Login",
                          action: () {
                            remoteLogin();
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        customText(label: "forgot password?"),
                        SizedBox(height: 30),
                        GestureDetector(
                          child: customText(
                            label: "reset here",
                            labelColor: appBlueColor,
                          ),
                          onTap: () {
                            print("Recovered password");
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        customText(label: "no account yet?"),
                        SizedBox(height: 30),
                        GestureDetector(
                          child: customText(
                            label: "register here",
                            onTap: gotoRegister,
                            labelColor: appBlueColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> remoteLogin() async {
    final response = await http.get(Uri.parse("https://sanerylgloann.co.ke/ExpenseEase/readUsers.php?userName=${userNameController.text.trim()}&password=${passwordController.text.trim()}"));
    if (response.statusCode == 200) {
     
      var serverResponse = json.decode(response.body);
      //var userId = ['user_id'];
      int loginStatus = serverResponse['success'];
      if (loginStatus == 1) {
        print(serverResponse);
        userController.user.value = User.fromJson(serverResponse["userdata"][0]);
        print(userController.user.value!.toJson());
        await Prefs_prefs.addString('userName', userNameController.text.trim());
        //loginController.updateUserId(userID);
            //store.write("userid", userID);
        
        gotoHome();
      } else {
        print('userName or password is incorrect');
      }
    } else {
      print("server error: ${response.statusCode}");
    }
  }

  void gotoRegister() {
    Get.offAllNamed("/register");
  }

  void gotoHome() {
    Get.offAllNamed("/homepage");
  }
}
