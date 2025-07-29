import 'package:get/get.dart';
import 'package:hive/hive.dart';

class HistoryController extends GetxController {
  final RxList<String> historyList = <String>[].obs;
  late Box box;

  @override
  void onInit() {
    super.onInit();
    box = Hive.box('historyBox');
    loadHistory();
  }

  void loadHistory() {
    final List<String> storedHistory = List<String>.from(box.get('historyList', defaultValue: []));
    historyList.assignAll(storedHistory);
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
