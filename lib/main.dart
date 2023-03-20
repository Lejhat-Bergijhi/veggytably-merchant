import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/auth_controller.dart';
import 'views/login_page.dart';
import 'views/signup_page.dart';
import 'views/signup_page_2.dart';
import 'views/home_page.dart';
import 'views/profile_page.dart';
import 'views/addmenu_page.dart';
import 'views/editmenu_page.dart';
import 'views/edit_profile.dart';
import 'views/list_menu_page.dart';
import 'views/list_menu_2_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: BindingsBuilder(() {
        Get.put(AuthController());
      }),
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}
