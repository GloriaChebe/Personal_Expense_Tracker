import 'package:expense/configs/constants.dart';
import 'package:expense/controllers/userController.dart';
import 'package:expense/views/customText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userController = Get.find<CurrentUserController>();
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
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 40),
            CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage('/images/glori.jpg'),
            ),
            const SizedBox(height: 20),
            itemProfile('Username ', userController.user.value?.userName??"User", CupertinoIcons.person),
            const SizedBox(height: 10),
            itemProfile('Phone', userController.user.value?.phoneNo??"Uknown", CupertinoIcons.phone),
            const SizedBox(height: 10),
            itemProfile(
                'Address', userController.user.value?.address??"Uknown", CupertinoIcons.location),
            const SizedBox(height: 10),
            itemProfile(
                'Email', userController.user.value?.email??"Uknown", CupertinoIcons.mail),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
             // width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(20),
                    backgroundColor: primaryColor,
                    
                  ),
                  child: customText(label: 'Edit Profile',labelColor: appwhiteColor,)),
            )
          ],
        ),
      ),
    );
  }

  itemProfile(String title, String subtitle, IconData iconData) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 5),
                color: Colors.blueGrey,
                spreadRadius: 2,
                blurRadius: 10)
          ]),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(iconData),
        //trailing: Icon(Icons.arrow_forward, color: Colors.grey.shade400),
        tileColor: Colors.white,
      ),
    );
  }
}