import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EncryptPage extends StatelessWidget {
  final TextEditingController messageController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final RxBool obscurePassword = true.obs;

  EncryptPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            // 🧾 Message Field
            Container(
              decoration: BoxDecoration(
                color: Get.isDarkMode ? Colors.white10 : Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(20),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: TextField(
                controller: messageController,
                maxLines: 5,
                style: TextStyle(
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
                decoration: InputDecoration(
                  hintText: "Enter your message...",
                  hintStyle: TextStyle(
                    color: Get.isDarkMode ? Colors.white54 : Colors.grey,
                  ),
                  prefixIcon: const Icon(Icons.message_outlined),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.all(16),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // 🔐 Password Field
            Obx(
              () => Container(
                decoration: BoxDecoration(
                  color: Get.isDarkMode ? Colors.white10 : Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(20),
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: TextField(
                  controller: passwordController,
                  obscureText: obscurePassword.value,
                  style: TextStyle(
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                  decoration: InputDecoration(
                    hintText: "Enter password...",
                    hintStyle: TextStyle(
                      color: Get.isDarkMode ? Colors.white54 : Colors.grey,
                    ),
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      icon: Icon(
                        obscurePassword.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        obscurePassword.value = !obscurePassword.value;
                      },
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.all(16),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),

            // 🔒 Encrypt Button
            GestureDetector(
              onTap: () {
                // Encrypt logic will go here
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: Get.isDarkMode
                        ? [Colors.tealAccent, Colors.greenAccent]
                        : [Colors.blueAccent, Colors.deepPurpleAccent],
                  ),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(30),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: const Center(
                  child: Text(
                    "Encrypt Message",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.1,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
