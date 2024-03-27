import 'package:expense/configs/constants.dart';
import 'package:expense/views/customButton.dart';
import 'package:expense/views/customText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});
  final bool _isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       backgroundColor: primaryColor.withOpacity(0.8),
        // leading: IconButton(
        //     icon: Icon(
        //       Icons.arrow_back,
        //     ),
        //     onPressed: () => Get.toNamed("/homepage")),
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            Row(
              children: [
                Icon(Icons.person),
                SizedBox(
                  width: 10,
                ),
                customText(label: 'Account',
                  fontSize: 20,
                  labelColor: appBlackColor,
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                customText(label: 'Change Password'),
                Icon(Icons.arrow_forward_ios),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                customText(label: 'Content Settings'),
                Icon(Icons.arrow_forward_ios),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                customText(label: 'Language'),
                Icon(Icons.arrow_forward_ios),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                customText(label: 'Privacy and Security'),
                Icon(Icons.arrow_forward_ios),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Icon(Icons.notification_add),
                SizedBox(width: 10,),
                customText(label: 'Notifications',fontSize: 20,labelColor: appBlackColor,),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                customText(label: "Theme dark"),
                //
                Switch(
                  value: _isSwitched,
                  onChanged: (value) {},
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                customText(label: "Account Activity"),
                //
                Switch(
                  value: _isSwitched,
                  onChanged: (value) {},
                ),
              ],
            ),
             SizedBox(
              height: 100,
             ),
              // width: double.infinity,
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   CustomButton(
                    
                    buttonLabel: "SIGN OUT",
                    action: gotoLogin,
                                 ),
                 ],
               ),
            
          ],
        ),
      ),
    );
    
  }
  void gotoLogin() {
    Get.offAllNamed("/login");
  }
}
