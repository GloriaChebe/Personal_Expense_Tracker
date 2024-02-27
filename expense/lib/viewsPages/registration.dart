import 'package:expense/configs/constants.dart';
import 'package:expense/views/customButton.dart';
//import 'package:expense/views/customButton.dart';
import 'package:expense/views/customText.dart';
import 'package:expense/views/customTextField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController firstNameController = TextEditingController();
    TextEditingController secondNameController = TextEditingController();
    TextEditingController phoneNumberController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController re_enterPasswordController = TextEditingController();
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient:
                LinearGradient(colors: [Color(0xFF000000), Color(0xFF740001)])),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Container(
              height: 700,
              width: 900,
              padding: const EdgeInsets.all(50.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Colors.white,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          customText(
                            label: "REGISTER HERE",
                            labelColor: primaryColor,
                            fontSize: 30,
                          ),
                        ],
                      ),
                    ),
                    customTextField(
                      userFieldController: firstNameController,
                      hint: "Enter First Name",
                      icon: Icons.person,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    customTextField(
                      userFieldController: secondNameController,
                      hint: "Enter Second Name",
                      icon: Icons.person,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    customTextField(
                      userFieldController: phoneNumberController,
                      hint: "Enter Phone Number",
                      icon: Icons.phone,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    customTextField(
                      userFieldController: emailController,
                      hint: "Enter Email",
                      icon: Icons.email,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    customTextField(
                      userFieldController: passwordController,
                      hint: "Enter Password",
                      hideText: true,
                      icon: Icons.lock,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    customTextField(
                      userFieldController: re_enterPasswordController,
                      hint: "Re-enter Password",
                      hideText: true,
                      icon: Icons.lock,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    /*Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      customButton(
                        buttonLabel: 'Sign Up',
                        color: primaryColor,
                      ),
                    ],
                  ),*/
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        customButton(buttonLabel: "Register",action:gotoLogin,)
                        /*ElevatedButton(
                          onPressed: () {
                            //Get.toNamed("/RegistrationScreen");
                          },
                          child: Text(
                            "Register",
                            style: TextStyle(color: appwhiteColor),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            minimumSize: Size(80, 45), //width then height
                          ),
                        ),*/
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        customText(label: "Already have an account?"),
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          child: customText(
                            label: "Login here",
                            onTap:gotoLogin ,
                            labelColor: appBlueColor,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
   void gotoLogin() {
    Get.offAllNamed("/login");
  }
  
}
