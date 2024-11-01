import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../core/config/colors.dart';
import '../controller/main_controller.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});
  final MainController controller = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    final double drawerWidth = MediaQuery.of(context).size.width * 0.66;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Dashboard",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: ColorConfig.textPrimaryColor,
          ),
        ),
        centerTitle: true,
        backgroundColor: ColorConfig.primaryColor,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: ColorConfig.textPrimaryColor),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      drawer: Drawer(
        width: drawerWidth,
        child: Obx(() {
          if (controller.userData.value != null) {
            final userData = controller.userData.value!.data;
            final avatarBytes = base64Decode(userData.avatar);
            final formattedDate = DateFormat('dd-MM-yyyy').format(DateTime.parse(userData.createDate));

            return ListView(
              padding: EdgeInsets.zero,
              children: [
                UserAccountsDrawerHeader(
                  accountName: Text(
                    userData.username,
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  accountEmail: Text(
                    "Joined on $formattedDate",
                    style: const TextStyle(color: Colors.white70),
                  ),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: MemoryImage(avatarBytes),
                    radius: 40,
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: ColorConfig.primaryGradient,
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.logout, color: ColorConfig.primaryColor),
                  title: const Text(
                    "Logout",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  onTap: () {
                    Get.offAllNamed('/login');
                  },
                ),
              ],
            );
          } else {
            return const Center(
              child: Text(
                "No user data available",
                style: TextStyle(fontSize: 18, color: ColorConfig.textSecondaryColor),
              ),
            );
          }
        }),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: ColorConfig.primaryGradient,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Obx(() {
            if (controller.isLoading.value) {
              return CircularProgressIndicator(
                color: ColorConfig.textPrimaryColor,
              );
            } else if (controller.userData.value != null) {
              final userData = controller.userData.value!.data;
              final avatarBytes = base64Decode(userData.avatar);

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: MemoryImage(avatarBytes),
                    backgroundColor: Colors.white.withOpacity(0.3),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Welcome, ${userData.username}",
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: ColorConfig.textPrimaryColor,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Joined on ${DateFormat('dd-MM-yyyy').format(DateTime.parse(userData.createDate))}",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: ColorConfig.textPrimaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return const Text(
                "No user data available",
                style: TextStyle(
                  fontSize: 18,
                  color: ColorConfig.textPrimaryColor,
                ),
              );
            }
          }),
        ),
      ),
    );
  }
}
