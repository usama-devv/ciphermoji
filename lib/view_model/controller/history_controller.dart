import 'package:get/get.dart';
import 'package:hive/hive.dart';

class HistoryController extends GetxController {
  final RxList<String> historyList = <String>[].obs;
  final Box box = Hive.box('historyBox');

  @override
  void onInit() {
    super.onInit();
    loadHistory();
  }

  void loadHistory() {
    historyList.value = List<String>.from(box.get('historyList', defaultValue: []));
  }

  void addToHistory(String text) {
    historyList.add(text);
    saveHistory();
  }

  void deleteFromHistory(int index) {
    historyList.removeAt(index);
    saveHistory();
  }

  void saveHistory() {
    box.put('historyList', historyList.toList());
  }
}
