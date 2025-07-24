import 'package:ciphermoji/view_model/controller/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final ThemeController controller = Get.find();

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
        backgroundColor: controller.appBarColor,
        centerTitle: true,
        elevation: 4,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: GestureDetector(
              onTap: controller.toggleTheme,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                width: 50,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: controller.isDark.value
                      ? Colors.grey[800]
                      : Colors.yellow[600],
                ),
                child: Align(
                  alignment: controller.isDark.value
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: Icon(
                      controller.isDark.value
                          ? Icons.nightlight_round
                          : Icons.wb_sunny,
                      color: controller.isDark.value
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
      ),

    );
  }
}
