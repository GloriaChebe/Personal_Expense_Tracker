import 'package:get/get.dart';

class EntriesController extends GetxController {
  var entrieslist = [].obs;

  updateEntriesList(list) {
    entrieslist.value = list;
  }
}