import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = false;
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
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 4,
        actions: [
          Switch(value: isDark, onChanged: onChanged),
        ],
      ),
    );
  }
}
