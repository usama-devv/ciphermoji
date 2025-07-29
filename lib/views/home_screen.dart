import 'package:ciphermoji/view_model/controller/theme_controller.dart';
import 'package:ciphermoji/views/decrypt_screen.dart';
import 'package:ciphermoji/views/encrypt_screen.dart';
import 'package:ciphermoji/views/history_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view_model/controller/tab_controller.dart';

class HomeScreen extends StatelessWidget {
  final ThemeController themeController = Get.find();
  final MyTabController myTabController = Get.find();
  HomeScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(text: "Cipher", style: TextStyle(color: Colors.blue, fontSize: 22, fontWeight: FontWeight.bold),),
              TextSpan(text: "Moji", style: TextStyle(color: Colors.orange, fontSize: 22, fontWeight: FontWeight.bold),),
            ],
          ),
        ),
        backgroundColor: themeController.appBarColor,
        centerTitle: true,
        elevation: 4,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: GestureDetector(
              onTap: themeController.toggleTheme,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                width: 50,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: themeController.isDark.value
                      ? Colors.grey[800]
                      : Colors.yellow[600],
                ),
                child: Align(
                  alignment: themeController.isDark.value
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: Icon(
                      themeController.isDark.value
                          ? Icons.nightlight_round
                          : Icons.wb_sunny,
                      color: themeController.isDark.value
                          ? Colors.white
                          : Colors.orange,
                      size: 18,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
        bottom: TabBar(
          controller: myTabController.tabController,
          indicatorColor: Colors.orange,
          tabs: const [
            Tab(icon: Icon(Icons.lock), text: 'Encrypt'),
            Tab(icon: Icon(Icons.lock_open), text: 'Decrypt'),
            Tab(icon: Icon(Icons.history), text: 'History'),
          ],
        ),
      ),
      body: TabBarView(
        controller: myTabController.tabController,
        children: [
          EncryptScreen(),
          DecryptScreen(),
          HistoryScreen(),
        ],
      ),
    );
  }
}
