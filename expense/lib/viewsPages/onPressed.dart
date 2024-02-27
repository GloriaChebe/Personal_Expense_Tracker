import 'package:expense/views/customText.dart';
import 'package:expense/views/customTextField.dart';
import 'package:flutter/material.dart';

class PressedPage extends StatelessWidget {
  const PressedPage({super.key});

  @override
  Widget build(BuildContext context) {
     //TextEditingController userCategoryController = TextEditingController();
     
    TextEditingController userItemController = TextEditingController();
    TextEditingController userAmountController = TextEditingController();

    return  Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: Container(
        //height: 400,
        //width: 200,
        child: Padding(
          padding: const EdgeInsets.all(100.0),
          child: Column(
            children: [
              customText
                (label: "Add New Expense",),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  customText(label: 'Category'),
                  Icon(Icons.arrow_drop_down),
                ],
              ),
             SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customText(label: "item"),
                  customTextField(userFieldController: userItemController,hint:"enter item" ,),
                  SizedBox(height:20),
                   customText(label: "amount"),
                  customTextField(userFieldController: userAmountController,hint: "enter amount",),
                ],
              ),
             SizedBox(height:20),
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 ElevatedButton(onPressed: (){}, child: Text("Save")),
                 SizedBox(width: 100,),
                 ElevatedButton(onPressed: (){}, child: Text("Cancel")),
               ],
             )
          
            ],
          ),
        ),
      ),
    );
  }
}