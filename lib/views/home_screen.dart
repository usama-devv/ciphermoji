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
          Obx(()=>Switch(value: controller.isDark.value, onChanged: (value){
            controller.toggleTheme();
          }),),
        ],
      ),
      
    );
  }
}
