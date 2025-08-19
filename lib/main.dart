import 'package:ciphermoji/view_model/controller/tab_controller.dart';
import 'package:ciphermoji/view_model/controller/theme_controller.dart';
import 'package:ciphermoji/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Hive.initFlutter();
    await Hive.openBox('historyBox');
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
