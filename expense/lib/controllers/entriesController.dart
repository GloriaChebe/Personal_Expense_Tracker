import 'package:get/get.dart';
import 'package:expense/models/entriesModel.dart';

class EntriesController extends GetxController {
  var entriesList = <Entry>[].obs;
  var amount = 0.0.obs;

  void updateEntriesList(List<Entry> newList) {
    entriesList.clear();
    entriesList.addAll(newList);

    amount.value = 0;
    entriesList.forEach((element) {amount.value += double.parse(element.amount); });
  }
}
