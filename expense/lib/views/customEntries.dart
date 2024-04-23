import 'package:flutter/material.dart';
import 'package:get/get.dart';
class EntryController extends GetxController{
  var isLoading = false.obs;
}
class Entries extends StatelessWidget {
  final String imageUrl;
  final String titleText;
  final String subTitleText;
  final double amount;
  final VoidCallback onDelete;
  
  const Entries({
    required this.imageUrl,
    required this.titleText,
    required this.subTitleText,
    required this.amount,
    required this.onDelete,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EntryController());
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    child: Image.asset(imageUrl),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(titleText),
                      Text(subTitleText),
                    ],
                  ),
                ],
              ),
              SizedBox(width: 20),
              Row(
                children: [
                  Text(
                    "Ksh:$amount",
                  ),
                  Obx(() => controller.isLoading.value?
                  CircularProgressIndicator()
                  :IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: ()async{
                      print("here");
                      controller.isLoading.value = true;
                    onDelete();
                       controller.isLoading.value = false;
                    },
                  )),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
