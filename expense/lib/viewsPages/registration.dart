import 'dart:convert';

import 'package:expense/configs/constants.dart';
import 'package:expense/views/customButton.dart';
import 'package:expense/views/customText.dart';
import 'package:expense/views/customTextField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;

    TextEditingController userNameController= TextEditingController();
    TextEditingController phoneNumberController = TextEditingController();
    TextEditingController emailController = TextEditingController();
     TextEditingController addressController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController re_enterPasswordController = TextEditingController();

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    
   
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
              padding: const EdgeInsets.all(20.0),
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
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                             
                                 Image.asset("assets/images/logo.png",height: 120,),
                               
                        customText(
                              label: "REGISTER HERE!",
                              
                              labelColor: primaryColor,
                              fontSize: 30,
                            ),
                          ],
                        ),
                      ),
                    ),
                    //customText(label: "Username"),
                    customTextField(
                      userFieldController: userNameController,
                      hint: "Username",
                      icon: Icons.person,
                    ),
                    
                    SizedBox(
                      height: 15,
                    ),
                    //customText(label: "Phone Number"),
                    customTextField(
                      userFieldController: phoneNumberController,
                      hint: "Enter Phone Number",
                      icon: Icons.phone,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                     // customText(label: "Email"),
                    customTextField(
                      userFieldController: emailController,
                      hint: "Enter Email",
                      icon: Icons.email,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                      //customText(label: "Address"),
                    customTextField(
                      userFieldController: addressController,
                      hint:"Address ie(116,Kericho)",
                      
                      icon: Icons.location_city,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                      //customText(label: "Password"),
                    customTextField(
                      userFieldController: passwordController,
                      hint: "Enter Password",
                      hideText: true,
                      icon: Icons.lock,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                      //customText(label: "Re-enter Password"),
                    customTextField(
                      userFieldController: re_enterPasswordController,
                      hint: "Re-enter Password",
                      hideText: true,
                      icon: Icons.lock,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                   
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomButton(buttonLabel: "Register",action:(){
                          serverSignup();
                          //gotoLogin();
                        })
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
  Future<void> serverSignup() async {
    http.Response response;
    var body={
      'userName': userNameController.text.trim(),
      'phoneNo': phoneNumberController.text.trim(),
      'email': emailController.text.trim(),
      'address': addressController.text.trim(),
      'password':passwordController.text.trim(),
};
    response = await http.post(
      Uri.parse("https://sanerylgloann.co.ke/ExpenseEase/createUsers.php"),
      body: body,
    );
    print(response.body);
    if (response.statusCode == 200) {
      var serverResponse = json.decode(response.body);
      int signedUp=serverResponse['success'];
      
      if (signedUp == 1) {
      gotoLogin() ;
      } 
    }
}
 
}