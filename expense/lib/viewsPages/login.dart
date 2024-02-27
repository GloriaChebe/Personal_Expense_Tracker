import 'package:expense/configs/constants.dart';
import 'package:expense/views/customButton.dart';
import 'package:expense/views/customText.dart';
import 'package:expense/views/customTextField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class login extends StatelessWidget {
  const login({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController userNameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient:
                LinearGradient(colors: [Color(0xFF000000), Color(0xFF740001)])),
        child: Center(
          child: Container(
            height: 470,
            width: 600,
            padding: const EdgeInsets.all(50.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0), color: Colors.white
                //.withOpacity(0.4), // Set the color of the inner container
                ),
            child: SingleChildScrollView(
              //padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    customText(
                      label: "WELCOME BACK",
                      labelColor: primaryColor,
                      fontSize: 30,
                    ),
                  ]),
                  SizedBox(
                    height: 15,
                  ),
                  customText(label: "Username"),
                  customTextField(
                    userFieldController: userNameController,
                    icon: Icons.person,
                    hint: "enter gmail",
                  ),
                  const customText(label: "Password"),
                  customTextField(
                    userFieldController: passwordController,
                    icon: Icons.lock,
                    hideText: true,
                    isPassword: true,
                    hint: "your password",
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      customButton(buttonLabel:"Login",action:gotoHome ,)
                      // ElevatedButton(
                      //   onPressed: () {
                      //     Get.toNamed("/HomePage");
                      //   },
                      //   child: Text(
                      //     "login",
                      //     style: TextStyle(color: appwhiteColor),
                      //   ),
                      //   style: ElevatedButton.styleFrom(
                      //     backgroundColor: primaryColor,
                      //     shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(50.0),
                      //     ),
                      //     minimumSize: Size(80, 45), //width then height
                      //   ),
                      // ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      customText(label: "forgot password?"),
                      const SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                          child: customText(
                            label: "reset here",
                            labelColor: appBlueColor,
                          ),
                          onTap: () {
                            print("Recovered password");
                          })
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      customText(label: "no account yet?"),
                      const SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        child: customText(
                          label: "register here",
                          onTap: gotoRegister,
                          labelColor: appBlueColor,
                        ),
                        // onTap: () {
                        // print("registered");
                        // }
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void gotoRegister() {
    Get.offAllNamed("/register");
  }
/* void gotoPassword() {
    Get.offAllNamed("/password"
  );

  }*/
   void gotoHome() {
    Get.offAllNamed("/homepage");
  }
}
