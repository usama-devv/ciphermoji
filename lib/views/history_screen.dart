import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view_model/controller/history_controller.dart';

class HistoryScreen extends StatelessWidget {
  final HistoryController controller = Get.put(HistoryController());
  HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: controller.historyList.length,
      itemBuilder: (context, index) {
        final item = controller.historyList[index];
        return Dismissible(
          key: Key(item + index.toString()),
          direction: DismissDirection.endToStart,
          background: Container(
            color: Colors.red,
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: const Icon(Icons.delete, color: Colors.white),
          ),
          onDismissed: (direction) {
            controller.deleteFromHistory(index);
            Get.snackbar(
              'Deleted',
              'History item removed',
              snackPosition: SnackPosition.BOTTOM,
            );
          },
          child: ListTile(
            title: Text(item),
            leading: const Icon(Icons.history),
          ),
        );
      },
    );
  }
}
