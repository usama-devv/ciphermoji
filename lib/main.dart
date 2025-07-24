import 'package:ciphermoji/view_model/controller/tab_controller.dart';
import 'package:ciphermoji/view_model/controller/theme_controller.dart';
import 'package:ciphermoji/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ThemeController themeController = Get.put(ThemeController());
  final MyTabController tabController = Get.put(MyTabController());
  MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'CipherMoji',
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: themeController.theme,
        home: HomeScreen(),
      ),
    );
  }
}
