import 'package:get/get.dart';
import 'package:expense/models/entriesModel.dart';

class EntriesController extends GetxController {
  var entriesList = <Entry>[].obs;

  void updateEntriesList(List<Entry> newList) {
    entriesList.clear();
    entriesList.addAll(newList);
  }
}
