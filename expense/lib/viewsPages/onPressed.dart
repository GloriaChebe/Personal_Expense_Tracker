import 'dart:convert';

import 'package:expense/views/customText.dart';
import 'package:expense/views/customTextField.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

  TextEditingController categoryIDController = TextEditingController();
    TextEditingController itemController = TextEditingController();
    TextEditingController amountController = TextEditingController();
final Map<String, int> categoryToIdMap = {
  'HOUSING': 1,
  'FOOD': 2,
  'CLOTHES': 3,
  'HEALTH': 4,
  'TRANSPORT': 5,
  'OTHER':6
  
};

String? selectedCategory;

class PressedPage extends StatefulWidget {
  const PressedPage({Key? key}) : super(key: key);

  @override
  _PressedPageState createState() => _PressedPageState();
}

class _PressedPageState extends State<PressedPage> {
  late TextEditingController userItemController;
  late TextEditingController userAmountController;

  @override
  void initState() {
    super.initState();
    userItemController = TextEditingController();
    userAmountController = TextEditingController();
  }

  @override
  void dispose() {
    userItemController.dispose();
    userAmountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customText(label: "Add New Expense"),
            SizedBox(height: 20),
            customText(label: 'Category'),
            SizedBox(width: 10),
            DropdownButtonFormField<String>(
              value: selectedCategory,
              onChanged: (String? newValue) {
                setState(() {
                  selectedCategory = newValue;
                });
              },
              items: [
                
                DropdownMenuItem(
                  value: 'HOUSING',
                  child: Text('HOUSING'),
                ),
                DropdownMenuItem(
                  value: 'FOOD',
                 child: Text('FOOD'),
                ),
                DropdownMenuItem(
                  value: 'CLOTHES',
                  child: Text('CLOTHES'),
                ),
                DropdownMenuItem(
                  value: 'HEALTH',
                  child: Text('HEALTH'),
                ),
                DropdownMenuItem(
                  value: 'TRANSPORT',
                  child: Text('TRANSPORT'),
                ),
                DropdownMenuItem(
                  value: 'OTHER',
                  child: Text('OTHER'),
                ),
                // Add more categories as needed
              ],
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customText(label: "Item"),
                customTextField(
                  userFieldController:itemController,
                  hint: "Enter item",
                ),
                SizedBox(height: 20),
                customText(label: "Amount"),
                customTextField(
                  userFieldController: amountController,
                  hint: "Enter amount",
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    serverSignup();
                    // Save functionality
                    // Example: You can access entered values using userItemController.text and userAmountController.text
                  },
                  child: Text("Save"),
                ),
                SizedBox(width: 50),
                ElevatedButton(
                  onPressed: () {
                    // Cancel functionality
                    // Example: You might want to clear the text fields here
                    userItemController.clear();
                    userAmountController.clear();
                  },
                  child: Text("Cancel"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
    Future<void> serverSignup() async {
    http.Response response;
    var body={
      'categoryID':categoryToIdMap [selectedCategory]!.toString(),
      'item': itemController.text.toString(),
      'amount': amountController.text.toString(),
      
};
    response = await http.post(
      Uri.parse("https://sanerylgloann.co.ke/ExpenseEase/createEntries.php"),
      body: body,
    );
    print(response.body);
    if (response.statusCode == 200) {
      var serverResponse = json.decode(response.body);
      int signedUp=serverResponse['success'];
      
      if (signedUp == 1) {
       
      } 
    }
}
}
